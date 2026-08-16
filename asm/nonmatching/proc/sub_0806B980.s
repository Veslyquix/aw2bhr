	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806B980
sub_0806B980: @ 0x0806B980
	ldr r2, _0806B9B8 @ =gUnknown_03004008
	ldr r0, [r2]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0806B9A4
	ldr r1, _0806B9BC @ =gUnknown_03002F18
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r1, _0806B9C0 @ =gUnknown_03001400
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	ldr r1, _0806B9C4 @ =gUnknown_0300200C
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0806B9A4:
	ldr r0, [r2]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _0806B9B6
	ldr r1, _0806B9C8 @ =gUnknown_03002000
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_0806B9B6:
	bx lr
	.align 2, 0
_0806B9B8: .4byte gUnknown_03004008
_0806B9BC: .4byte gUnknown_03002F18
_0806B9C0: .4byte gUnknown_03001400
_0806B9C4: .4byte gUnknown_0300200C
_0806B9C8: .4byte gUnknown_03002000

