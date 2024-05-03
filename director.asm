	; Program name: "Area of Triangles". This program sort an array using modular
	; components that manage, input, output and sort the array.
	; Development Environment: [Linux Ubuntu 22.04]
	; NASM Version: [NASM 2.14.02]
	; Compilation Command: nasm - f elf64 - o executive.o executive.asm
	; Processor Architecture: [x86_64]
	; Floating - Point Standard: IEEE 754
	; Copyright (C) <2024> <Erik Williams>
	
	; This file is part of the software program "Area of Triangles".
	
	; Area of Triangles is free software: you can redistribute it and / or modify
	; it under the terms of the GNU General Public License as published by
	; the Free Software Foundation, either version 3 of the License, or
	; (at your option) any later version.
	
	; Area of Triangles is distributed in the hope that it will be useful, 
	; but WITHOUT ANY WARRANTY; without even the implied warranty of
	; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
	; GNU General Public License for more details.
	
	; You should have received a copy of the GNU General Public License
	; along with this program. If not, see <https: / / www.gnu.org / licenses / >.
	
	; Author information
	; Author name : Erik Williams
	; Author email: epwilliams@csu.fullerton.edu
	; Author CWID : ####
	
	global _start
	
	extern fputs
	extern fgets
	extern ftoa
	extern producer
	
	max_length equ 256
	
	section .data
	
	msg_welcome db "Welcome to Marvelous Erik's Area Machine.", 10, 0
	msg_purpose db "We compute all your areas.", 10, 0
	msg_aofd db "The driver received this number ", 0
	msg_bofd db " and will keep it. ", 10, 0
	msg_cofd db "A zero will be sent to the OS as a sign of successful conclusion.", 10, 0
	msg_dofd db "Bye", 10, 0
	
	section .bss
	
	nice_number resb max_length
	
	section .text
_start:
	mov rdi, msg_welcome
	call fputs
	
	mov rdi, msg_purpose
	call fputs
	
	call producer
	movsd xmm15, xmm0
	mov rax, 1
	call ftoa
	mov [nice_number], rax
	
	mov rdi, msg_aofd
	call fputs
	
	mov rdi, nice_number
	call fputs
	
	mov rdi, msg_bofd
	call fputs
	
	mov rdi, msg_cofd
	call fputs
	
	mov rdi, msg_dofd
	call fputs
	
	; Exit
	mov rax, 60
	mov rdi, 0
	syscall
