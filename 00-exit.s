; nasm -felf64 00-exit.s && ld hello.o && ./a.out

global _start

_start:
	mov rax, 60 ; sys_exit system call
	mov rdi, 42 ; exit status is 42
	syscall
