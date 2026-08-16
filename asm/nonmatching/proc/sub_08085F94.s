	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08085F94
sub_08085F94: @ 0x08085F94
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x48
	movs r0, #0x40
	strh r0, [r1]
	ldr r1, _08085FBC @ =gUnknown_081D940C
	ldr r0, [r1]
	ldrb r0, [r0, #1]
	adds r5, r1, #0
	cmp r0, #2
	bne _08085FC8
	ldr r2, _08085FC0 @ =gUnknown_03005900
	ldrb r0, [r2]
	ldr r1, _08085FC4 @ =gUnknown_03005930
	ldrh r1, [r1]
	adds r0, r0, r1
	str r0, [r4, #0x58]
	ldrb r0, [r2]
	b _08085FE4
	.align 2, 0
_08085FBC: .4byte gUnknown_081D940C
_08085FC0: .4byte gUnknown_03005900
_08085FC4: .4byte gUnknown_03005930
_08085FC8:
	ldr r3, _0808602C @ =gUnknown_03005990
	ldr r2, _08086030 @ =gUnknown_0300596C
	movs r1, #0
	ldrsh r0, [r2, r1]
	adds r0, r0, r3
	ldrb r0, [r0]
	ldr r1, _08086034 @ =gUnknown_03005980
	ldrh r1, [r1]
	adds r0, r0, r1
	str r0, [r4, #0x58]
	movs r1, #0
	ldrsh r0, [r2, r1]
	adds r0, r0, r3
	ldrb r0, [r0]
_08085FE4:
	str r0, [r4, #0x5c]
	adds r0, r4, #0
	adds r0, #0x4e
	movs r1, #0
	strh r1, [r0]
	str r1, [r4, #0x30]
	adds r0, #4
	strh r1, [r0]
	movs r0, #0x14
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x4c
	strh r1, [r0]
	adds r0, r4, #0
	bl sub_08087104
	ldr r0, [r5]
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _08086024
	ldr r0, [r4, #0x58]
	adds r1, r4, #0
	bl sub_08087884
	ldr r0, _08086038 @ =gUnknown_0200C420
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	beq _08086024
	ldr r0, [r4, #0x58]
	adds r1, r4, #0
	bl sub_08087974
_08086024:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808602C: .4byte gUnknown_03005990
_08086030: .4byte gUnknown_0300596C
_08086034: .4byte gUnknown_03005980
_08086038: .4byte gUnknown_0200C420

