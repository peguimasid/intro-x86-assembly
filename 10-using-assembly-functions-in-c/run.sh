nasm -f elf64 add42.s -o add42.o
gcc add42.o main.c
./a.out
rm a.out *.o
