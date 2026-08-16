	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805C9CC
sub_0805C9CC: @ 0x0805C9CC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0
	bl sub_0803F5C8
	adds r2, r0, #0
	ldrh r1, [r2, #2]
	movs r3, #0xf0
	lsls r3, r3, #2
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0805CA1A
	movs r6, #0xa0
	lsls r6, r6, #1
_0805C9EC:
	adds r0, r3, #0
	ands r0, r1
	cmp r0, r6
	bne _0805CA0E
	ldrb r1, [r2]
	subs r1, r1, r5
	ldrb r0, [r2, #2]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	cmp r1, r0
	bgt _0805CA0E
	ldrb r0, [r2, #1]
	adds r0, #3
	cmp r4, r0
	blt _0805CA0E
	movs r0, #1
	b _0805CA1C
_0805CA0E:
	adds r2, #8
	ldrh r1, [r2, #2]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _0805C9EC
_0805CA1A:
	movs r0, #0
_0805CA1C:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

