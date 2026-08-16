	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C480
sub_0802C480: @ 0x0802C480
	ldr r1, [r0, #0x20]
	ldr r0, _0802C4AC @ =gUnknown_08499590
	ldr r2, [r0]
	ldr r0, [r2, #4]
	cmp r1, r0
	beq _0802C4A2
	ldr r0, _0802C4B0 @ =gUnknown_030033E4
	ldrh r1, [r2, #4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	adds r1, #7
	strh r1, [r0]
	ldrh r1, [r2, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	adds r1, #5
	strh r1, [r0, #2]
_0802C4A2:
	ldr r1, _0802C4B4 @ =gUnknown_03003334
	movs r0, #0
	strh r0, [r1]
	bx lr
	.align 2, 0
_0802C4AC: .4byte gUnknown_08499590
_0802C4B0: .4byte gUnknown_030033E4
_0802C4B4: .4byte gUnknown_03003334

