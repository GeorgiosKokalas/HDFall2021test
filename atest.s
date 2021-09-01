/* example of coding an ARM assembly function */
/* string constants */
        .section .rodata
        .align 2
prompt:         @ format string for printf
        .asciz "Your integer is 4\n "
input:          @ format string for scanf
        .asciz "%d"
results:        @ format string for printf
        .asciz "The call square(%d) returns %d\n"

/*YOUR DEFINITION OF square() HERE */
        .align 2
square:
        push    {fp, lr}        @setup stack frame
        add     fp, sp, #4
        sub     sp, sp, #8      @one local variable

        @[fp, #-8]      holds x
        str     r0, [fp, #-8]

        @computes and returns x*x
        ldr     r0, [fp, #-8]
        mul     r0, r0, r0

        sub     sp, fp, #4 @tears down stack frame
        pop     {fp, pc}


/* main program */
        .text
        .align 2
        .global main
main:
        push {fp, lr}   @ setup stack frame
        add fp, sp, #4
        sub sp, sp, #8  @ one local variables
        @ [fp, #-8] holds 4, input integer

        ldr r0, promptP @ print prompt
        bl printf

        mov r0, #4
        str r0,[fp, #-8]

        ldr r0, [fp, #-8] @ call square(x)
        bl square

        mov r2, r0 @ print results: r0 = add1(x)
        ldr r0, resultsP
        ldr r1, [fp, #-8]
        bl printf

        mov r0, #0 @ load return value
        sub     sp, fp, #4      @ tear down stack frame
        pop     {fp, pc}

/* pointer variables for format strings */
        .align 2
promptP:        .word   prompt
inputP:         .word   input
resultsP:       .word   results
