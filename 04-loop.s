global _start

section .text
_start:
	mov rdi, 1 ; start rdi at 1
  mov rsi, 4 ; number of iterations
  jmp masid;

masid:
  add rdi, rdi ; rdi += rdi
	dec rsi ; exc -= 1
  cmp rsi, 0 ; compare rsi with 0
  jg masid ; jump to masid if greater
  mov rax, 60 ; sys_exit system call
  syscall
