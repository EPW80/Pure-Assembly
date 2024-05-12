//  Program name: "Area of Triangles". This program sort an array using modular
//  components that manage, input, output and sort the array.
//  Development Environment: [Linux Ubuntu 22.04]
//  NASM Version: [NASM 2.14.02]
//  Compilation Command: gcc -m64 -Wall -no-pie -o main.o -std=c2x -c main.c
//  Processor Architecture: [x86_64]
//  Floating - Point Standard: IEEE 754
//  Copyright (C) <2024> <Erik Williams>

//  This file is part of the software program "Area of Triangles".

//  Area of Triangles is free software: you can redistribute it and / or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.

//  Area of Triangles is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
//  GNU General Public License for more details.

//  You should have received a copy of the GNU General Public License
//  along with this program. If not, see <https: / / www.gnu.org / licenses / >.

//  Author information
//  Author name : Erik Williams
//  Author email: epwilliams@csu.fullerton.edu

#include <stdio.h>

extern double producer();

int main(void)
{
    printf("Welcome to Erik's Area Machine.\nWe compute all your areas.\n");
    double number = producer();
    printf("The driver received this number %lf and will keep it.\n", number);
    printf("A zero will be sent to the OS as a sign of successful conclusion.\nBye Bye!.\n");

    return 0;
}