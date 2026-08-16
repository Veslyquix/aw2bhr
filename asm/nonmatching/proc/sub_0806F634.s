	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806F634
sub_0806F634: @ 0x0806F634
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0806F654 @ =gUnknown_03001FFC
	ldr r0, [r4, #0x58]
	strh r0, [r1]
	cmp r0, #0xf
	ble _0806F648
	adds r0, r4, #0
	bl Proc_Break
_0806F648:
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806F654: .4byte gUnknown_03001FFC

