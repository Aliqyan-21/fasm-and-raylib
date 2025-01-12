format ELF64 

section '.text' executable

public _start
extrn printf
extrn _exit
extrn InitWindow
extrn WindowShouldClose
extrn CloseWindow
extrn BeginDrawing
extrn EndDrawing
extrn ClearBackground
extrn DrawRectangle

_start:
  mov rdi, 800
  mov rsi, 600
  mov rdx, title
  call InitWindow

  ; testing the rax against rax until it is zero, if zero window close, otherwise again
  .again:
    call WindowShouldClose
    test rax, rax
    jnz .close

    call BeginDrawing
    mov rdi, 0xff1c1c1c
    call ClearBackground

    mov rdi, 300        ; x-axis
    mov rsi, 200        ; y-axis
    mov rdx, 200        ; width
    mov rcx, 200        ; height
    mov r8, 0xffa1a1a1  ; color
    call DrawRectangle

    call EndDrawing
  jmp .again

  .close:
    call CloseWindow
    mov rdi, 0
    call _exit


section '.data' writable
title: db "Hello Raylib from asm"
