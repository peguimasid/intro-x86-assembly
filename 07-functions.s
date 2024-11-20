global _start

_start:
  call func
	mov rax, 60
  mov rdi, 0
  syscall

func:
  push rbp
  mov rbp, rsp
  sub rsp, 4
  mov [rsp], byte 'H'
  mov [rsp + 1], byte 'i' 
  mov [rsp + 2], byte '!'
  mov [rsp + 3], byte 0xA
  mov rax, 1 ; sys_write system call
  mov rdi, 1 ; stdout file descriptor
  mov rsi, rsp ; bytes to write
  mov rdx, 4 ; number of bytes to write
  syscall ; perform system call
  mov rsp, rbp
  pop rbp
  ret
