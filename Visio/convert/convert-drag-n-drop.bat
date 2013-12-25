@echo off
cscript convert.vb %1
move *.pdf ../src/figures/
