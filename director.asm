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

	extern producer
	
	max_length equ 256
	
	section .data
	welcome_msg db "Welcome to Marvelous Erik's Area Machine.", 10, 0
	result_msg db "We compute all your areas.", 10, 10, 0
    ; prompt_number db "Please enter a float number: ", 0
	driver_msg db "The driver received this number 47.62935 and will keep it.", 10, 0
	conclusion_msg db "A zero will be sent to the OS as a sign of successful conclusion.", 10, 0
	bye_msg db "Bye.", 10, 0
	
	newline db 10
	
	section .bss
	; nice_number resb max_length
	
	section .text
_start:
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
	
	; Print welcome message
	mov rax, 1                   ; syscall number for write
	mov rdi, 1                   ; file descriptor 1 for stdout
	mov rsi, welcome_msg         ; address of message to print
	mov rdx, 42                  ; length of the message
	syscall
	
	; Print result message
	mov rax, 1
	mov rdi, 1
	mov rsi, result_msg
	mov rdx, 28
	syscall

	call producer

	; Output newline
	mov rax, 1
	mov rdi, 1
	mov rsi, newline
	mov rdx, 1
	syscall
	
	; Print driver message
	mov rax, 1
	mov rdi, 1
	mov rsi, driver_msg
	mov rdx, 60
	syscall
	
	; Print conclusion message
	mov rax, 1
	mov rdi, 1
	mov rsi, conclusion_msg
	mov rdx, 66
	syscall
	
	; Print bye message
	mov rax, 1
	mov rdi, 1
	mov rsi, bye_msg
	mov rdx, 5
	syscall
	
	; Exit
	mov rax, 60
	mov rdi, 0
	syscall
	
	; Restore registers
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
