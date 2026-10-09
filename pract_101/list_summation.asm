section .data

EXIT_SUCCESS equ 0  
SYS_exit    equ 60

section .data
lst dd 1002, 1004, 1006, 1008, 1012
len dd 5
sum dd 0

section .text
global _start
_start:



;summation loop 

mov ecx, dword [len]
mov rsi , 0 
mov ebx, 0

;for debuggin version, so that we can see the total sum
summationLoop:
mov eax , dword [lst+rsi*4]
add ebx, eax
mov dword [sum], ebx

inc rsi
loop summationLoop ; 



;simpler one
; summationLoop:
; mov eax , dword [lst+rsi*4]
; add dword [sum], eax
;
; inc rsi
;
; loop summationLoop


last:
mov rax, SYS_exit 
mov rdi, EXIT_SUCCESS
syscall
