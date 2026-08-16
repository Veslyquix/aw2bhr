	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08039760
sub_08039760: @ 0x08039760
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x64
	ldrh r0, [r2]
	adds r1, r0, #1
	strh r1, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r3, _080397B0 @ =gUnknown_08090F68
	cmp r0, #8
	ble _0803978C
	ldr r1, [r3]
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	ldr r1, _080397B4 @ =gUnknown_03002B28
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r0, #0
	strh r0, [r2]
_0803978C:
	ldr r0, [r3]
	ldrh r0, [r0]
	cmp r0, #0
	bne _080397A8
	adds r0, r4, #0
	bl Proc_Break
	ldr r0, _080397B8 @ =gUnknown_0849D7FC
	bl Proc_EndEach
	bl sub_08013C00
	bl sub_08013AEC
_080397A8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080397B0: .4byte gUnknown_08090F68
_080397B4: .4byte gUnknown_03002B28
_080397B8: .4byte gUnknown_0849D7FC

