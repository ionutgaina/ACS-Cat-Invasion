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

    ; PRESUPUNEM CA STRINGUL ARE DOAR LITERE MARI

    ; take the letter from plain
    mov bl, byte [esi + eax]

    ; add with the key
    add bl, dl

    ; compare with Z    
    cmp bl, 0x5A
    jle skip

    ; if is greater than Z then substitute with 26
    sub ebx, 0x1A

    

skip:
    ; put in restult vector ( enc_string )
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
