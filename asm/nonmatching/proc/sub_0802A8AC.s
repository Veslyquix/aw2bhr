	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802A8AC
sub_0802A8AC: @ 0x0802A8AC
	adds r3, r0, #0
	adds r0, r1, #0
	cmp r0, #0
	bne _0802A8CC
	ldr r2, _0802A8C4 @ =gUnknown_08106864
	ldr r1, _0802A8C8 @ =gUnknown_0849A2C8
	lsls r0, r3, #2
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	lsls r0, r0, #5
	adds r0, r0, r2
	b _0802A8D4
	.align 2, 0
_0802A8C4: .4byte gUnknown_08106864
_0802A8C8: .4byte gUnknown_0849A2C8
_0802A8CC:
	ldr r1, _0802A8D8 @ =gUnknown_08106864
	adds r0, #8
	lsls r0, r0, #5
	adds r0, r0, r1
_0802A8D4:
	bx lr
	.align 2, 0
_0802A8D8: .4byte gUnknown_08106864

