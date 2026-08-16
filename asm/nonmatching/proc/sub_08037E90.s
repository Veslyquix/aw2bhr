	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08037E90
sub_08037E90: @ 0x08037E90
	push {r4, lr}
	ldr r0, _08037EEC @ =gUnknown_0849D16C
	bl sub_08012C58
	bl sub_0801295C
	bl sub_080128D0
	ldr r0, _08037EF0 @ =gUnknown_08499578
	ldr r0, [r0]
	ldr r1, _08037EF4 @ =0x06007000
	movs r4, #0x80
	lsls r4, r4, #4
	adds r2, r4, #0
	bl sub_08011C68
	ldr r0, _08037EF8 @ =gUnknown_0849957C
	ldr r0, [r0]
	ldr r1, _08037EFC @ =0x0600F000
	adds r2, r4, #0
	bl sub_08011C68
	ldr r0, _08037F00 @ =gUnknown_08499580
	ldr r0, [r0]
	ldr r1, _08037F04 @ =0x06007800
	adds r2, r4, #0
	bl sub_08011C68
	ldr r0, _08037F08 @ =gUnknown_08499584
	ldr r0, [r0]
	ldr r1, _08037F0C @ =0x0600F800
	adds r2, r4, #0
	bl sub_08011C68
	bl sub_08022A34
	ldr r0, _08037F10 @ =sub_080368E8
	bl sub_080366C4
	ldr r0, _08037F14 @ =sub_08036884
	bl sub_080366D0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08037EEC: .4byte gUnknown_0849D16C
_08037EF0: .4byte gUnknown_08499578
_08037EF4: .4byte 0x06007000
_08037EF8: .4byte gUnknown_0849957C
_08037EFC: .4byte 0x0600F000
_08037F00: .4byte gUnknown_08499580
_08037F04: .4byte 0x06007800
_08037F08: .4byte gUnknown_08499584
_08037F0C: .4byte 0x0600F800
_08037F10: .4byte sub_080368E8
_08037F14: .4byte sub_08036884

