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
	
	global producer
	
	extern strlen
	extern fputs
	extern fgets
	extern atof

    max_length equ 256
	
	section .data
	
    prompt_side1 db "Please enter the length of side 1: ", 0
    prompt_side2 db "Please enter the length of side 2: ", 0
    prompt_angle3 db "Please enter the degrees of the angle between: ", 0
	
    areaMsg db "The area of this triangle is: ", 10, 0
	thankYouMsg db "Thank you for using an Erik product.", 10, 0
	
	newline db 10
	
	section .bss
	nice_number resb max_length  ; Reserve 20 bytes for the area as string
	
	section .text
producer:
	; Back up components
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
	
	; Print prompt 1
	mov rdi, prompt_side1
	call fputs
	
	; Read number
	mov rdi, nice_number
	mov rsi, 10
	call fgets
	
	; Convert number
	mov rdi, nice_number
	call atof
	
	; Print prompt 2
	mov rdi, prompt_side2
	call fputs
	
	; Read number
	mov rdi, nice_number
	mov rsi, 10
	call fgets
	
	; Convert number
	mov rdi, nice_number
	call atof
	
	; Print prompt 3
	mov rdi, prompt_angle3
	call fputs
	
	; Read number
	mov rdi, nice_number
	mov rsi, 10
	call fgets
	
	; Convert number
	mov rdi, nice_number
	call atof

    ; Output newline
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall
	
	; Example of calculation and displaying results (skipping actual calculation for now)
	mov rax, 1
	mov rdi, 1
	mov rsi, areaMsg
	mov rdx, 31
	syscall
	
	; Display thank you message
	mov rax, 1
	mov rdi, 1
	mov rsi, thankYouMsg
	mov rdx, 38
	syscall
	
	;Restore the original values to the GPRs
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
	
	; Clean up
	ret
