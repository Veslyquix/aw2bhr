	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805C290
sub_0805C290: @ 0x0805C290
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	movs r6, #0
	bl sub_080129E0
	movs r1, #3
	bl __umodsi3
	cmp r0, #1
	beq _0805C2BE
	cmp r0, #1
	blo _0805C2B4
	cmp r0, #2
	beq _0805C2C8
	b _0805C2D4
_0805C2B4:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0805C2DC
	b _0805C2D0
_0805C2BE:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0805C514
	b _0805C2D0
_0805C2C8:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0805C720
_0805C2D0:
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_0805C2D4:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

