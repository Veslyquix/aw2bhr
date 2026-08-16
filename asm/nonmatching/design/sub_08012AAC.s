	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08012AAC
sub_08012AAC: @ 0x08012AAC
	push {lr}
	ldr r2, _08012ACC @ =gUnknown_030020B4
	ldrb r0, [r2]
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08012AD0 @ =0x04000004
	ldrh r0, [r2]
	strh r0, [r1]
	movs r0, #2
	movs r1, #1
	bl sub_0801BB10
	pop {r0}
	bx r0
	.align 2, 0
_08012ACC: .4byte gUnknown_030020B4
_08012AD0: .4byte 0x04000004

