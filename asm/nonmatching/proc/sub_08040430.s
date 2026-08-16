	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08040430
sub_08040430: @ 0x08040430
	push {r4, lr}
	adds r4, r1, #0
	ldr r2, _0804045C @ =gUnknown_08111000
	ldr r1, _08040460 @ =0x000003FF
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, _08040464 @ =0x06010000
	adds r1, r1, r0
	adds r0, r2, #0
	bl sub_08011CAC
	ldr r0, _08040468 @ =gUnknown_08111D74
	adds r4, #0x10
	lsls r4, r4, #0x15
	lsrs r4, r4, #0x10
	adds r1, r4, #0
	movs r2, #0x20
	bl sub_08013618
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804045C: .4byte gUnknown_08111000
_08040460: .4byte 0x000003FF
_08040464: .4byte 0x06010000
_08040468: .4byte gUnknown_08111D74

