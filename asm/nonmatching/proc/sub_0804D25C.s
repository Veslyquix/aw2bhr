	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804D25C
sub_0804D25C: @ 0x0804D25C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r2, r2, #0x19
	lsrs r2, r2, #0x10
	lsls r1, r0, #0x1d
	lsrs r1, r1, #0x10
	ldr r3, _0804D288 @ =gUnknown_02029BA8
	lsls r0, r0, #5
	adds r3, #0x18
	adds r0, r0, r3
	ldr r0, [r0]
	adds r0, r0, r2
	ldr r2, _0804D28C @ =0x06010000
	adds r1, r1, r2
	movs r2, #0x80
	lsls r2, r2, #2
	bl sub_08011E54
	pop {r0}
	bx r0
	.align 2, 0
_0804D288: .4byte gUnknown_02029BA8
_0804D28C: .4byte 0x06010000

