	; Program name: "Area of Triangles". This program sort an array using modular
	; components that manage, input, output and sort the array.
	; Development Environment: [Linux Ubuntu 22.04]
	; NASM Version: [NASM 2.14.02]
	; Compilation Command: nasm -f elf64 -l fputs.lis -o fputs.o fputs.asm
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
	
	global fputs
	extern strlen
	
	section .data
	section .bss
	section .text
fputs:
	push rbp
	mov rbp, rsp
	push rbx
	push rcx
	push rdx
	push rsi
	push rdi
	push r8
	push r9
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
	pushf
	
	; Parameters
	mov r15, rdi
	
	mov rdi, r15
	call strlen
	mov r14, rax
	
	mov rax, 1
	mov rdi, 1
	mov rsi, r15
	mov rdx, r14
	syscall
	
	popf
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	pop rdi
	pop rsi
	pop rdx
	pop rcx
	pop rbx
	pop rbp
	
	ret
