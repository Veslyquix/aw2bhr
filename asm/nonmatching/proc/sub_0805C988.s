	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805C988
sub_0805C988: @ 0x0805C988
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0
	bl sub_0803F5C8
	adds r2, r0, #0
	ldrh r1, [r2, #2]
	movs r3, #0xf0
	lsls r3, r3, #2
	b _0805C9BA
_0805C99E:
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0x40
	bne _0805C9B6
	ldrb r0, [r2]
	cmp r5, r0
	beq _0805C9B2
	ldrb r0, [r2, #1]
	cmp r4, r0
	bne _0805C9B6
_0805C9B2:
	movs r0, #1
	b _0805C9C4
_0805C9B6:
	adds r2, #8
	ldrh r1, [r2, #2]
_0805C9BA:
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _0805C99E
	movs r0, #0
_0805C9C4:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

