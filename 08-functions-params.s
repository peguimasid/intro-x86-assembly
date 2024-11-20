global _start

_start:
  push 21
  call times2
  mov rdi, rax
  mov rax, 60
  syscall

times2:
  push rbp
  mov rbp, rsp
  mov rax, [rbp + 16] ; why + 16 ? look at the explanation below (1.0)
  add rax, rax
  mov rsp, rbp
  pop rbp
  ret


; ----------------------------
; 1.0: 

; This is the stack after we push the number 21 in line 4
; [56] 21
; [64] 0

; This is the stack after we call the times2 function in line 5
; [48] *return addr
; [56] 21
; [64] 0

; At this point we move to the times2 function that push `rbp` to the top of the
; stack (line 11) and mov rsp into rbp (line 12) to preserve the stack (prolog)
; [40] <value at rbp>
; [48] *return addr
; [56] 21
; [64] 0

; After that we want to access the value 21 from the `push 21` to double it
; and store in rax, so what we do? we dereference the value at [rbp + 16]
; which translates to [40 + 16] that is [56], and 21 its inside there
; [40] <value at rbp>
; [48] *return addr
; [56] 21
; [64] 0
