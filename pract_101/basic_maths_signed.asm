; Same but now we have to evaluate everything based ont he signed  usage ,even though metrics we can chaneg or something like whatever 
;1. bAns1 = bNum1 + bNum2
;2. bAns2 = bNum1 + bNum3
;3. bAns3 = bNum3 + bNum4
;4. bAns6 = bNum1 – bNum2
;5. bAns7 = bNum1 – bNum3
;6. bAns8 = bNum2 – bNum4
;7. wAns11 = bNum1 * bNum3
;8. wAns12 = bNum2 * bNum2
;9. wAns13 = bNum2 * bNum4
;10. bAns16 = bNum1 / bNum2
;11. bAns17 = bNum3 / bNum4
;12. bAns18 = wNum1 / bNum4
;13. bRem18 = wNum1 % bNum4

; unsigned 
; variable initial chart represnt the type they will be used


section .data 

EXIT_SUCCESS equ 0
SYS_exit    equ 60

; byte variable
bNum1 db 5
bNum2 db -6
bNum3 db 34 
bNum4 db -12


; byte answer variable 
bAns1 db 0
bAns2 db 0
bAns3 db 0
bAns4 db 0
bAns6 db 0
bAns7 db 0
bAns8 db 0

bAns16 db 0
bAns17 db 0
bAns18 db 0

bRem18 db 0

; word variable

wNum1 dw 21

; word  Answer variables

wAns11 dw 0
wAns12 dw 0
wAns13 dw 0


; ------------------------

section .text
global _start
_start:


;1 

mov al, 0
mov al, byte [bNum1]
add al, byte [bNum2]
mov byte [bAns1], al

;2

mov al, 0
mov al, byte [bNum1]
add al, byte [bNum3]
mov byte [bAns2], al

;3
mov al, 0
mov al, byte [bNum3]
add al, byte [bNum4]
mov byte [bAns3], al

;4

mov al, 0
mov al, byte [bNum1]
sub al, byte [bNum2]
mov byte [bAns6], al
 
;5

mov al, 0
mov al, byte [bNum1]
sub al, byte [bNum3]
mov byte [bAns7], al

;6

mov al, 0
mov al, byte [bNum2]
sub al, byte [bNum4]
mov byte [bAns8], al

;7

mov al, 0
mov al, byte [bNum1]
imul byte [bNum3]
mov word [wAns11], ax

;8
mov al, 0
mov al, byte [bNum2]
imul byte [bNum2]
mov word [wAns12], ax

;9 
mov al, 0
mov al, byte [bNum2]
imul byte [bNum3]
mov word [wAns13], ax

;10
mov al, 0
mov al, byte [bNum1]
mov ah, 0 ; because it is the the helpful to prevent any garbage (ah:al)/src (can be memory o register of 8 bit size)
idiv byte[bNum2]
mov byte[bAns16], al


;11
mov ax, 0 ; because ax is currently already corrupted with previous instructions 
mov al, byte [bNum3]
idiv byte[bNum4]
mov byte[bAns17], al

;12
mov ax, 0 ; just for safety , if any word value doesnt cover the ax
mov ax, word [wNum1]
mov dx, 0
movsx bx, byte [bNum4]
idiv bx
after_div_label:
mov byte [bAns18] , al
mov byte [bRem18], dl
; narrow down the result to the smaller ones


; Done, terminate program.
last:
mov rax, SYS_exit        ; Call code for exit
mov rdi, EXIT_SUCCESS    ; Exit program with success
syscall
