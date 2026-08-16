	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08022A34
sub_08022A34: @ 0x08022A34
	push {lr}
	ldr r0, _08022A58 @ =gUnknown_081019C4
	ldr r1, _08022A5C @ =0x06016CA0
	bl Decompress
	ldr r0, _08022A60 @ =gUnknown_08101904
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08022A64 @ =gUnknown_08124268
	ldr r1, _08022A68 @ =0x06016A40
	bl Decompress
	pop {r0}
	bx r0
	.align 2, 0
_08022A58: .4byte gUnknown_081019C4
_08022A5C: .4byte 0x06016CA0
_08022A60: .4byte gUnknown_08101904
_08022A64: .4byte gUnknown_08124268
_08022A68: .4byte 0x06016A40

