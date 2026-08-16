	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067638
sub_08067638: @ 0x08067638
	push {lr}
	ldr r0, _08067678 @ =gUnknown_0817B970
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl Decompress
	ldr r0, _0806767C @ =gUnknown_0817BE90
	ldr r1, _08067680 @ =0x0600D800
	bl Decompress
	ldr r0, _08067684 @ =gUnknown_0817C138
	ldr r1, _08067688 @ =0x0600E000
	bl Decompress
	ldr r0, _0806768C @ =gUnknown_0817C3E8
	movs r1, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_08072C40
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl sub_08072C40
	pop {r0}
	bx r0
	.align 2, 0
_08067678: .4byte gUnknown_0817B970
_0806767C: .4byte gUnknown_0817BE90
_08067680: .4byte 0x0600D800
_08067684: .4byte gUnknown_0817C138
_08067688: .4byte 0x0600E000
_0806768C: .4byte gUnknown_0817C3E8

