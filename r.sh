#!/bin/bash

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


echo "Assemble the source file multiplier.asm"
nasm -f elf64 -l multiplier.lis -o multiplier.o multiplier.asm

echo "Assemble the source file sin.asm"
nasm -f elf64 -l sin.lis -o sin.o sin.asm

echo "Assemble the source file strlen.asm"
nasm -f elf64 -l strlen.lis -o strlen.o strlen.asm

echo "Assemble the source file producer.asm"
nasm -f elf64 -l producer.lis -o producer.o producer.asm

echo "Assemble the source file fgets.asm"
nasm -f elf64 -l fgets.lis -o fgets.o fgets.asm

echo "Assemble the source file fputs.asm"
nasm -f elf64 -l fputs.lis -o fputs.o fputs.asm

echo "Compile the source file main.c"
gcc -m64 -Wall -no-pie -o main.o -std=c2x -c main.c

echo "Compile the source file ftoa.c"
gcc -m64 -Wall -no-pie -o ftoa.o -std=c2x -c ftoa.c

echo "Link the object modules to create an executable file"
gcc -m64 -no-pie -o sin.out fputs.o fgets.o ftoa.o producer.o strlen.o sin.o multiplier.o main.o -Wall -z noexecstack -lm

echo "Execute the program to sin"
chmod +x sin.out
./sin.out

echo "This bash script will now terminate."

# clean up
rm *.o
rm *.out
rm *.lis