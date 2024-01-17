section .data

binary db 1101b ; Define the binary number
decimal db 0 ; Initialize the decimal variable
position db 1 ; Initialize the positional value

section .text
global _start

_start:
    mov al, [binary] ; Load binary number into AL register
    xor ebx, ebx ; Clear EBX register

binary_to_decimal:
    mov dl, al ; Move binary number to DL register
    and dl, 1 ; Extract rightmost bit
    mul byte [position] ; Multiply the bit with the positional value
    add bl, dl ; Add the result to the decimal variable in BL register
    shl byte [position], 1 ; Multiply positional value by 2
    shr al, 1 ; Shift the binary number right by 1 bit
    test al, al ; Check if binary number is zero
    jnz binary_to_decimal ; Jump to binary_to_decimal label if not zero

print_decimal:
    add bl, '0' ; Convert decimal value to ASCII character
    mov [decimal], bl ; Store decimal value in memory
    mov eax, 4 ; System call number for write
    mov ebx, 1 ; File descriptor 1 (stdout)
    mov ecx, decimal ; Address of decimal value
    mov edx, 1 ; Length of string to write
    int 0x80 ; Call the kernel

exit:
    mov eax, 1 ; System call number for exit
    xor ebx, ebx ; Exit code 0
    int 0x80 ; Call the kernel