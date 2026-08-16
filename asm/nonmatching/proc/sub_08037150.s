	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08037150
sub_08037150: @ 0x08037150
	push {lr}
	adds r1, r0, #0
	ldr r0, _08037168 @ =gUnknown_08124478
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x11
	ldr r2, _0803716C @ =0x06010000
	adds r1, r1, r2
	bl sub_08011CAC
	pop {r0}
	bx r0
	.align 2, 0
_08037168: .4byte gUnknown_08124478
_0803716C: .4byte 0x06010000

