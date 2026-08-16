	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08063A58
sub_08063A58: @ 0x08063A58
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	adds r5, r3, #0
	cmp r4, #0
	bne _08063A6E
	movs r0, #0xa
	strb r0, [r5]
	strb r0, [r6]
	b _08063AB2
_08063A6E:
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	strb r0, [r5]
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	movs r1, #0xa
	bl __modsi3
	strb r0, [r6]
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	movs r1, #0xa
	bl __modsi3
	strb r0, [r7]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08063AB6
	ldrb r0, [r6]
	cmp r0, #0
	bne _08063AAC
	movs r0, #0xff
	strb r0, [r6]
_08063AAC:
	ldrb r0, [r7]
	cmp r0, #0
	bne _08063AB6
_08063AB2:
	movs r0, #0xff
	strb r0, [r7]
_08063AB6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

