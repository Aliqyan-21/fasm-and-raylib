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
  
  ; sky 
  mov rdi, 0  
  mov rsi, 0  
  mov rdx, 800
  mov rcx, 300
  mov r8, 0xffffaa80  
  call DrawRectangle
  
  ; ground 
  mov rdi, 0  
  mov rsi, 300
  mov rdx, 800
  mov rcx, 300
  mov r8, 0xff2d425b  
  call DrawRectangle
  
  ; sun
  mov rdi, 700
  mov rsi, 50 
  mov rdx, 50 
  mov rcx, 50 
  mov r8, 0xffffffff
  call DrawRectangle
  
  ; cloud
  mov rdi, 150  
  mov rsi, 80   
  mov rdx, 100  
  mov rcx, 50   
  mov r8, 0xffe6e6e6  
  call DrawRectangle
  
  ; another cloud
  mov rdi, 300  
  mov rsi, 50   
  mov rdx, 150  
  mov rcx, 60   
  mov r8, 0xffe6e6e6 
  call DrawRectangle
  
  ; left tree trunk
  mov rdi, 100
  mov rsi, 250
  mov rdx, 30
  mov rcx, 100
  mov r8, 0xff5d4037
  call DrawRectangle
  
  ; left tree foliage
  mov rdi, 50
  mov rsi, 150
  mov rdx, 130
  mov rcx, 100
  mov r8, 0xff2e7d32
  call DrawRectangle
  
  ; middle tree trunk
  mov rdi, 300
  mov rsi, 250
  mov rdx, 30
  mov rcx, 100
  mov r8, 0xff5d4037
  call DrawRectangle
  
  ; middle tree foliage
  mov rdi, 250
  mov rsi, 150
  mov rdx, 130
  mov rcx, 100
  mov r8, 0xff2e7d32  
  call DrawRectangle
  
  ; right tree trunk
  mov rdi, 600
  mov rsi, 250
  mov rdx, 30
  mov rcx, 100
  mov r8, 0xff5d4037  
  call DrawRectangle
  
  ; right tree foliage
  mov rdi, 550
  mov rsi, 150
  mov rdx, 130
  mov rcx, 100
  mov r8, 0xff2e7d32  
  call DrawRectangle
  
  ; creeper head
  mov rdi, 350
  mov rsi, 200
  mov rdx, 100
  mov rcx, 100
  mov r8, 0xff1f8a2d
  call DrawRectangle
  
  ; eyes
  mov rdi, 370
  mov rsi, 230
  mov rdx, 20
  mov rcx, 20
  mov r8, 0xff002906
  call DrawRectangle
  
  mov rdi, 410
  mov rsi, 230
  mov rdx, 20
  mov rcx, 20
  mov r8, 0xff002906
  call DrawRectangle
  
  ; mouth
  mov rdi, 370
  mov rsi, 260
  mov rdx, 60
  mov rcx, 10
  mov r8, 0xff002906
  call DrawRectangle
  
  ; body
  mov rdi, 350
  mov rsi, 300
  mov rdx, 100
  mov rcx, 150
  mov r8, 0xff2e8b57  
  call DrawRectangle
  
  ; legs 
  mov rdi, 350
  mov rsi, 450
  mov rdx, 40
  mov rcx, 50
  mov r8, 0xff1e512f  
  call DrawRectangle
  
  ; legs 
  mov rdi, 410
  mov rsi, 450
  mov rdx, 40
  mov rcx, 50
  mov r8, 0xff1e512f  
  call DrawRectangle
  
  ; frame
  mov rdi, 0  
  mov rsi, 0  
  mov rdx, 800
  mov rcx, 10 
  mov r8, 0xff000000  
  call DrawRectangle
  
  mov rdi, 0  
  mov rsi, 590
  mov rdx, 800
  mov rcx, 10 
  mov r8, 0xff000000  
  call DrawRectangle
  
  mov rdi, 0  
  mov rsi, 0  
  mov rdx, 10 
  mov rcx, 600
  mov r8, 0xff000000  
  call DrawRectangle
  
  mov rdi, 790  
  mov rsi, 0   
  mov rdx, 10  
  mov rcx, 600  
  mov r8, 0xff000000  
  call DrawRectangle
  
  call EndDrawing
  jmp .again
  
.close:
  call CloseWindow
  mov rdi, 0
  call _exit
  
  section '.data' writable
title: db "Hello Raylib, fasm and minecraft", 0
