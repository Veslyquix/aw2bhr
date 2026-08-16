	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080639E8
sub_080639E8: @ 0x080639E8
	push {lr}
	adds r1, r0, #0
	ldr r0, _080639FC @ =gUnknown_08131B4C
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x10
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
_080639FC: .4byte gUnknown_08131B4C

