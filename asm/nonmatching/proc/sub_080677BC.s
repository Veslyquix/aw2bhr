	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080677BC
sub_080677BC: @ 0x080677BC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _080677E4 @ =gUnknown_08580FE4
	bl Proc_Start
	str r4, [r0, #0x58]
	movs r1, #1
	str r1, [r0, #0x5c]
	movs r1, #0
	str r1, [r0, #0x30]
	str r1, [r0, #0x2c]
	str r5, [r0, #0x34]
	str r6, [r0, #0x38]
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080677E4: .4byte gUnknown_08580FE4

