	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08032850
sub_08032850: @ 0x08032850
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, _080328AC @ =gUnknown_0849B060
	ldr r2, [r3]
	ldrh r0, [r2, #0xa]
	adds r0, #1
	strh r0, [r2, #0xa]
	ldrb r0, [r2, #0x10]
	cmp r0, #1
	bne _08032870
	ldr r0, _080328B0 @ =gUnknown_0849B650
	ldrh r1, [r2, #0xa]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r2, #0xe]
_08032870:
	ldr r2, [r3]
	ldrb r0, [r2, #0x10]
	cmp r0, #2
	bne _08032886
	ldr r0, _080328B0 @ =gUnknown_0849B650
	ldrh r1, [r2, #0xa]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	rsbs r0, r0, #0
	strh r0, [r2, #0xe]
_08032886:
	ldr r1, _080328B4 @ =gUnknown_03002F18
	ldr r2, _080328B8 @ =0x0000FFD4
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _080328BC @ =gUnknown_03002B34
	ldr r1, [r3]
	ldrh r0, [r1, #0xe]
	subs r0, #0x60
	strh r0, [r2]
	ldrh r0, [r1, #0xa]
	cmp r0, #0xf
	bne _080328A4
	adds r0, r4, #0
	bl Proc_Break
_080328A4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080328AC: .4byte gUnknown_0849B060
_080328B0: .4byte gUnknown_0849B650
_080328B4: .4byte gUnknown_03002F18
_080328B8: .4byte 0x0000FFD4
_080328BC: .4byte gUnknown_03002B34

