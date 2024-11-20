; nasm -f elf64 09-using-functions-from-c.s && gcc 09-using-functions-from-c.o && ./a.out && rm a.out *.o
global main
extern printf

section .data
	msg db "Testing %i...", 0xA, 0

section .text
main:
  ; Prolog
	push rbp
	mov rbp,rsp
  
	; Load parameters for printf
  lea rdi, [rel msg]  ; Load the address of msg into rdi
  mov rsi, 123        ; Load the integer 123 into rsi

	; Call printf
  call printf wrt ..plt

  ; Set status to be 0 (success)
  mov rax, 0

  ; Epilog
	mov rsp,rbp
	pop rbp
	ret

section .note.GNU-stack
