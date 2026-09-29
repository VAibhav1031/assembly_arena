

; Same but now we have to evaluate everything based ont he signed  usage ,even though metrics we can chaneg or something like whatever 
;1. wAns1 = wNum1 + wNum2
;2. wAns2 = wNum1 + wNum3
;3. wAns3 = wNum3 + wNum4
;4. wAns6 = wNum1 – wNum2
;5. wAns7 = wNum1 – wNum3
;6. wAns8 = wNum2 – wNum4
;7. dAns11 = wNum1 * wNum3
;8. dAns12 = wNum2 * wNum2
;9. dAns13 = wNum2 * wNum4
;10. wAns16 = wNum1 / wNum2
;11. wAns17 = wNum3 / wNum4
;12. wAns18 = dNum1 / wNum4
;13. wAns18 = dNum1 % wNum4

; unsigned 
; variable initial chart represnt the type they will be used


section .data 

EXIT_SUCCESS equ 0
SYS_exit    equ 60

; word variable
wNum1 dw 5
wNum2 dw -6
wNum3 dw -34 
wNum4 dw 12


; word answer variable 
wAns1 db 0
wAns2 db 0
wAns3 db 0
wAns4 db 0
wAns6 db 0
wAns7 db 0
wAns8 db 0

wAns16 db 0
wAns17 db 0
wAns18 db 0

wRem18 db 0

; double word variable

dNum1 dd 21

; double  word  Answer variables

dAns11 dd 0
dAns12 dd 0
dAns13 dd 0


; ------------------------

section .text
global _start
_start:


;1 

mov ax, 0
mov ax, word [wNum1]
add ax, word [wNum2]
mov word [wAns1], ax

;2

mov ax, 0
mov ax, word [wNum1]
add ax, word [wNum3]
mov word [wAns2], ax

;3
mov ax, 0
mov ax, word [wNum3]
add ax, word [wNum4]
mov word [wAns3], ax

;4

mov ax, 0
mov ax, word [wNum1]
sub ax, word [wNum2]
mov word [wAns6], ax
 
;5

mov ax, 0
mov ax, word [wNum1]
sub ax, word [wNum3]
mov word [wAns7], ax

;6

mov ax, 0
mov ax, word [wNum2]
sub ax, word [wNum4]
mov word [wAns8], ax

;7

mov ax, 0
mov ax, word [wNum1]
imul word [wNum3]
mov word [dAns11], ax
mov word [dAns11+2], dx

;8
mov ax, 0
mov ax, word [wNum2]
imul word [wNum2]
mov word [dAns12], ax
mov word [dAns12+2], dx

;9 
mov ax, 0
mov ax, word [wNum2]
imul word [wNum3]
mov word [dAns13], ax
mov word [dAns13+2], dx

;10
mov ax, 0
mov ax, word [wNum1]
mov dx, 0 ; because it is the the helpful to prevent any garbage (ah:al)/src (can be memory o register of 8 bit size)
idiv word [wNum2]
mov word [wAns16], ax


;11
mov ax, 0 ; because ax is currently already corrupted with previous instructions 
mov ax, word [wNum3]
mov dx, 0 
idiv word [wNum4]
mov word [wAns17], ax

;12
mov eax, 0 ; just for safety , if any word value doesnt cover the ax
mov eax, dword [dNum1]
mov edx, 0
movzx ebx, word [wNum4]
idiv ebx
after_idiv_label:
mov word [wAns18] , ax
mov word [wRem18], dx


; Done, terminate program.
last:
mov rax, SYS_exit        ; Call code for exit
mov rdi, EXIT_SUCCESS    ; Exit program with success
syscall
