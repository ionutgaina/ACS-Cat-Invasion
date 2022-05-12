%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global road
    extern printf
    extern points_distance

road:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]      ; points
    mov ecx, [ebp + 12]     ; len
    mov ebx, [ebp + 16]     ; distances
    ;; DO NOT MODIFY
   
    ;; Your code starts here
    mov esi, 0
    dec ecx
while:
    ; use function points_distance from previous task
    ; we push the arguments (address of distances and points)
    push ebx
    push eax
    call points_distance
    add esp, 8
    
    ; we move on to the address of the next element from eax and ebx
    add eax, point_size
    add ebx, 4

    inc esi
    cmp esi, ecx
    jl while

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY