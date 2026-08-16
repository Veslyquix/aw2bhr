	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08032734
sub_08032734: @ 0x08032734
	ldr r3, _08032774 @ =gUnknown_0849B060
	ldr r1, [r3]
	movs r0, #0xf
	strh r0, [r1, #0xa]
	ldrb r0, [r1, #0x10]
	cmp r0, #1
	bne _0803274A
	ldr r0, _08032778 @ =gUnknown_0849B650
	ldrh r0, [r0, #0x1e]
	rsbs r0, r0, #0
	strh r0, [r1, #0xe]
_0803274A:
	ldr r2, [r3]
	ldrb r0, [r2, #0x10]
	cmp r0, #2
	bne _0803275E
	ldr r0, _08032778 @ =gUnknown_0849B650
	ldrh r1, [r2, #0xa]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r2, #0xe]
_0803275E:
	ldr r1, _0803277C @ =gUnknown_03002F18
	ldr r2, _08032780 @ =0x0000FFD4
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _08032784 @ =gUnknown_03002B34
	ldr r0, [r3]
	ldrh r0, [r0, #0xe]
	subs r0, #0x60
	strh r0, [r1]
	bx lr
	.align 2, 0
_08032774: .4byte gUnknown_0849B060
_08032778: .4byte gUnknown_0849B650
_0803277C: .4byte gUnknown_03002F18
_08032780: .4byte 0x0000FFD4
_08032784: .4byte gUnknown_03002B34

