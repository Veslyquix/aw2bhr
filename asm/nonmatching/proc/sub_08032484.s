	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08032484
sub_08032484: @ 0x08032484
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080324C0 @ =0x00003314
	adds r2, r4, #0
	movs r3, #0x1d
_0803248E:
	adds r1, r0, #0
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	strh r1, [r2]
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bge _0803248E
	adds r2, r4, #0
	adds r2, #0x40
	movs r3, #0x1d
_080324A6:
	adds r1, r0, #0
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	strh r1, [r2]
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bge _080324A6
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080324C0: .4byte 0x00003314

