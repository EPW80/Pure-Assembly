#!/bin/bash

# Program name: "Area of Triangles". This program sorts an array using modular
# components that manage, input, output, and sort the array.
# Development Environment: [Linux Ubuntu 22.04]
# NASM Version: [NASM 2.14.02]
# Compilation Command: nasm - f elf64 - o executive.o executive.asm
# Processor Architecture: [x86_64]
# Floating - Point Standard: IEEE 754
# Copyright (C) <2024> <Erik Williams>

# This file is part of the software program "Area of Triangles".

# Area of Triangles is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# Area of Triangles is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>. 

# Author information
# Author name : Erik Williams
# Author email: epwilliams@csu.fullerton.edu
# Author CWID : #####

#Delete some un-needed files
rm *.o
rm *.out

echo "Assemble the source file atof.asm"
nasm -f elf64 -l atof.lis -o atof.o atof.asm

echo "Assemble the source file ftoa.asm"
nasm -f elf64 -l ftoa.lis -o ftoa.o ftoa.asm

echo "Assemble the source file multiplier.asm"
nasm -f elf64 -l multiplier.lis -o multiplier.o multiplier.asm

echo "Assemble the source file sin.asm"
nasm -f elf64 -l sin.lis -o sin.o sin.asm

echo "Assemble the source file strlen.asm"
nasm -f elf64 -l strlen.lis -o strlen.o strlen.asm

echo "Assemble the source file producer.asm"
nasm -f elf64 -l producer.lis -o producer.o producer.asm

echo "Assemble the source file director.asm"
nasm -f elf64 -l director.lis -o director.o director.asm

echo "Assemble the source file fgets.asm"
nasm -f elf64 -l fgets.lis -o fgets.o fgets.asm

echo "Assemble the source file fputs.asm"
nasm -f elf64 -l fputs.lis -o fputs.o fputs.asm

echo "Link the object modules to create an executable file"
gcc -m64 -no-pie -o sin.out fputs.o fgets.o director.o producer.o strlen.o sin.o multiplier.o ftoa.o atof.o -Wall -z noexecstack -lm

echo "Execute the program to sin"
chmod +x sin.out
./sin.out

echo "This bash script will now terminate."
