global _start

section .data
  msg db "Hello, world!", 0x0a
  len equ $ - msg

section .text
_start:
  mov rax, 1 ; sys_write system call
  mov rdi, 1 ; stdout file descriptor
  mov rsi, msg ; bytes to write
  mov rdx, len ; number of bytes to write
  syscall ; perfom system call
  mov rax, 60 ; sys_exit system call
  mov rdi, 0 ; exit status is 0
  syscall
