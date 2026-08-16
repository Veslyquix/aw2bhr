	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08037DC8
sub_08037DC8: @ 0x08037DC8
	push {r4, lr}
	ldr r0, _08037E34 @ =gUnknown_0849D16C
	bl sub_08012C58
	bl sub_0801295C
	bl sub_080128D0
	ldr r0, _08037E38 @ =gUnknown_08499578
	ldr r0, [r0]
	ldr r1, _08037E3C @ =0x06007000
	movs r4, #0x80
	lsls r4, r4, #4
	adds r2, r4, #0
	bl sub_08011C68
	ldr r0, _08037E40 @ =gUnknown_0849957C
	ldr r0, [r0]
	ldr r1, _08037E44 @ =0x0600F000
	adds r2, r4, #0
	bl sub_08011C68
	ldr r0, _08037E48 @ =gUnknown_08499580
	ldr r0, [r0]
	ldr r1, _08037E4C @ =0x06007800
	adds r2, r4, #0
	bl sub_08011C68
	ldr r0, _08037E50 @ =gUnknown_08499584
	ldr r0, [r0]
	ldr r1, _08037E54 @ =0x0600F800
	adds r2, r4, #0
	bl sub_08011C68
	ldr r0, _08037E58 @ =gUnknown_080A0F38
	ldr r1, _08037E5C @ =0x06000020
	movs r2, #0x80
	lsls r2, r2, #2
	bl sub_08011C68
	ldr r0, _08037E60 @ =gUnknown_080A1138
	movs r1, #0x20
	movs r2, #0x20
	bl ApplyPaletteExt
	bl sub_08022A34
	movs r0, #0
	bl sub_0801A5B0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08037E34: .4byte gUnknown_0849D16C
_08037E38: .4byte gUnknown_08499578
_08037E3C: .4byte 0x06007000
_08037E40: .4byte gUnknown_0849957C
_08037E44: .4byte 0x0600F000
_08037E48: .4byte gUnknown_08499580
_08037E4C: .4byte 0x06007800
_08037E50: .4byte gUnknown_08499584
_08037E54: .4byte 0x0600F800
_08037E58: .4byte gUnknown_080A0F38
_08037E5C: .4byte 0x06000020
_08037E60: .4byte gUnknown_080A1138

