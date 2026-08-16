	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080327FC
sub_080327FC: @ 0x080327FC
	ldr r3, _0803283C @ =gUnknown_0849B060
	ldr r1, [r3]
	movs r0, #0
	strh r0, [r1, #0xa]
	ldrb r0, [r1, #0x10]
	cmp r0, #1
	bne _08032810
	ldr r0, _08032840 @ =gUnknown_0849B650
	ldrh r0, [r0]
	strh r0, [r1, #0xe]
_08032810:
	ldr r2, [r3]
	ldrb r0, [r2, #0x10]
	cmp r0, #2
	bne _08032826
	ldr r0, _08032840 @ =gUnknown_0849B650
	ldrh r1, [r2, #0xa]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	rsbs r0, r0, #0
	strh r0, [r2, #0xe]
_08032826:
	ldr r1, _08032844 @ =gUnknown_03002F18
	ldr r2, _08032848 @ =0x0000FFD4
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _0803284C @ =gUnknown_03002B34
	ldr r0, [r3]
	ldrh r0, [r0, #0xe]
	subs r0, #0x60
	strh r0, [r1]
	bx lr
	.align 2, 0
_0803283C: .4byte gUnknown_0849B060
_08032840: .4byte gUnknown_0849B650
_08032844: .4byte gUnknown_03002F18
_08032848: .4byte 0x0000FFD4
_0803284C: .4byte gUnknown_03002B34

