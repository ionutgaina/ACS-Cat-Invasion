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

    ; take the x from the first struct and second
    mov si, [ebx + point_size * 0 + point.x]
    mov di, [ebx + point_size * 1 + point.x]

    ; compare them if they are not equal then skip the y
    cmp si, di
    jne skip_y

    ; free registers
    xor esi, esi
    xor edi, edi

    ; take the y from the first struct and second
    mov si, [ebx + point_size * 0 + point.y]
    mov di, [ebx + point_size * 1 + point.y]

skip_y:

    ; calculate the point distance
    sub si, di
    
    cmp si, 0
    jge end

    ; if value (si) is negative then negate
    neg si

end:
    ; put result in addres
    mov [eax], esi

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret

    ;; DO NOT MODIFY