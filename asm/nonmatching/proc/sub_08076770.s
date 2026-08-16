	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08076770
sub_08076770: @ 0x08076770
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _08076794 @ =gUnknown_086144FC
	bl Proc_Start
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x58]
	movs r1, #0
	str r1, [r0, #0x5c]
	adds r0, #0x64
	strh r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08076794: .4byte gUnknown_086144FC

