@echo off
for %%i in (*.vsd*) do cscript convert.vbs "%~dp0%%i"
move *.pdf ../src/figures/
