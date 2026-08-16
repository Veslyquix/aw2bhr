	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08066710
sub_08066710: @ 0x08066710
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r2, #0
	ldr r0, _08066758 @ =gUnknown_0816E14C
	ldr r3, [r0]
	ldr r1, [r3]
	adds r5, r0, #0
	ldrb r1, [r1, #8]
	cmp r2, r1
	bge _0806673A
	adds r1, r3, #0
	movs r3, #0
_08066728:
	ldr r0, [r1]
	adds r0, #0x70
	adds r0, r0, r2
	strb r3, [r0]
	adds r2, #1
	ldr r0, [r1]
	ldrb r0, [r0, #8]
	cmp r2, r0
	blt _08066728
_0806673A:
	movs r2, #0
	movs r0, #0x24
	strh r0, [r4, #0x26]
	ldr r1, [r5]
	ldr r0, [r1]
	adds r0, #0x31
	strb r2, [r0]
	ldr r1, [r1]
	adds r1, #0x2d
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08066758: .4byte gUnknown_0816E14C

