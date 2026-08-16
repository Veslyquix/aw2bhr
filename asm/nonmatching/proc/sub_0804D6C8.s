	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804D6C8
sub_0804D6C8: @ 0x0804D6C8
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r2, r2, #0x1a
	lsrs r2, r2, #0x10
	lsls r1, r0, #0x1d
	lsrs r1, r1, #0x10
	ldr r3, _0804D6F4 @ =gUnknown_02029BA8
	lsls r0, r0, #5
	adds r3, #0x18
	adds r0, r0, r3
	ldr r0, [r0]
	adds r0, r0, r2
	ldr r2, _0804D6F8 @ =0x06010000
	adds r1, r1, r2
	movs r2, #0x80
	lsls r2, r2, #3
	bl sub_08011E54
	pop {r0}
	bx r0
	.align 2, 0
_0804D6F4: .4byte gUnknown_02029BA8
_0804D6F8: .4byte 0x06010000

