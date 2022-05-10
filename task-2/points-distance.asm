%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global points_distance
    extern printf

points_distance:
    ;; DO NOT MODIFY
    
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; points
    mov eax, [ebp + 12]     ; distance
    ;; DO NOT MODIFY
   
    ;; Your code starts here
    xor esi, esi
    xor edi, edi

    mov si, [ebx + point_size * 0 + point.x]
    mov di, [ebx + point_size * 1 + point.x]

    cmp si, di
    jne skip_y


    xor esi, esi
    xor edi, edi

    mov si, [ebx + point_size * 0 + point.y]
    mov di, [ebx + point_size * 1 + point.y]

skip_y:

    sub si, di
    cmp si, 0
    jge end

    neg si

end:
    mov [eax], si

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret

    ;; DO NOT MODIFY