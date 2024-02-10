#!/usr/bin/env bash

IMG="$DOCUMENT_WORKING_PATH"

if [ "${IMG#*.}" == "pdf" ]; then
	echo "$DOCUMENT_SOURCE_PATH: PDF file, not trying to detect orientation"
	exit 0
fi

tmpfile=$(mktemp -p /tmp XXXXXXXXXXX.png)
convert "$IMG" -lat 300x300 "$tmpfile"

rotation=$(tesseract --dpi 300 --psm 0 "$tmpfile" stdout | egrep "^Orientation in degrees:\s+[0-9]+" | awk -F: '{print $2;}' | tr -d " ")
if [ -z "$rotation" ]; then
    echo "$DOCUMENT_SOURCE_PATH: Cannot detect page orientation"
    rm "$tmpfile"
    exit 0
fi

echo "$DOCUMENT_SOURCE_PATH: orientation '$rotation'"

if [ "$rotation" != "0" ]; then
	convert "$IMG" -rotate -$rotation "$IMG"
fi

rm "$tmpfile"
