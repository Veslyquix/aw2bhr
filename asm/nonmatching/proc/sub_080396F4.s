	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080396F4
sub_080396F4: @ 0x080396F4
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x64
	ldrh r0, [r2]
	adds r1, r0, #1
	strh r1, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r3, _08039744 @ =gUnknown_08090F64
	cmp r0, #2
	ble _08039720
	ldr r1, [r3]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r1, _08039748 @ =gUnknown_03002B28
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	movs r0, #0
	strh r0, [r2]
_08039720:
	ldr r0, [r3]
	ldrh r0, [r0]
	cmp r0, #8
	bne _0803973E
	adds r0, r4, #0
	bl Proc_Break
	ldr r0, [r4, #0x54]
	bl sub_08039F18
	bl sub_08039544
	ldr r0, _0803974C @ =gUnknown_0849D6D4
	bl Proc_BreakEach
_0803973E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08039744: .4byte gUnknown_08090F64
_08039748: .4byte gUnknown_03002B28
_0803974C: .4byte gUnknown_0849D6D4

