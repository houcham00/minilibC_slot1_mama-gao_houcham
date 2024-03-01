    BITS 64
    section .text
    global my_add

my_add:
    xor rax, rax
    cmp esi, 0
    je .zero
    mov al, byte [rdi]
    cmp al, 0
    je .zero
    jmp .loop
    
.loop:
    mov al, byte [rdi + rax]
    cmp al, 0
    je .zero
    cmp al, sil
    je .end
    inc rax
    jmp .loop

.end:
    mov bl, [rdi + rax + 1]
    add bl, 1
    movsx rax, bl
    ret

.zero:
    xor rax, rax
    add rax, 64
    ret
