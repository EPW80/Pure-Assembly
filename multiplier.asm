	; Program name: "Area of Triangles". This program sort an array using modular
	; components that manage, input, output and sort the array.
	; Development Environment: [Linux Ubuntu 22.04]
	; NASM Version: [NASM 2.14.02]
	; Compilation Command: nasm -f elf64 -l multiplier.lis -o multiplier.o multiplier.asm
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
	
	global multiplier
	
	segment .bss
	;This section (or segment) is for declaring empty arrays
	
	align 64
	; required for xstor and xrstor instructions
	backup_storage_area resb 832
	
	segment .text
multiplier:
	
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
	; backup all other registers (not GPRs)
	mov rax, 7
	mov rdx, 0
	xsave [backup_storage_area]
	; - - - - - - - - - - END SEGMENT .TEXT ~PRE~ REQS - - - - - - - - - - - - ;
	
	; work on ~numerator~
	movsd xmm15, xmm0            ; (x) = angle
	mov r10, rdi
	movsd xmm14, xmm15
	mulsd xmm14, xmm14           ; xmm14 = (x^2)
	mov r15, - 1
	cvtsi2sd xmm13, r15          ; xmm13 = ( - 1.0)
	mulsd xmm14, xmm13           ; xmm14 = ( - 1) * (x^2)
	
	; work on ~denominator~
	mov rax, 2
	mul r10                      ; !!mul by 2 from rax!!
	add r10, 2                   ; r10 = (2n + 2)
	mov r11, r10                 ; r11 = (2n + 2)
	inc r11                      ; r11 = (2n + 3)
	mov rax, r11
	mul r10                      ; r10 = (denominator)
	cvtsi2sd xmm12, r10          ; xmm12 is the (denominator)
	divsd xmm14, xmm12           ; xmm14 has the (answer)
	
	; put ~answer~ on stack
	push qword 0
	push qword 0
	movsd [rsp], xmm14
	
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
	
	; return the answer
	movsd xmm0, [rsp]
	pop rax
	pop rax
	
	ret
