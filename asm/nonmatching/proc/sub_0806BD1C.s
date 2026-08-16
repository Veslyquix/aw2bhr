	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806BD1C
sub_0806BD1C: @ 0x0806BD1C
	push {r4, lr}
	adds r3, r0, #0
	adds r2, r1, #0
	movs r4, #0
	b _0806BD5A
_0806BD26:
	cmp r0, #0x2d
	bne _0806BD2E
	movs r0, #0x7a
	b _0806BD4A
_0806BD2E:
	cmp r0, #0x2e
	bne _0806BD36
	movs r0, #0x7b
	b _0806BD4A
_0806BD36:
	cmp r0, #0x2a
	bne _0806BD3E
	movs r0, #0x7c
	b _0806BD4A
_0806BD3E:
	cmp r0, #0x20
	bne _0806BD46
	movs r0, #0x7d
	b _0806BD4A
_0806BD46:
	ldrb r0, [r2]
	adds r0, #0x1f
_0806BD4A:
	adds r4, #8
	adds r2, #1
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x40
	adds r0, #0x20
	strh r0, [r1]
	adds r3, #2
_0806BD5A:
	ldrb r0, [r2]
	cmp r0, #0
	bne _0806BD26
	bl sub_08013AEC
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1

