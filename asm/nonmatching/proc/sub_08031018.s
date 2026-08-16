	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08031018
sub_08031018: @ 0x08031018
	push {r4, lr}
	ldr r4, _080310B8 @ =gUnknown_081D3E48
	movs r1, #0xc0
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl sub_080135F4
	movs r1, #0xc8
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl sub_080135F4
	movs r1, #0xd0
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl sub_080135F4
	movs r1, #0xd8
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl sub_080135F4
	ldr r0, _080310BC @ =gUnknown_081D3810
	ldr r1, _080310C0 @ =0x060114A0
	bl Decompress
	ldr r1, _080310C4 @ =0x06010000
	movs r0, #2
	movs r2, #0
	movs r3, #0x16
	bl sub_0801F150
	movs r0, #0x50
	bl sub_0801F234
	movs r0, #0x4f
	bl sub_0801F234
	movs r0, #0x4a
	bl sub_0801F234
	movs r0, #0x4b
	bl sub_0801F234
	movs r0, #0x4c
	bl sub_0801F234
	movs r0, #0x4d
	bl sub_0801F234
	ldr r0, _080310C8 @ =gUnknown_081320AC
	movs r1, #0x60
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080310CC @ =gUnknown_0849B0A0
	movs r1, #0xe0
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0
	bl sub_0801A5B0
	ldr r0, _080310D0 @ =gUnknown_0849B018
	ldr r1, [r0]
	ldrb r0, [r1, #0x1e]
	movs r0, #0x10
	strb r0, [r1, #0x1e]
	ldr r0, _080310D4 @ =gUnknown_0849B060
	ldr r1, [r0]
	movs r0, #0x13
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080310B8: .4byte gUnknown_081D3E48
_080310BC: .4byte gUnknown_081D3810
_080310C0: .4byte 0x060114A0
_080310C4: .4byte 0x06010000
_080310C8: .4byte gUnknown_081320AC
_080310CC: .4byte gUnknown_0849B0A0
_080310D0: .4byte gUnknown_0849B018
_080310D4: .4byte gUnknown_0849B060

