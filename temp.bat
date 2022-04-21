@echo off
title Auto Delete Temp v1.0.2
set dir=%appdata%\plugins

cd %temp%
del /q *
