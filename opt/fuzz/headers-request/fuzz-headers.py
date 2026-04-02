#!/usr/bin/env python3

import httpx
import asyncio
import os
import json
import random
import string

# 🎯 URL objetivo donde se enviarán las requests
URL = "https://0a0700c1047e558682804d1c00cc009f.h1-web-security-academy.net/"

# 📂 Wordlist de headers a fuzzear (uno por línea)
WORDLIST = os.path.expanduser("~/dotfiles/opt/wordlists/headers/h0tak88r")

# 🧪 Genera un valor aleatorio tipo dominio para inyectar en cada header
# Esto ayuda a detectar:
# - reflection
# - comportamiento dinámico
# - validaciones del servidor
def random_value():
  return ''.join(random.choices(string.ascii_lowercase, k=8)) + ".com"

# 📁 Directorios de salida
OUTPUT_DIR = "responses"

# Guarda el body HTML de cada respuesta
BODY_DIR = os.path.join(OUTPUT_DIR, "body")

# Guarda los headers de cada respuesta en formato JSON
HEADERS_DIR = os.path.join(OUTPUT_DIR, "headers")

# Guarda el status code de cada request (resumen final)
STATUS_FILE = os.path.join(OUTPUT_DIR, "status_code.json")

# 🔧 Nivel de concurrencia (threads async)
# Más alto = más rápido pero más detectable / inestable
CONCURRENCY = 20

# 📥 Carga headers base desde un request raw (exportado de Burp Suite)
# - Ignora la request line (GET / POST ...)
# - Filtra headers problemáticos o irrelevantes
# - Devuelve un dict listo para reutilizar
def load_headers_from_raw(file_path):
  headers = {}

  with open(file_path, "r", encoding="utf-8") as f:
    lines = f.readlines()

  for line in lines:
    line = line.strip()

    # Ignorar líneas vacías y método HTTP
    if not line or line.startswith(("GET", "POST", "PUT", "DELETE", "PATCH")):
      continue

    # Parsear header: valor
    if ":" in line:
      key, value = line.split(":", 1)
      headers[key.strip()] = value.strip()

  # ❌ Headers que pueden romper requests o no aportan valor al fuzzing
  IGNORED_HEADERS = {
    "Content-Length",
    "Connection",
    "Upgrade-Insecure-Requests",
    "Priority",
    "Te"
  }

  return {k: v for k, v in headers.items() if k not in IGNORED_HEADERS}

# 📦 Headers base reutilizados en cada request
BASE_HEADERS = load_headers_from_raw("request-burpsuite.txt")

# 📁 Crear estructura de salida si no existe
os.makedirs(BODY_DIR, exist_ok=True)
os.makedirs(HEADERS_DIR, exist_ok=True)

# 🧼 Sanitiza nombres de archivo para evitar problemas en el filesystem
def sanitize_filename(name):
  return name.replace("/", "_").replace(" ", "_")

# ⚙️ Worker async que:
# - Inyecta un header
# - Envía request
# - Guarda respuesta
# - Registra status code
async def worker(client, sem, header, i, total, status_results):
  async with sem:
    # 🐢 Delay aleatorio para evitar rate-limit / detección
    await asyncio.sleep(random.uniform(0.3, 0.8))

    try:
      # 🎲 Parámetro aleatorio para evitar caching del servidor
      url = f"{URL}?id={random.randint(1,100000)}"

      # 🧪 Clonar headers base e inyectar el header en fuzz
      headers = BASE_HEADERS.copy()
      headers[header] = random_value()

      # 🚀 Enviar request
      r = await client.get(url, headers=headers)

      safe_name = sanitize_filename(header)

      # 💾 Guardar BODY (HTML)
      with open(os.path.join(BODY_DIR, safe_name + ".html"), "w", encoding="utf-8") as f:
        f.write(r.text)

      # 💾 Guardar HEADERS de la respuesta
      with open(os.path.join(HEADERS_DIR, safe_name + ".json"), "w", encoding="utf-8") as f:
        json.dump(dict(r.headers), f, indent=2)

      # 📊 Registrar status code
      status_results[header] = r.status_code

      print(f"[+] ({i}/{total}): {header} -> {r.status_code}")

    except Exception as e:
      # ⚠️ Error en request (timeout, conexión, etc.)
      print(f"[!] ({i}/{total}) Error con {header}: {e}")


# 🧠 Función principal:
# - Carga wordlist
# - Configura cliente HTTP
# - Lanza tareas async
# - Guarda resultados finales
async def main():
  # 📥 Leer wordlist de headers
  with open(WORDLIST) as f:
    headers_list = [h.strip() for h in f if h.strip()]

  total = len(headers_list)

  # 📊 Diccionario para almacenar status codes finales
  status_results = {}

  # 🚦 Control de concurrencia
  sem = asyncio.Semaphore(CONCURRENCY)

  # 🔌 Límites de conexiones HTTP
  limits = httpx.Limits(
    max_connections=CONCURRENCY,
    max_keepalive_connections=CONCURRENCY
  )

  # ⏱️ Timeout global por request
  timeout = httpx.Timeout(10.0)

  # 🌐 Cliente HTTP async
  async with httpx.AsyncClient(
    limits=limits,
    timeout=timeout,
    follow_redirects=False,  # importante para análisis real
  ) as client:

    # 🧵 Crear tareas async para cada header
    tasks = [
      worker(client, sem, header, i, total, status_results)
      for i, header in enumerate(headers_list, start=1)
    ]

    # ⚡ Ejecutar todas las tareas concurrentemente
    await asyncio.gather(*tasks)

  # 💾 Guardar resumen final de status codes
  with open(STATUS_FILE, "w", encoding="utf-8") as f:
    json.dump(status_results, f, indent=2)


# 🚪 Punto de entrada
if __name__ == "__main__":
  asyncio.run(main())
