section .data

SUCCESS equ 0
SYS_exit equ 60


n dw 6+1 ; nth+1  fibonacci currently for the nth  fibonacci result because my loop is like that  

prev_n_2 dd 0; for storing fib(n-2) | n = 0
prev_n_1 dd 1;  for storing fib(n-1) | n = 1

curr_fib dd 1; 

;**********************************************

section .text 
global _start
_start:

;fibonacci i am coming 

; check the nth number is not the 0  or 
cmp dword [n], 0
je  early_check_zero

cmp dword [n], 1
je  early_check_one



; in this loop i think we can have something where above 0 and 1 
; if it is 2 then by default the check would happen and it will run only one iter , if iti s more than that then it will more than that ..  

mov ecx, 2

fibLoop:
mov edx, dword [prev_n_1]
add edx, dword [prev_n_2]

; just for the nth fib answer
mov dword [curr_fib], edx

;move prev_n_1 value to the  prev_n_2 (we cant use the memory to memory mov command)
mov ebx , dword [prev_n_1]
mov dword [prev_n_2], ebx
; now result will be moved to the prev_n_1  
mov dword [prev_n_1], edx

inc ecx
cmp cx, word [n]
jne fibLoop

jmp last ;after the loop i expect it to go last label

early_check_one:
mov edx, dword [prev_n_1]
mov dword [curr_fib], edx
jmp last

early_check_zero:
mov edx, dword [prev_n_2]
mov dword [curr_fib], edx
jmp last


last:
mov rax, SYS_exit 
mov rdi, SUCCESS
syscall
