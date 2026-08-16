	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045B30
sub_08045B30: @ 0x08045B30
	push {r4, r5, lr}
	ldr r0, _08045BD0 @ =gUnknown_08499590
	ldr r5, [r0]
	ldr r1, _08045BD4 @ =0x00004186
	adds r0, r5, r1
	ldrh r1, [r0]
	adds r0, r1, #0
	adds r0, #8
	ldr r2, _08045BD8 @ =0x00001432
	adds r3, r5, r2
	adds r0, r3, r0
	ldrb r0, [r0]
	movs r2, #0xe0
	lsrs r0, r0, #5
	cmp r0, #1
	bne _08045BE8
	adds r0, r1, #0
	adds r0, #0xb
	adds r0, r3, r0
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0x20
	bne _08045BE8
	ldr r1, _08045BDC @ =0x00004188
	adds r0, r5, r1
	ldrh r4, [r0]
	adds r0, r4, #7
	adds r0, r3, r0
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0x20
	bne _08045BE8
	adds r0, r4, #0
	adds r0, #0xc
	adds r0, r3, r0
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0x20
	bne _08045BE8
	ldr r1, _08045BE0 @ =0x0000418E
	adds r0, r5, r1
	ldrh r4, [r0]
	adds r0, r4, #7
	adds r0, r3, r0
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0x20
	bne _08045BE8
	adds r0, r4, #0
	adds r0, #0xc
	adds r0, r3, r0
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0x20
	bne _08045BE8
	ldr r1, _08045BE4 @ =0x00004190
	adds r0, r5, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	adds r0, #8
	adds r0, r3, r0
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0x20
	bne _08045BE8
	adds r0, r4, #0
	adds r0, #0xb
	adds r0, r3, r0
	ldrb r0, [r0]
	ands r2, r0
	cmp r2, #0x20
	bne _08045BE8
	movs r0, #1
	b _08045BEA
	.align 2, 0
_08045BD0: .4byte gUnknown_08499590
_08045BD4: .4byte 0x00004186
_08045BD8: .4byte 0x00001432
_08045BDC: .4byte 0x00004188
_08045BE0: .4byte 0x0000418E
_08045BE4: .4byte 0x00004190
_08045BE8:
	movs r0, #0
_08045BEA:
	pop {r4, r5}
	pop {r1}
	bx r1

