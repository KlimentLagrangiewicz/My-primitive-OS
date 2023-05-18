BITS 16
org 0x7C00
loop: ;адресная метка для реализации  вечного цикла
push ax 			
mov ah, 0x00
mov al, 0x0e; установка видеорежима
mov bl,0b1111_0100
int 0x10
;----------------------------Вывод СОвы----------------------------------------
mov si, new
call lib_print_string
mov si, ft1
call lib_print_string
mov si, ft2
call lib_print_string
mov si, ft3
call lib_print_string
mov si, ft4
call lib_print_string
mov si, ft5
call lib_print_string
mov si, new
call lib_print_string
;-----------------------------------------------------------------------------
mov si, msg
call lib_print_string
mov si, mcg
call lib_print_string


;mov ah, 0x01
;mov ch,0x07
;int 0x10
;mov ah, 0x02
;mov dh, 0x05
;mov dl, 0x07
;int 0x10
mov al, 11011110b
	mov cx, 100
	mov dx, 100
	mov ah, 0ch
	int 10h     

pop ax
jmp $;loop 
;=============================================================================
ft1	db "   fFFF  fFFF", 13, 10, 0
ft2 db "  FF     F  F", 13, 10, 0
ft3 db "   FFFF  F  F  \    /  FFF", 13, 10, 0
ft4 db "     FF  F  F   \  /   F F", 13, 10, 0
ft5 db "  FFFs   FFFF    \/    FFFFF", 13, 10, 0
new db "", 13, 10, 0
msg db "          Workers of the world, unite!",  10,0
mcg db "De-energize all of Moscow - MPEI(TU)", 13, 10,0
;=============================================================================
lib_print_string:
	pusha
	mov ah, 0x0e			

repeat1:
	lodsb				
	cmp al, 0
	je done			
	int 10h				
	jmp repeat1			
done:
	popa
	ret
;-----------------------------------------------------------------------------