%include "../include/io.mac"

section .data
    len_plain dd 0      ;
    len_key dd 0        ;

section .bss
    a: resb 1           ;
    b: resb 1           ;

section .text
    global beaufort
    extern printf

; void beaufort(int len_plain, char *plain, int len_key, char *key, char tabula_recta[26][26], char *enc) ;
beaufort:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; len_plain
    mov ebx, [ebp + 12] ; plain (address of first element in string)
    mov ecx, [ebp + 16] ; len_key
    mov edx, [ebp + 20] ; key (address of first element in matrix)
    mov edi, [ebp + 24] ; tabula_recta
    mov esi, [ebp + 28] ; enc
    ;; DO NOT MODIFY
    ;; TODO: Implement spiral encryption
    ;; FREESTYLE STARTS HERE

    mov [len_plain], eax
    mov [len_key], ecx

    xor eax, eax
    xor ecx, ecx

    ;PRINTF32 `plain: %d\n\x0`, [len_plain]
    ;PRINTF32 `key: %d\n\x0`, [len_key]
while_plain:

    cmp ecx, dword[len_key]     ; trecerea prin cheie
    jl skip
    xor ecx, ecx                ; reset to 0 the key iterator
    mov edx, [ebp + 20]         ; reset the address

skip:
    push ecx
    push eax

        ; first case 
        ; a - key letter
        ; b - plain letter
        ; a >= b
    xor eax, eax
    xor ecx, ecx

    mov al, byte[edx] ; a
    mov cl, byte[ebx] ; b

    cmp al, cl
    jl second_case

        ; case 1 formula a-b + 'A'
    sub al, cl      ; a -b
    add al, 'A'     ; (a-b) + 'A'
    jmp skip_second_case

second_case:
        ; case 2 formula 'Z' - b + a + 1

    push eax        ; salvez valoarea in stack
    mov al, 'Z
    sub al, cl      ; 'Z' - b
    pop ecx         ; scot valoarea din stack
    add al, cl      ; ('Z' - b)
    inc al

skip_second_case:
    mov [esi], al

    ;PRINTF32 `=============: %d\n\x0`, eax

    pop eax
    pop ecx
    inc ecx
    inc eax
    
    inc ebx
    inc edx
    inc esi

    cmp eax, dword[len_plain]   ; iterarea prin textul plain
    jl while_plain
    ;PRINTF32 `eax: %d\n\x0`, eax
    ;PRINTF32 `eax: %d\n\x0`, ecx
    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
