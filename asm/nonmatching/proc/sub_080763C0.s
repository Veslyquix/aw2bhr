	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080763C0
sub_080763C0: @ 0x080763C0
	push {lr}
	ldr r0, _080763E4 @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #0x3f
	ands r0, r1
	lsrs r0, r0, #2
	ldr r2, _080763E8 @ =gUnknown_081D22A4
	ldr r1, _080763EC @ =gUnknown_030020C0
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	ldr r2, _080763F0 @ =0x000002AE
	adds r1, r1, r2
	strh r0, [r1]
	bl sub_080135A4
	pop {r0}
	bx r0
	.align 2, 0
_080763E4: .4byte gUnknown_03004008
_080763E8: .4byte gUnknown_081D22A4
_080763EC: .4byte gUnknown_030020C0
_080763F0: .4byte 0x000002AE

