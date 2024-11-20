global _start

section .text
_start:
  mov rdi, 42 ; exit status 42
  mov rax, 60 ; sys_exit system call
  jmp skip ; jump to "skip" label
  mov rdi, 12 ; exit status is 12

skip:
  syscall
