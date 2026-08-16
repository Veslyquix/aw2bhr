	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08065818
sub_08065818: @ 0x08065818
	push {r4, r5, r6, lr}
	ldr r2, _08065864 @ =gUnknown_0816E10C
	ldr r5, [r2]
	ldr r1, [r5]
	ldrb r0, [r1, #0x16]
	subs r0, #1
	strb r0, [r1, #0x16]
	ldr r1, [r5]
	movs r3, #0
	ldrb r0, [r1]
	adds r6, r2, #0
	cmp r0, #0
	bne _08065834
	movs r3, #1
_08065834:
	adds r0, r1, #0
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
	ldrb r3, [r0, #3]
	cmp r3, #0
	beq _08065868
	subs r3, #4
	b _0806586A
	.align 2, 0
_08065864: .4byte gUnknown_0816E10C
_08065868:
	movs r3, #0
_0806586A:
	adds r0, #0x87
	strb r3, [r0]
	ldr r0, [r6]
	ldr r2, [r0]
	ldrb r1, [r2, #7]
	cmp r1, #0
	beq _08065880
	adds r1, #1
	ldrb r0, [r2, #0x15]
	subs r1, r1, r0
	b _08065882
_08065880:
	movs r1, #0
_08065882:
	adds r0, r2, #0
	adds r0, #0x88
	strb r1, [r0]
	ldr r2, [r6]
	ldr r1, [r2]
	movs r3, #0
	ldrb r0, [r1, #1]
	cmp r0, #0
	bne _08065896
	movs r3, #1
_08065896:
	adds r0, r1, #0
	adds r0, #0x89
	strb r3, [r0]
	ldr r0, [r2]
	ldrb r1, [r0, #2]
	adds r0, #0x8a
	strb r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

