	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080616F0
sub_080616F0: @ 0x080616F0
	push {r4, r5, lr}
	movs r2, #0
	ldr r5, _08061714 @ =gUnknown_08499584
	movs r4, #0
	ldr r3, _08061718 @ =0x000003FF
_080616FA:
	ldr r0, [r5]
	lsls r1, r2, #1
	adds r1, r1, r0
	strh r4, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, r3
	bls _080616FA
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08061714: .4byte gUnknown_08499584
_08061718: .4byte 0x000003FF

