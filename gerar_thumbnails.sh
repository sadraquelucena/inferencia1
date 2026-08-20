#!/bin/bash

find aulas -type f -name "*.pdf" | while read -r PDF
do
    DIR=$(dirname "$PDF")
    THUMB="$DIR/thumb.png"

    if [ -f "$THUMB" ] && [ "$THUMB" -nt "$PDF" ]; then
        continue
    fi

    echo "Gerando thumbnail: $PDF"

    pdftoppm \
        -f 1 \
        -singlefile \
        -png \
        -r 120 \
        "$PDF" \
        "${THUMB%.png}"
done

echo ""
echo "Thumbnails atualizadas."
