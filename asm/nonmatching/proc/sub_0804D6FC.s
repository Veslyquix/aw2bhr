	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804D6FC
sub_0804D6FC: @ 0x0804D6FC
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r2, r2, #0x1a
	lsrs r2, r2, #0x10
	lsls r1, r0, #0xd
	movs r4, #0x80
	lsls r4, r4, #3
	adds r3, r4, #0
	adds r1, r1, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, _0804D730 @ =gUnknown_02029BA8
	lsls r0, r0, #5
	adds r3, #0x18
	adds r0, r0, r3
	ldr r0, [r0]
	adds r0, r0, r2
	ldr r2, _0804D734 @ =0x06010000
	adds r1, r1, r2
	adds r2, r4, #0
	bl sub_08011E54
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804D730: .4byte gUnknown_02029BA8
_0804D734: .4byte 0x06010000

