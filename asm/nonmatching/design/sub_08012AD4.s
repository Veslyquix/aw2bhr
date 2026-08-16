	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08012AD4
sub_08012AD4: @ 0x08012AD4
	push {lr}
	ldr r1, _08012AF8 @ =gUnknown_030020B4
	ldrb r2, [r1]
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldr r2, _08012AFC @ =0x04000004
	ldrh r0, [r1]
	strh r0, [r2]
	movs r1, #2
	rsbs r1, r1, #0
	movs r0, #1
	bl sub_0801BB10
	pop {r0}
	bx r0
	.align 2, 0
_08012AF8: .4byte gUnknown_030020B4
_08012AFC: .4byte 0x04000004

