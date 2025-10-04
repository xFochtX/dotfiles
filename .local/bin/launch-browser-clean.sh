#!/bin/bash

BROWSER="$1"
shift # Elimina el primer argumento ($1), el resto se pasa al navegador

case "$BROWSER" in
chrome)
  /usr/bin/google-chrome-stable --ozone-platform=x11 "$@"
  ~/dotfiles/.local/bin/clear-browser-history.sh chrome
  ;;
chromium)
  /usr/bin/chromium --ozone-platform=x11 "$@"
  ~/dotfiles/.local/bin/clear-browser-history.sh chromium
  ;;
firefox)
  /usr/bin/firefox "$@"
  ~/dotfiles/.local/bin/clear-browser-history.sh firefox
  ;;
*)
  exit 1
  ;;
esac
