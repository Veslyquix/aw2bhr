	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08028848
sub_08028848: @ 0x08028848
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _08028870 @ =gUnknown_08499FAC
	movs r1, #3
	bl Proc_Start
	adds r1, r0, #0
	adds r1, #0x64
	strh r4, [r1]
	adds r0, #0x66
	strh r5, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08028870: .4byte gUnknown_08499FAC

