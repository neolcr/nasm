section .data
    window_title db "X11 Window", 0

section .bss
    argc resq 1
    argv resq 1
    event_buffer resb 32
    display resq 1
    window resq 1
    screen resq 1
    root_window resq 1

section .text
global _start
extern XOpenDisplay, XCreateSimpleWindow, XMapWindow, XStoreName, XNextEvent, XDefaultScreen, XDefaultRootWindow, XWhitePixel, XBlackPixel

_start:
    ; Open display
    call XOpenDisplay
    test rax, rax
    jz exit ; Exit if display is null
    mov [display], rax

    ; Get the default screen and root window
    mov rdi, rax
    call XDefaultScreen
    mov [screen], rax
    mov rdi, [display]
    call XDefaultRootWindow
    mov [root_window], rax

    ; Create a simple window
    mov rdi, [display]
    mov rsi, [root_window] ; Parent window (Root Window)
    xor rdx, rdx           ; X position
    xor rcx, rcx           ; Y position
    mov r8, 400            ; Width
    mov r9, 300            ; Height
    mov r10, 0             ; Border width
    mov r11, 0             ; Border pixel
    call XCreateSimpleWindow
    mov [window], rax
    test rax, rax
    jz exit ; Exit if window creation fails

    ; Set the window title
    mov rdi, [display]
    mov rsi, [window]
    lea rdx, [window_title]
    call XStoreName

    ; Map window
    mov rdi, [display]
    mov rsi, [window]
    call XMapWindow

event_loop:
    mov rdi, [display]
    lea rsi, [event_buffer]
    call XNextEvent
    jmp event_loop

exit:
    mov rax, 60
    xor rdi, rdi
    syscall
