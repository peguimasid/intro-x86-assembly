global _start

section .data
	addr db "yellow", 0x0a
section .text
_start:
	mov [addr], byte 'H'
	mov [addr + 5], byte '!' 
	mov rax, 1 ; sys_write system call
	mov rdi, 1 ; stdout file descriptor
	mov rsi, addr ; bytes to write
	mov rdx, 7 ; number of bytes to write
	syscall ; perform system call
	mov rax, 60 ; sys_exit system call
	mov rdi, 0 ; exit status is 0
	syscall
