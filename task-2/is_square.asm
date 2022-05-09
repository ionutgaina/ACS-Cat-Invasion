%include "../include/io.mac"

section .data
    nr DD 0 ; number of elements
    iter DD 0 ; iterator for element

section .text
    global is_square
    extern printf


is_square:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; dist
    mov eax, [ebp + 12]     ; nr
    mov ecx, [ebp + 16]     ; sq
    ;; DO NOT MODIFY
   
    ;; Your code starts here
    ;edx esi edi
    mov dword[nr], eax
    mov eax, 1          ; initialising elements iterator

while_elements:
    push eax            ; reusing when exit the second while

    mov esi, 0

while_element:

    mov ax, si
    mov dx, si
    mul dx              ; i * i

    inc esi

    cmp eax, [ebx]      ; compare i*i < distance value
    jl while_element    ; second while

    mov dword[ecx], 0   ; initialise the element from array
    cmp eax, [ebx]      ; compare i*i != distance value
    jne skip

    mov dword[ecx], 1   ; the value is perfect square
    ;END while_element

skip:

    pop eax ; take the saved value from stack

    add ebx, 4 ; add the padding
    add ecx, 4

    inc eax
    cmp eax, [nr]
    jle while_elements  ; first while



    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY