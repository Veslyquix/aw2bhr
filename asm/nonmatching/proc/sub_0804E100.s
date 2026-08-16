	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804E100
sub_0804E100: @ 0x0804E100
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r2, r2, #0x1b
	lsrs r2, r2, #0x10
	lsls r1, r0, #0x1d
	lsrs r1, r1, #0x10
	ldr r3, _0804E12C @ =gUnknown_02029BA8
	lsls r0, r0, #5
	adds r3, #0x18
	adds r0, r0, r3
	ldr r0, [r0]
	adds r0, r0, r2
	ldr r2, _0804E130 @ =0x06010000
	adds r1, r1, r2
	movs r2, #0x80
	lsls r2, r2, #4
	bl sub_08011E54
	pop {r0}
	bx r0
	.align 2, 0
_0804E12C: .4byte gUnknown_02029BA8
_0804E130: .4byte 0x06010000

