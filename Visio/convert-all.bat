@echo off
for %%i in (*.vsdx) do cscript convert.vb %%i
move *.pdf ../src/figures/
