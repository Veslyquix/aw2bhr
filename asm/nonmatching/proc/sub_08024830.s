	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08024830
sub_08024830: @ 0x08024830
	push {r4, r5, lr}
	ldr r5, _080248D0 @ =gUnknown_0810E6E0
	ldr r4, _080248D4 @ =gUnknown_08499598
	ldr r0, [r4]
	adds r0, #0x56
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #5
	adds r0, r0, r5
	movs r1, #0xc0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, [r4]
	adds r0, #0x92
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #5
	adds r0, r0, r5
	movs r1, #0xd0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, [r4]
	adds r0, #0xce
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #5
	adds r0, r0, r5
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, [r4]
	movs r1, #0x85
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #5
	adds r0, r0, r5
	adds r1, #0xd6
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #8
	bl sub_0803F80C
	bl sub_0802D2EC
	ldr r0, _080248D8 @ =gUnknown_0809163C
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080248DC @ =gUnknown_03003FC0
	adds r0, #0x2c
	ldrb r0, [r0]
	bl sub_08035020
	bl sub_08022A34
	ldr r4, _080248E0 @ =gUnknown_030033EC
	ldrh r0, [r4]
	bl sub_0801A5B0
	ldrh r0, [r4]
	bl sub_08043834
	ldrh r0, [r4]
	bl sub_0801A57C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080248D0: .4byte gUnknown_0810E6E0
_080248D4: .4byte gUnknown_08499598
_080248D8: .4byte gUnknown_0809163C
_080248DC: .4byte gUnknown_03003FC0
_080248E0: .4byte gUnknown_030033EC

