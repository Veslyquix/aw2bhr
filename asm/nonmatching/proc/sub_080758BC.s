	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080758BC
sub_080758BC: @ 0x080758BC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _080758E0 @ =gUnknown_086143E0
	bl Proc_Start
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x38]
	movs r1, #0
	strh r1, [r0, #0x34]
	str r1, [r0, #0x3c]
	str r1, [r0, #0x40]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080758E0: .4byte gUnknown_086143E0

