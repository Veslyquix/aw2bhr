	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801D96C
sub_0801D96C: @ 0x0801D96C
	push {r4, lr}
	ldr r4, _0801D988 @ =gUnknown_0200E438
	movs r3, #0x4c
	muls r0, r3, r0
	adds r0, r0, r4
	lsls r1, r1, #0x10
	asrs r1, r1, #8
	str r1, [r0, #0x14]
	lsls r2, r2, #0x10
	asrs r2, r2, #8
	str r2, [r0, #0x18]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801D988: .4byte gUnknown_0200E438

