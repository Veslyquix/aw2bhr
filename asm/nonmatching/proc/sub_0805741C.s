	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805741C
sub_0805741C: @ 0x0805741C
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _08057454 @ =gUnknown_030030B4
	ldr r3, _08057458 @ =gUnknown_085538AE
	movs r2, #1
	adds r1, r0, #0
	eors r1, r2
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r1, [r1]
	movs r5, #0xc1
	lsls r5, r5, #3
	adds r2, r5, #0
	orrs r1, r2
	strh r1, [r4]
	ldr r2, _0805745C @ =gUnknown_0300251C
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	ldr r3, _08057460 @ =0x0000070C
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08057454: .4byte gUnknown_030030B4
_08057458: .4byte gUnknown_085538AE
_0805745C: .4byte gUnknown_0300251C
_08057460: .4byte 0x0000070C

