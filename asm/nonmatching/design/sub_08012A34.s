	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08012A34
sub_08012A34: @ 0x08012A34
	push {lr}
	ldr r2, _08012A50 @ =gUnknown_030020B4
	ldrb r1, [r2]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	movs r1, #3
	rsbs r1, r1, #0
	movs r0, #1
	bl sub_0801BB10
	pop {r0}
	bx r0
	.align 2, 0
_08012A50: .4byte gUnknown_030020B4

