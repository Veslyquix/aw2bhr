	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802D918
sub_0802D918: @ 0x0802D918
	push {lr}
	bl sub_08024268
	bl sub_08024274
	ldr r2, _0802D984 @ =gUnknown_03001418
	ldr r1, _0802D988 @ =gUnknown_03001FF8
	movs r0, #0
	strh r0, [r1]
	ldrh r0, [r1]
	strh r0, [r2]
	ldr r2, _0802D98C @ =gUnknown_03001470
	ldr r0, _0802D990 @ =gUnknown_03001FBC
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r1, r1, r2
	movs r0, #0
	strh r0, [r1, #0x1e]
	strh r0, [r1, #0x20]
	ldr r0, _0802D994 @ =gUnknown_0300055A
	ldrh r0, [r0]
	subs r0, #1
	strh r0, [r1, #0x22]
	bl sub_0802D7B0
	movs r0, #1
	movs r1, #4
	movs r2, #0xf
	movs r3, #0x10
	bl sub_0801A444
	movs r0, #0
	bl sub_0802D7B4
	movs r0, #8
	movs r1, #0x28
	bl sub_08022AD0
	movs r0, #0x65
	bl sub_0803B4DC
	ldr r0, _0802D998 @ =gUnknown_02023830
	ldrb r0, [r0]
	bl sub_0803A9C8
	movs r0, #1
	bl sub_0802776C
	pop {r0}
	bx r0
	.align 2, 0
_0802D984: .4byte gUnknown_03001418
_0802D988: .4byte gUnknown_03001FF8
_0802D98C: .4byte gUnknown_03001470
_0802D990: .4byte gUnknown_03001FBC
_0802D994: .4byte gUnknown_0300055A
_0802D998: .4byte gUnknown_02023830

