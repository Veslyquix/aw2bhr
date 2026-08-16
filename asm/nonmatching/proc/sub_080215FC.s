	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080215FC
sub_080215FC: @ 0x080215FC
	push {r4, r5, r6, lr}
	movs r3, #0
	ldr r2, _08021634 @ =gUnknown_08499590
	ldr r0, [r2]
	ldrh r0, [r0, #2]
	cmp r3, r0
	bhs _0802162C
	adds r5, r2, #0
	ldr r4, _08021638 @ =0x0000417A
_0802160E:
	ldr r2, [r5]
	lsls r0, r3, #1
	adds r1, r2, r4
	adds r1, r1, r0
	ldrh r0, [r2]
	adds r6, r0, #0
	muls r6, r3, r6
	adds r0, r6, #0
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldrh r2, [r2, #2]
	cmp r3, r2
	blo _0802160E
_0802162C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08021634: .4byte gUnknown_08499590
_08021638: .4byte 0x0000417A

