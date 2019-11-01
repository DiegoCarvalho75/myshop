#!/bin/bash

# cd Testes
# ./adb_commands.bash

# adb shell getevent -l

# Drawer
adb $1 shell input tap 90 90

# Drawer >> Gerenciar Produtos
adb $1 shell input tap 280 610

# Gerenciar Produtos >> +  
adb $1 shell input tap 660 90




