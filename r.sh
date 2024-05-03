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

nasm -f elf64 -o director.o director.asm

nasm -f elf64 -o producer.o producer.asm

nasm -f elf64 -o strlen.o strlen.asm

nasm -f elf64 -o fputs.o fputs.asm

nasm -f elf64 -o ftoa.o ftoa.asm

nasm -f elf64 -o itoa.o itoa.asm

nasm -f elf64 -o fgets.o fgets.asm

nasm -f elf64 -o atof.o atof.asm

nasm -f elf64 -o sin.o sin.asm

nasm -f elf64 -o multiplier.o multiplier.asm

echo "Link the X86 assembled code"
ld  -o pure-assembly.out director.o producer.o strlen.o fputs.o ftoa.o itoa.o fgets.o atof.o sin.o multiplier.o -g

echo "Run the executable file"
chmod +x pure-assembly.out
./pure-assembly.out

rm *.o
rm *.out