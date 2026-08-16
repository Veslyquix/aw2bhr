	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806E740
sub_0806E740: @ 0x0806E740
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, [r4, #0x2c]
	ldr r2, [r4, #0x30]
	ldr r3, [r4, #0x38]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	bl sub_08074234
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	movs r2, #0
	bl sub_08072C40
	ldr r0, [r4, #0x38]
	cmp r0, #0x10
	bls _0806E772
	adds r0, r4, #0
	bl Proc_Break
	b _0806E776
_0806E772:
	adds r0, #1
	str r0, [r4, #0x38]
_0806E776:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

