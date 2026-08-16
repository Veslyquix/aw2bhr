	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08032788
sub_08032788: @ 0x08032788
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, _080327E8 @ =gUnknown_0849B060
	ldr r2, [r3]
	ldrh r0, [r2, #0xa]
	subs r0, #1
	strh r0, [r2, #0xa]
	ldrb r0, [r2, #0x10]
	cmp r0, #1
	bne _080327AA
	ldr r0, _080327EC @ =gUnknown_0849B650
	ldrh r1, [r2, #0xa]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	rsbs r0, r0, #0
	strh r0, [r2, #0xe]
_080327AA:
	ldr r2, [r3]
	ldrb r0, [r2, #0x10]
	cmp r0, #2
	bne _080327BE
	ldr r0, _080327EC @ =gUnknown_0849B650
	ldrh r1, [r2, #0xa]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r2, #0xe]
_080327BE:
	ldr r1, _080327F0 @ =gUnknown_03002F18
	ldr r2, _080327F4 @ =0x0000FFD4
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _080327F8 @ =gUnknown_03002B34
	ldr r1, [r3]
	ldrh r0, [r1, #0xe]
	subs r0, #0x60
	strh r0, [r2]
	ldrh r0, [r1, #0xa]
	cmp r0, #0
	bne _080327E2
	movs r0, #0x76
	bl sub_0803B4DC
	adds r0, r4, #0
	bl Proc_Break
_080327E2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080327E8: .4byte gUnknown_0849B060
_080327EC: .4byte gUnknown_0849B650
_080327F0: .4byte gUnknown_03002F18
_080327F4: .4byte 0x0000FFD4
_080327F8: .4byte gUnknown_03002B34

