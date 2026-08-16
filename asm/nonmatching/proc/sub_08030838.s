	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08030838
sub_08030838: @ 0x08030838
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r3, _080308A8 @ =gUnknown_08090CD4
	ldr r0, [r3]
	ldr r2, [r0]
	ldr r1, _080308AC @ =0x00001AAF
	adds r0, r2, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, _080308B0 @ =0x0000122C
	adds r0, r0, r1
	adds r2, r2, r0
	ldrb r0, [r5]
	strb r0, [r2]
	ldrb r0, [r5, #1]
	strb r0, [r2, #1]
	ldrh r0, [r5, #2]
	strh r0, [r2, #2]
	ldrh r0, [r5, #4]
	strh r0, [r2, #4]
	movs r4, #0
	adds r6, r3, #0
	ldrh r0, [r5, #4]
	cmp r4, r0
	bge _08030882
	adds r3, r2, #6
	adds r2, r5, #6
_08030872:
	adds r0, r3, r4
	adds r1, r2, r4
	ldrb r1, [r1]
	strb r1, [r0]
	adds r4, #1
	ldrh r1, [r5, #4]
	cmp r4, r1
	blt _08030872
_08030882:
	ldr r3, [r6]
	ldr r1, [r3]
	ldr r2, _080308AC @ =0x00001AAF
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	ldrb r4, [r1]
	strb r0, [r1]
	ldr r1, [r3]
	adds r1, r1, r2
	ldrb r2, [r1]
	movs r0, #0xf
	ands r0, r2
	ldrb r2, [r1]
	strb r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080308A8: .4byte gUnknown_08090CD4
_080308AC: .4byte 0x00001AAF
_080308B0: .4byte 0x0000122C

