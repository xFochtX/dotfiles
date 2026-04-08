#!/usr/bin/env python3

from pathlib import Path
import json

# Rutas
HEADERS_DIR = Path.cwd() / 'responses' / 'headers'

# Valor estándar a comparar
STANDARD_CL = "1839"

# Guardar resultados
results = []

# Recorrer todos los JSON en headers
print("-" * 50)
for header_file in HEADERS_DIR.glob("*.json"):
  with open(header_file, encoding="utf-8") as f:
    data = json.load(f)

  cl = data.get("content-length")  # Puede ser None si no existe

  if cl != STANDARD_CL:
    # Registrar el archivo y su Content-Length
    # Convertimos Content-Length a entero si es posible para ordenar correctamente
    try:
      cl_int = int(cl)
    except (ValueError, TypeError):
      cl_int = float('inf')  # Si no se puede convertir, lo ponemos al final
    results.append((header_file.name, cl_int))

# Ordenar por Content-Length (de menor a mayor)
results.sort(key=lambda x: x[1])

# Imprimir todo de golpe
for file_name, cl in results:
  print(f"{file_name} -> Content-Length: {cl}")
print("-" * 50)
# Resumen final
print(f"\nTotal archivos con Content-Length != {STANDARD_CL}: {len(results)}\n")
