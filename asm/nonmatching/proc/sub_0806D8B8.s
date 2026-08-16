	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806D8B8
sub_0806D8B8: @ 0x0806D8B8
	push {r4, r5, r6, lr}
	ldr r1, _0806D8FC @ =gUnknown_0816E1A8
	ldr r5, [r1]
	ldr r2, [r5]
	movs r3, #0
	ldrb r0, [r2]
	adds r6, r1, #0
	cmp r0, #0
	bne _0806D8CC
	movs r3, #1
_0806D8CC:
	adds r0, r2, #0
	adds r0, #0x84
	strb r3, [r0]
	ldr r0, [r5]
	ldrb r1, [r0, #6]
	adds r0, #0x85
	strb r1, [r0]
	ldr r4, [r5]
	movs r1, #4
	ldrsh r0, [r4, r1]
	movs r1, #0xfa
	lsls r1, r1, #1
	bl __divsi3
	subs r0, #2
	adds r4, #0x86
	strb r0, [r4]
	ldr r0, [r5]
	ldrb r2, [r0, #3]
	cmp r2, #0
	beq _0806D900
	subs r2, #4
	b _0806D902
	.align 2, 0
_0806D8FC: .4byte gUnknown_0816E1A8
_0806D900:
	movs r2, #0
_0806D902:
	adds r0, #0x87
	strb r2, [r0]
	ldr r0, [r6]
	ldr r2, [r0]
	ldrb r1, [r2, #7]
	cmp r1, #0
	beq _0806D918
	adds r1, #1
	ldrb r0, [r2, #0x15]
	subs r1, r1, r0
	b _0806D91A
_0806D918:
	movs r1, #0
_0806D91A:
	adds r0, r2, #0
	adds r0, #0x88
	strb r1, [r0]
	ldr r1, [r6]
	ldr r2, [r1]
	movs r3, #0
	ldrb r0, [r2, #1]
	cmp r0, #0
	bne _0806D92E
	movs r3, #1
_0806D92E:
	adds r0, r2, #0
	adds r0, #0x89
	strb r3, [r0]
	ldr r0, [r1]
	ldrb r1, [r0, #2]
	adds r0, #0x8a
	strb r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

