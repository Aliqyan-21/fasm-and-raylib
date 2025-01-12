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

_start:
  mov rdi, 800
  mov rsi, 600
  mov rdx, title
  call InitWindow

  ; testing the rax agains rax until it is zero, if zero window close, otherwise again
  .again:
    call WindowShouldClose
    test rax, rax
    jnz .close
    call BeginDrawing
    call EndDrawing
  jmp .again

  .close:
    call CloseWindow
    mov rdi, 0
    call _exit


section '.data' writable
title: db "Hello Raylib from asm"
