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
extrn GetFrameTime

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

    call GetFrameTime
    movq xmm1, [velocity]
    movq xmm2, [velocity+4]
    mulss xmm1, xmm0
    mulss xmm2, xmm0
    addss xmm1, [position]
    addss xmm2, [position+4]
    movq [position], xmm1
    movq [position+4], xmm1

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

; vector2
position:
dd 0.0
dd 0.0

velocity:
dd 20.0
dd 20.0

size:
dd 200.0
dd 200.0
