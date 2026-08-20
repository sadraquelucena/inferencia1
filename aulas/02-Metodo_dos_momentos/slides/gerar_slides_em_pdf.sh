#!/bin/bash

HTML=$(find . -maxdepth 1 -name "*.html" -type f -print -quit)

if [ -z "$HTML" ]; then
    echo "Erro: nenhum arquivo HTML encontrado."
    exit 1
fi

PDF="${HTML%.html}.pdf"

google-chrome \
  --headless \
  --no-sandbox \
  --disable-gpu \
  --virtual-time-budget=10000 \
  --print-to-pdf="$PDF" \
  --no-pdf-header-footer \
  "file://$(realpath "$HTML")?print-pdf"

if [ ! -f "$PDF" ]; then
    echo "Erro: PDF não foi gerado."
    exit 1
fi

echo ""
echo "Arquivos gerados:"
echo "  $HTML"
echo "  $PDF"
