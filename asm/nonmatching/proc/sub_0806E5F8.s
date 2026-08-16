	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806E5F8
sub_0806E5F8: @ 0x0806E5F8
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _0806E628 @ =gUnknown_08582B2C
	bl Proc_Find
	adds r4, r0, #0
	movs r2, #0xa0
	lsls r2, r2, #1
	ldr r3, [r5, #0x58]
	movs r0, #4
	str r0, [sp]
	movs r0, #1
	movs r1, #0xb4
	bl sub_08074234
	str r0, [r4, #0x2c]
	ldr r0, [r5, #0x58]
	cmp r0, #3
	ble _0806E62C
	adds r0, r5, #0
	bl Proc_Break
	b _0806E630
	.align 2, 0
_0806E628: .4byte gUnknown_08582B2C
_0806E62C:
	adds r0, #1
	str r0, [r5, #0x58]
_0806E630:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

