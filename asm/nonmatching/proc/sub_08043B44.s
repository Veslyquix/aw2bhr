	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08043B44
sub_08043B44: @ 0x08043B44
	push {lr}
	adds r1, r0, #0
	ldr r0, _08043B5C @ =gUnknown_080F6164
	adds r1, #0x10
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x10
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
_08043B5C: .4byte gUnknown_080F6164

