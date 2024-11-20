global add42

add42:
  ; prolog
  push rbp
  mov rbp, rsp

  mov rax, [rbp + 16]
  add rax, 42

  ; epilog
  mov rsp, rbp
  pop rbp
  ret

section .note.GNU-stack
