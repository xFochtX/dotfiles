#!/bin/bash

# Chequea cuantos paquetes necesitan actualización
updates=$(checkupdates 2>/dev/null | wc -l)

if [[ $updates -gt 0 ]]; then
  echo "{\"text\":\" $updates\",\"tooltip\":\"$updates updates available\"}"
else
  echo "{\"text\":\"\",\"tooltip\":\"Up to date\"}"
fi
