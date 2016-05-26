#!/bin/bash

for f in *.svg; do
	inkscape $f --export-pdf "${f%.svg}.pdf"
done
