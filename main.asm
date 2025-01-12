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
extrn DrawRectangleV

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

    ; position
    mov rax, [position]
    movq xmm0, rax

    ; size
    mov rax, [size]
    movq xmm1, rax

    ; color
    mov rdi, 0xffa1a1a1
    call DrawRectangleV

    call EndDrawing
  jmp .again

  .close:
    call CloseWindow
    mov rdi, 0
    call _exit


section '.data' writable
title: db "Hello Raylib from asm"

position:
dd 0.0
dd 0.0

size:
dd 200.0
dd 200.0
