	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800C6A8
sub_0800C6A8: @ 0x0800C6A8
	push {r4, r5, lr}
	sub sp, #8
	add r5, sp, #4
	movs r0, #0x28
	mov r1, sp
	adds r2, r5, #0
	bl sub_0800C6E8
	adds r4, r0, #0
	movs r0, #0x68
	mov r1, sp
	adds r2, r5, #0
	bl sub_0800C6E8
	adds r4, r4, r0
	movs r0, #0x48
	mov r1, sp
	adds r2, r5, #0
	bl sub_0800C6E8
	adds r4, r4, r0
	movs r0, #0x88
	mov r1, sp
	adds r2, r5, #0
	bl sub_0800C6E8
	adds r4, r4, r0
	adds r0, r4, #0
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1

