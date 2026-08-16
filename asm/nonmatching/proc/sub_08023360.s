	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08023360
sub_08023360: @ 0x08023360
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl sub_08011B18
	cmp r4, #1
	bne _08023370
	bl sub_08010FE0
_08023370:
	cmp r4, #0
	bne _08023378
	bl sub_08011018
_08023378:
	ldr r0, _080234C0 @ =gUnknown_0849D16C
	bl sub_08012C58
	bl sub_08023860
	bl sub_080128D0
	ldr r4, _080234C4 @ =gUnknown_0809175C
	ldr r1, _080234C8 @ =0x06003600
	adds r0, r4, #0
	movs r2, #0xa0
	bl sub_08011C68
	bl sub_08026190
	adds r5, r0, #0
	ldr r6, _080234CC @ =0x060046A0
	bl sub_080261A0
	adds r2, r0, #0
	ldr r1, _080234D0 @ =0x000003FF
	adds r0, r1, #0
	ands r2, r0
	lsls r2, r2, #5
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08011C68
	bl sub_08026198
	ldr r1, _080234D4 @ =0x06005440
	movs r2, #0x80
	lsls r2, r2, #2
	bl sub_08011C68
	ldr r0, _080234D8 @ =gUnknown_080BD1EC
	ldr r1, _080234DC @ =0x06008000
	bl Decompress
	adds r4, #0xa0
	ldr r1, _080234E0 @ =0x0600E780
	adds r0, r4, #0
	movs r2, #0x20
	bl sub_08011C68
	ldr r0, _080234E4 @ =gUnknown_08499578
	ldr r0, [r0]
	ldr r1, _080234E8 @ =0x06007000
	movs r6, #0x80
	lsls r6, r6, #4
	adds r2, r6, #0
	bl sub_08011C68
	ldr r0, _080234EC @ =gUnknown_0849957C
	ldr r0, [r0]
	ldr r1, _080234F0 @ =0x0600F000
	adds r2, r6, #0
	bl sub_08011C68
	ldr r0, _080234F4 @ =gUnknown_08499580
	ldr r0, [r0]
	ldr r1, _080234F8 @ =0x06007800
	adds r2, r6, #0
	bl sub_08011C68
	ldr r5, _080234FC @ =gUnknown_0810E6E0
	ldr r4, _08023500 @ =gUnknown_08499598
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
	ldr r0, _08023504 @ =gUnknown_0809163C
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0xd3
	lsls r0, r0, #1
	bl sub_08037150
	bl sub_08024268
	bl sub_08022A08
	ldr r0, _08023508 @ =gUnknown_08499584
	ldr r0, [r0]
	ldr r1, _0802350C @ =0x0600F800
	adds r2, r6, #0
	bl sub_08011C68
	bl sub_08035568
	bl sub_080116E8
	bl sub_080354FC
	ldr r0, _08023510 @ =gUnknown_03003FC0
	adds r0, #0x2c
	ldrb r0, [r0]
	bl sub_08035020
	bl sub_08022A34
	ldr r4, _08023514 @ =gUnknown_030033EC
	ldrh r0, [r4]
	bl sub_0801A5B0
	ldrh r0, [r4]
	bl sub_08043834
	ldrh r0, [r4]
	bl sub_0801A57C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080234C0: .4byte gUnknown_0849D16C
_080234C4: .4byte gUnknown_0809175C
_080234C8: .4byte 0x06003600
_080234CC: .4byte 0x060046A0
_080234D0: .4byte 0x000003FF
_080234D4: .4byte 0x06005440
_080234D8: .4byte gUnknown_080BD1EC
_080234DC: .4byte 0x06008000
_080234E0: .4byte 0x0600E780
_080234E4: .4byte gUnknown_08499578
_080234E8: .4byte 0x06007000
_080234EC: .4byte gUnknown_0849957C
_080234F0: .4byte 0x0600F000
_080234F4: .4byte gUnknown_08499580
_080234F8: .4byte 0x06007800
_080234FC: .4byte gUnknown_0810E6E0
_08023500: .4byte gUnknown_08499598
_08023504: .4byte gUnknown_0809163C
_08023508: .4byte gUnknown_08499584
_0802350C: .4byte 0x0600F800
_08023510: .4byte gUnknown_03003FC0
_08023514: .4byte gUnknown_030033EC

