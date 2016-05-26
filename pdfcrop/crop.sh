#!/bin/bash

for f in *.pdf; do
	g=${f%.*}
	pdfcrop $g.pdf && mv $g-crop.pdf $g.pdf
done
