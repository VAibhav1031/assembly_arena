
section .data

SUCCESS  equ 0
SYS_exit equ 60


n dd 10
sum_of_sq dq 0


section .text
global _start
_start:


mov rbx , 1
mov ecx, dword[n]

sumLoop:
mov rax , rbx
mul rax
add qword [sum_of_sq], rax
inc rbx
loop sumLoop ; rcx which we use  to decrement after everything , cause there is 

; so loop sumLoop name is just the way we can do easil (not in the nested loop cause for the rcx would be overwritten and that would be fiasco) 
; dec
; cmp rcx, 0
; jne sumLoop


last:
mov rax, SYS_exit 
mov rdi, SUCCESS
syscall
