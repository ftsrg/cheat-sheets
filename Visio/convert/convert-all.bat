@echo off
for %%i in (*.vsdx) do cscript convert.vbs %~dp0%%i
move *.pdf ../src/figures/
