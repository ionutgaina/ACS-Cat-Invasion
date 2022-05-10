%include "../include/io.mac"

section .data
    n dd 0      ;
    plain dd 0  ;
    key dd 0    ;
    enc_string dd 0 ;


section .text
    global spiral
    extern printf

; void spiral(int N, char *plain, int key[N][N], char *enc_string);
spiral:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; N (size of key line)
    mov ebx, [ebp + 12] ; plain (address of first element in string)
    mov ecx, [ebp + 16] ; key (address of first element in matrix)
    mov edx, [ebp + 20] ; enc_string (address of first element in string)
    ;; DO NOT MODIFY
    ;; TODO: Implement spiral encryption
    ;; FREESTYLE STARTS HERE
    
    ;PRINTF32 `eax: %d\n\x0`, eax

    mov dword[n], eax
    mov dword[plain], ebx
    mov dword[key], ecx
    mov dword[enc_string], edx

    xor ecx, ecx
    xor edx, edx
    PRINTF32 `eax: %d\n\x0`, eax

    mov eax, [n]
    mov ebx, 2
    div ebx

    ; esi, edi, eax

    ; eax = n/2 , edx = rest
    mov esi, 0
    cmp esi, eax
    je skip_matrix
while_matrix:
    push eax
    push esi



    mov eax, [n]

    sub eax, esi 
    dec eax
    PRINTF32 `latura %d\n\x0`, esi
upper_side:

    PRINTF32 `%d \x0`, esi

    ; am creat latura de sus
    ; acum trebuie sa criptez
    ; TO DO

    inc esi
    cmp esi, eax
    jl upper_side

    PRINTF32 `\n\n\x0`, esi
    
    pop esi
    pop eax
    inc esi
    cmp esi, eax
    jl while_matrix

skip_matrix:

    ; TO DO
    
    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
