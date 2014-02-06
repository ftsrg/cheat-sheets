@echo off
cscript convert.vbs %1
move *.pdf ../src/figures/
