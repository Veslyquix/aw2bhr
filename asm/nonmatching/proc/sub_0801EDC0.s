	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801EDC0
sub_0801EDC0: @ 0x0801EDC0
	push {r4, r5, lr}
	sub sp, #0xc
	adds r2, r0, #0
	movs r4, #0
	movs r5, #0
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x80
	lsls r3, r3, #0x18
	orrs r3, r2
	str r4, [sp]
	str r5, [sp, #4]
	movs r4, #1
	rsbs r4, r4, #0
	str r4, [sp, #8]
	movs r1, #0
	movs r2, #0
	bl sub_0801ECE8
	cmp r0, #0
	bne _0801EDEE
	movs r0, #0
	b _0801EDF0
_0801EDEE:
	adds r0, r4, #0
_0801EDF0:
	add sp, #0xc
	pop {r4, r5}
	pop {r1}
	bx r1

