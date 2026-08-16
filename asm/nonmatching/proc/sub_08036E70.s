	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08036E70
sub_08036E70: @ 0x08036E70
	push {r4, lr}
	ldr r0, _08036EEC @ =gUnknown_0849D16C
	bl sub_08012C58
	ldr r2, _08036EF0 @ =gDispIo
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	bl sub_0801295C
	bl sub_080128D0
	ldr r0, _08036EF4 @ =gUnknown_08499578
	ldr r0, [r0]
	ldr r1, _08036EF8 @ =0x06007000
	movs r4, #0x80
	lsls r4, r4, #4
	adds r2, r4, #0
	bl sub_08011C68
	ldr r0, _08036EFC @ =gUnknown_0849957C
	ldr r0, [r0]
	ldr r1, _08036F00 @ =0x0600F000
	adds r2, r4, #0
	bl sub_08011C68
	ldr r0, _08036F04 @ =gUnknown_08499580
	ldr r0, [r0]
	ldr r1, _08036F08 @ =0x06007800
	adds r2, r4, #0
	bl sub_08011C68
	ldr r0, _08036F0C @ =gUnknown_08499584
	ldr r0, [r0]
	ldr r1, _08036F10 @ =0x0600F800
	adds r2, r4, #0
	bl sub_08011C68
	bl sub_0802465C
	movs r0, #0
	bl sub_0801A5B0
	ldr r0, _08036F14 @ =gUnknown_0809165C
	movs r1, #0xa0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	bl sub_08011B18
	ldr r0, _08036F18 @ =sub_080368E8
	bl sub_080366C4
	ldr r0, _08036F1C @ =sub_08036884
	bl sub_080366D0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08036EEC: .4byte gUnknown_0849D16C
_08036EF0: .4byte gDispIo
_08036EF4: .4byte gUnknown_08499578
_08036EF8: .4byte 0x06007000
_08036EFC: .4byte gUnknown_0849957C
_08036F00: .4byte 0x0600F000
_08036F04: .4byte gUnknown_08499580
_08036F08: .4byte 0x06007800
_08036F0C: .4byte gUnknown_08499584
_08036F10: .4byte 0x0600F800
_08036F14: .4byte gUnknown_0809165C
_08036F18: .4byte sub_080368E8
_08036F1C: .4byte sub_08036884

