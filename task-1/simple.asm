%include "../include/io.mac"

section .text
    global simple
    extern printf

simple:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step

    ;; DO NOT MODIFY
   
    ;; Your code starts here
    mov eax, 0
while:

    ;; PRESUPUNEM CA STRINGUL ARE DOAR LITERE MARI
    mov bl, byte [esi + eax]


    add bl, dl

    
    cmp bl, 0x5A
    jle skip

    sub ebx, 0x1A

    

skip:
    mov [edi + eax], bl
    inc eax
    cmp eax, ecx
    jl while

    ;; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY
