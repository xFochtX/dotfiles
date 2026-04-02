#!/usr/bin/env python3

import requests
import os
import json

URL = "https://0aa8003d044687b280a3035c00b500f0.web-security-academy.net/"
WORDLIST = "headers.txt"
TEST_VALUE = "prueba123"

OUTPUT_DIR = "responses"
BODY_DIR = os.path.join(OUTPUT_DIR, "body")
HEADERS_DIR = os.path.join(OUTPUT_DIR, "headers")
STATUS_FILE = os.path.join(OUTPUT_DIR, "status_code.json")

def load_headers_from_raw(file_path):
  headers = {}

  with open(file_path, "r", encoding="utf-8") as f:
    lines = f.readlines()

  for line in lines:
    line = line.strip()

    # Saltar request line (GET / HTTP/2)
    if not line or line.startswith(("GET", "POST", "PUT", "DELETE", "PATCH")):
      continue

    if ":" in line:
      key, value = line.split(":", 1)
      headers[key.strip()] = value.strip()

  # Limpieza de headers basura
  IGNORED_HEADERS = {
    "Content-Length",
    "Connection",
    "Upgrade-Insecure-Requests",
    "Priority",
    "Te"
  }

  headers = {
    k: v for k, v in headers.items()
    if k not in IGNORED_HEADERS
  }

  return headers

BASE_HEADERS = load_headers_from_raw("request-burpsuite.txt")

# Crear carpeta si no existe
os.makedirs(BODY_DIR, exist_ok=True)
os.makedirs(HEADERS_DIR, exist_ok=True)

def sanitize_filename(name):
  return name.replace("/", "_").replace(" ", "_")

def main():
  with open(WORDLIST) as f:
    headers_list = [h.strip() for h in f if h.strip()]

  status_results = {}

  for i, header in enumerate(headers_list, start=1):
    try:
      dynamic_url = f"{URL}?cb={i}"
      headers = BASE_HEADERS.copy()
      headers[header] = TEST_VALUE

      r = requests.get(dynamic_url, headers=headers, timeout=10)

      safe_name = sanitize_filename(header)
      
      # ---- Generar diccionario STATUS CODE ----
      status_results[header] = r.status_code
      
      # ---- Guardar BODY ----
      body_path = os.path.join(BODY_DIR, safe_name + ".html")
      with open(body_path, "w", encoding="utf-8") as out:
        out.write(r.text)

      # ---- Guardar HEADERS ----
      headers_path = os.path.join(HEADERS_DIR, safe_name + ".json")
      with open(headers_path, "w", encoding="utf-8") as out:
        json.dump(dict(r.headers), out, indent=2)

      print(f"[+] {header} -> {r.status_code}")

    except Exception as e:
      print(f"[!] Error con {header}: {e}")

  # Guardar STATUS CODE
  with open(STATUS_FILE, "w", encoding="utf-8") as f:
      json.dump(status_results, f, indent=2)

if __name__ == "__main__":
  main()
