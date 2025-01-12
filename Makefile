main: main.o
	gcc main.o -o main -nostdlib -lc -lraylib

main.o: main.asm
	fasm main.asm
