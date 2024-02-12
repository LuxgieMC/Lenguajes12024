include "emu8086.inc"

.model small
org 100h
.stack
dw 128 dup(0) 

.data     
    
    messageinputnumber db "Ingrese un numero",10,13,"$"
    numInput db 0,"$"
    counter db 30h, "$"
      
    hope db 10,13,"$"
    
.code
    mov ax, @data
    mov ds, ax 
    
imprimir macro dato
    lea dx,dato
    mov ah,9
    int 21h   
endm    
    
  
imprimir messageinputnumber 
xor ax,ax
mov ah, 1h ; keyboard input subprogram
int 21h
   
mov numInput, al
   
xor ax, ax    
xor dx, dx  

xor ax,ax
xor dx, dx      
imprimir hope 

xor ax,ax
xor dx, dx      
imprimir hope     

loop:
    xor ax,ax
    xor dx, dx      
    imprimir hope 
    
    xor ax,ax
    xor dx, dx
    imprimir counter
    
    inc counter
    
    xor bl,bl
    mov bl, counter 
    
    cmp bl, numInput 
    jle loop

    