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
    mov edi, [ebp + 20] ; enc_string (address of first element in string)
    ;; DO NOT MODIFY
    ;; TODO: Implement spiral encryption
    ;; FREESTYLE STARTS HERE
    
    ; move to variables
    mov dword[n], eax
    mov dword[plain], ebx
    mov dword[key], ecx
    mov dword[enc_string], edi
    
    push ebx

    ; free some registers for div instruction
    xor eax, eax
    xor edx, edx
    xor ebx, ebx
    

    mov eax, [n]
    mov ebx, 2
    div ebx

    pop ebx
    push edx

    ; eax - pana la cat
    ; esi - iteratorul
    ; edx - restul n/2
    ; ebx - plain
    ; ecx - key
    ; edi - enc_string

    ; eax = n/2 , edx = rest
    mov esi, 0
    cmp esi, eax
    je skip_matrix
while_matrix:
    push eax
    push esi



    mov eax, [n]

    sub eax, esi ; n - i
    dec eax ; programmers count from 0 !
    ; START
    push esi
    ;PRINTF32 `latura %d\n\x0`, esi
upper_side:

    ;PRINTF32 `%d \x0`, esi

    xor edx, edx
    mov dl, byte[ebx]       ; take letter from plain
    inc ebx

    push eax

    mov eax, dword[ecx]     ; take integer from key[][]
    ;PRINTF32 `%d \x0`, eax
    add ecx, 4  ; next column same row
    
    add edx, eax            ; encrypt
    mov byte[edi], dl       ; put crypted letter in enc_ecrypt
    inc edi   
    pop eax


    inc esi
    cmp esi, eax
    jl upper_side

    pop esi
    ; END 
    ; START
    push esi
    ;PRINTF32 `latura %d\n\x0`, esi

right_side:

    ;PRINTF32 `%d \x0`, esi

    xor edx, edx
    mov dl, byte[ebx]       ; take letter from plain
    inc ebx
    ;PRINTF32 `plain: %c\n\x0`, edx

    push eax
    push ebx
    mov ebx, dword[n]

    mov eax, dword[ecx]     ; take integer from key[][]
    ;PRINTF32 `%d \x0`, eax


    ; + 4 * ebx ( go to below row same column)
    add ecx, ebx
    add ecx, ebx
    add ecx, ebx
    add ecx, ebx
    
    pop ebx
    
    add edx, eax            ; encrypt
    mov byte[edi], dl       ; put crypted letter in enc_ecrypt
    inc edi   
    pop eax


    inc esi
    cmp esi, eax
    jl right_side
    ; END
    pop esi
    ; START
    push esi
    ;PRINTF32 `latura %d\n\x0`, esi

bottom_side:

    ;PRINTF32 `%d \x0`, esi

    xor edx, edx
    mov dl, byte[ebx]       ; take letter from plain
    inc ebx
    ;PRINTF32 `plain: %c\n\x0`, edx

    push eax


    mov eax, dword[ecx]     ; take integer from key[][]
    ;PRINTF32 `%d \x0`, eax
    sub ecx, 4  ; go to left column same row

    add edx, eax            ; encrypt
    mov byte[edi], dl       ; put crypted letter in enc_ecrypt
    inc edi   
    pop eax


    inc esi
    cmp esi, eax
    jl bottom_side
    ; END
    pop esi
    ; START
    push esi
    ;PRINTF32 `latura %d\n\x0`, esi

left_side:

    ;PRINTF32 `%d \x0`, esi

    xor edx, edx
    mov dl, byte[ebx]       ; take letter from plain
    inc ebx

    push eax
    push ebx
    mov ebx, dword[n]
    xor eax, eax
    mov eax, dword[ecx]     ; take integer from key[][]

    ;PRINTF32 `plain: %d\n\x0`, eax


    ; - 4 * ebx ( go to above row same column)
    sub ecx, ebx
    sub ecx, ebx
    sub ecx, ebx
    sub ecx, ebx

    pop ebx
    
    add edx, eax            ; encrypt
    mov byte[edi], dl       ; put crypted letter in enc_ecrypt
    inc edi   
    pop eax


    inc esi
    cmp esi, eax
    jl left_side
    ; END
    push ebx
    mov ebx, dword[n]

    ; I take it to the next square/quadrant ( + 4 * ebx + 4)
    ; go to next row and next column
    add ecx, ebx
    add ecx, ebx
    add ecx, ebx
    add ecx, ebx
    add ecx, 4

    pop ebx
    pop esi

    ;PRINTF32 `\n\n\x0`, esi
    
    pop esi
    pop eax
    inc esi
    cmp esi, eax
    jl while_matrix

skip_matrix:

    ; Here is for if n is odd number
    ; The addres is in perfect position from above
    ; 
    pop edx

    cmp edx, 0
    je skip_odd
    
    xor edx, edx
    mov dl, byte[ebx]       ; take letter from plain

    mov eax, dword[ecx]     ; take integer from key[][]
    ;PRINTF32 `%d \x0`, eax

    
    add edx, eax            ; encrypt
    mov byte[edi], dl       ; put crypted letter in enc_ecrypt


skip_odd:
    
    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
