	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806745C
sub_0806745C: @ 0x0806745C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0806747C @ =gUnknown_03001FFC
	ldr r0, [r4, #0x58]
	strh r0, [r1]
	cmp r0, #0x1e
	ble _08067470
	adds r0, r4, #0
	bl Proc_Break
_08067470:
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806747C: .4byte gUnknown_03001FFC

