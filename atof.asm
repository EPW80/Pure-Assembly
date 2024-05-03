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
	
	;Assembler directives
	base_number equ 10           ;10 base of the decimal number system
	ascii_zero equ 48            ;48 is the ascii value of '0'
	null equ 0
	minus equ ' - '
	decimal_point equ '.'
	
	;Global declaration for linking files.
	global atof                  ;This makes atolong callable by functions outside of this file.
	
	segment .data                ;Place initialized data here
	;This segment is empy
	
	segment .bss
	;Declare pointers to un - initialized space in this segment.
	align 64
	;This segment is empty
	; [ 12.34, 23.5] resq (64 bits)
	; ['a', 'b', 'c'] (8 bits (1 byte) per element)
	float_as_string_arr resb 100
	;This section (or segment) is for declaring empty array
	; required for xstor and xrstor instructions
	backup_storage_area resb 832
	
	;==============================================================================================================================
	;===== Begin the executable code here.
	;==============================================================================================================================
	segment .text                ;Place executable instructions in this segment.
	
atof:                         ;Entry point. Execution begins here.
	
	; - - - - - - - - - BEGIN SEGMENT .TEXT ~PRE~ REQS - - - - - - - - - - ;
	; backup GPRs (General Purpose Registers)
	push rbp
	mov rbp, rsp
	push rbx
	push rcx
	push rdx
	push rdi
	push rsi
	push r8
	push r9
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
	pushf
	; backup all other registers (meaning not GPRs)
	mov rax, 7
	mov rdx, 0
	xsave [backup_storage_area]
	; - - - - - - - - - - END SEGMENT .TEXT ~PRE~ REQS - - - - - - - - - - - - ;
	
	; save the arguments
	movsd xmm15, xmm0
	; multiply by 10 until we get this - > 15623
	
	xorpd xmm12, xmm12           ; just to have a 0.0 to compare
	; 156.23 - > 15623
	mov r11, 0
whileLoop:
	; 156.23 - 156
	; original_num - int_converted_num
	; original_num - the original float is in xmm15
	cvtsd2si r15, xmm15          ; original_num
	cvtsi2sd xmm14, r15          ; int_converted_num
	
	movsd xmm13, xmm15
	subsd xmm13, xmm14           ; xmm13 = original_num - int_converted_num
	
	ucomisd xmm13, xmm12
	je OutOfLoop
	; else
	mov rax, 10
	cvtsi2sd xmm11, rax
	; 156.23 * 10 - > 1562.3
	mulsd xmm15, xmm11
	inc r11
	jmp whileLoop
	
OutOfLoop:
	; - - - - - - - - - - - - ; - - - - - - - - - - - BEGIN SEGMENT .TEXT ~POST~ REQS - - - - - - - - - - - - ; - - - - - - - - - - - - - - - - ;
	;Restore the values to non - GPRs
	mov rax, 7
	mov rdx, 0
	xrstor [backup_storage_area]
	;Restore the GPRs
	popf
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	pop rsi
	pop rdi
	pop rdx
	pop rcx
	pop rbx
	pop rbp                      ;Restore rbp to the base of the activation record of the caller program
	; - - - - - - - - - - - - - ; - - - - - - - - - - END SEGMENT .TEXT ~POST~ REQS - - - - - - - - - - - - - - ; - - - - - - - - - - - - - - - - ;
	
	;Now the system stack is in the same state it was when this function began execution.
	ret                          ;Pop a qword from the stack into rip, and continue executing..
	;========== End of module atol.asm ================================================================================================
	;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3 * * 
