	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08087168
sub_08087168: @ 0x08087168
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _080871AC @ =gUnknown_03003FC0
	ldrb r4, [r0, #1]
	cmp r4, #2
	bne _080871B8
	cmp r5, #0
	beq _08087188
	str r4, [sp]
	movs r0, #0x43
	movs r1, #0x24
	movs r2, #0x20
	movs r3, #0
	bl sub_0801F34C
_08087188:
	ldr r0, _080871B0 @ =gUnknown_02027F74
	adds r0, #0x37
	ldrb r0, [r0]
	subs r0, r0, r5
	ldr r1, _080871B4 @ =gUnknown_03005928
	ldr r1, [r1]
	adds r0, #1
	cmp r1, r0
	beq _08087210
	str r4, [sp]
	movs r0, #0x44
	movs r1, #0x24
	movs r2, #0x98
	movs r3, #0
	bl sub_0801F34C
	b _08087210
	.align 2, 0
_080871AC: .4byte gUnknown_03003FC0
_080871B0: .4byte gUnknown_02027F74
_080871B4: .4byte gUnknown_03005928
_080871B8:
	cmp r5, #0
	beq _080871CC
	movs r0, #2
	str r0, [sp]
	movs r0, #0x43
	movs r1, #0x20
	movs r2, #0x40
	movs r3, #0
	bl sub_0801F34C
_080871CC:
	ldr r0, _08087218 @ =gUnknown_02027F74
	adds r0, #0x37
	ldrb r2, [r0]
	subs r0, r2, r5
	ldr r1, _0808721C @ =gUnknown_03005928
	ldr r1, [r1]
	adds r0, #1
	cmp r1, r0
	beq _080871F2
	cmp r2, r1
	ble _080871F2
	movs r0, #2
	str r0, [sp]
	movs r0, #0x44
	movs r1, #0x20
	movs r2, #0x98
	movs r3, #0
	bl sub_0801F34C
_080871F2:
	movs r4, #2
	str r4, [sp]
	movs r0, #0x45
	movs r1, #0
	movs r2, #0x28
	movs r3, #0
	bl sub_0801F34C
	str r4, [sp]
	movs r0, #0x46
	movs r1, #0x48
	movs r2, #0x28
	movs r3, #0
	bl sub_0801F34C
_08087210:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087218: .4byte gUnknown_02027F74
_0808721C: .4byte gUnknown_03005928

