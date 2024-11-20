global _start

section .text
_start:
	mov rsi, 99 ; set rsi to 99
  mov rdi, 42 ; exit status 42
  mov rax, 60 ; sys_exit system call
	cmp rsi, 100; compare rsi to 100
  jl skip ; jump if less then (will jump)
  mov rdi, 12 ; exit status is 12

skip:
  syscall
