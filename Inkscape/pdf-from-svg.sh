#!/bin/bash

for f in *.svg; do
  inkscape -D -z --file=$f --export-pdf "${f%.svg}.pdf"
done
