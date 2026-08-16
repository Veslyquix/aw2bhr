	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080872D0
sub_080872D0: @ 0x080872D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	ldr r0, _08087334 @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	cmp r0, #2
	beq _080872E8
	b _080873F4
_080872E8:
	movs r6, #0x70
	mov r1, r8
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #4
	ldr r4, _08087338 @ =gUnknown_081D9448
	ldr r1, [r4]
	adds r5, r1, #0
	adds r5, #0x37
	ldrb r1, [r5]
	adds r1, #1
	bl Div
	adds r7, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	beq _0808731C
	ldr r0, _0808733C @ =gUnknown_03005928
	ldr r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #4
	ldrb r1, [r5]
	bl Div
	adds r6, r0, #0
_0808731C:
	movs r4, #0
	ldr r0, _08087340 @ =gUnknown_081D944C
	mov sl, r0
	subs r6, #8
	ldr r1, [r0]
	mov sb, r1
	movs r5, #0x28
_0808732A:
	cmp r4, #0
	beq _08087348
	ldr r0, _08087344 @ =0x00006089
	b _0808734A
	.align 2, 0
_08087334: .4byte gUnknown_03003FC0
_08087338: .4byte gUnknown_081D9448
_0808733C: .4byte gUnknown_03005928
_08087340: .4byte gUnknown_081D944C
_08087344: .4byte 0x00006089
_08087348:
	ldr r0, _080873A8 @ =0x00006088
_0808734A:
	str r0, [sp]
	movs r0, #5
	movs r1, #0x58
	adds r2, r5, #0
	mov r3, sb
	bl sub_0801BEBC
	adds r5, #8
	adds r4, #1
	cmp r4, #0xd
	ble _0808732A
	ldr r0, _080873AC @ =gUnknown_02027F74
	adds r0, #0x37
	ldrb r0, [r0]
	ldr r1, _080873B0 @ =gUnknown_03005928
	ldr r1, [r1]
	subs r0, r0, r1
	cmp r8, r0
	ble _080873B8
	movs r4, #0
	cmp r4, r6
	blt _08087378
	b _08087500
_08087378:
	adds r0, r4, #0
	movs r1, #8
	bl DivRem
	adds r5, r4, #1
	cmp r0, #0
	beq _0808738A
	cmp r5, r6
	bne _080873A0
_0808738A:
	adds r2, r7, #0
	adds r2, #0x29
	adds r2, r4, r2
	ldr r0, _080873B4 @ =0x0000608F
	str r0, [sp]
	movs r0, #4
	movs r1, #0x58
	mov r4, sl
	ldr r3, [r4]
	bl sub_0801BEBC
_080873A0:
	adds r4, r5, #0
	cmp r4, r6
	blt _08087378
	b _08087500
	.align 2, 0
_080873A8: .4byte 0x00006088
_080873AC: .4byte gUnknown_02027F74
_080873B0: .4byte gUnknown_03005928
_080873B4: .4byte 0x0000608F
_080873B8:
	movs r4, #0
	cmp r4, r6
	blt _080873C0
	b _08087500
_080873C0:
	adds r0, r4, #0
	movs r1, #8
	bl DivRem
	adds r5, r4, #1
	cmp r0, #0
	beq _080873D2
	cmp r5, r6
	bne _080873E8
_080873D2:
	adds r2, r7, #0
	adds r2, #0x29
	adds r2, r4, r2
	ldr r0, _080873F0 @ =0x0000608F
	str r0, [sp]
	movs r0, #4
	movs r1, #0x58
	mov r4, sl
	ldr r3, [r4]
	bl sub_0801BEBC
_080873E8:
	adds r4, r5, #0
	cmp r4, r6
	blt _080873C0
	b _08087500
	.align 2, 0
_080873F0: .4byte 0x0000608F
_080873F4:
	movs r6, #0x50
	mov r1, r8
	lsls r0, r1, #2
	add r0, r8
	lsls r0, r0, #4
	ldr r4, _0808744C @ =gUnknown_081D9448
	ldr r1, [r4]
	adds r5, r1, #0
	adds r5, #0x37
	ldrb r1, [r5]
	adds r1, #1
	bl Div
	adds r7, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	beq _0808742A
	ldr r0, _08087450 @ =gUnknown_03005928
	ldr r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #4
	ldrb r1, [r5]
	adds r1, #1
	bl Div
	adds r6, r0, #0
_0808742A:
	ldrb r0, [r5]
	ldr r1, _08087450 @ =gUnknown_03005928
	ldr r1, [r1]
	cmp r0, r1
	blt _08087500
	movs r4, #0
	ldr r0, _08087454 @ =gUnknown_081D944C
	mov sl, r0
	subs r6, #8
	ldr r1, [r0]
	mov sb, r1
	movs r5, #0x48
_08087442:
	cmp r4, #0
	beq _0808745C
	ldr r0, _08087458 @ =0x00006089
	b _0808745E
	.align 2, 0
_0808744C: .4byte gUnknown_081D9448
_08087450: .4byte gUnknown_03005928
_08087454: .4byte gUnknown_081D944C
_08087458: .4byte 0x00006089
_0808745C:
	ldr r0, _080874BC @ =0x00006088
_0808745E:
	str r0, [sp]
	movs r0, #5
	movs r1, #0x48
	adds r2, r5, #0
	mov r3, sb
	bl sub_0801BEBC
	adds r5, #8
	adds r4, #1
	cmp r4, #9
	ble _08087442
	ldr r0, _080874C0 @ =gUnknown_02027F74
	adds r0, #0x37
	ldrb r1, [r0]
	ldr r0, _080874C4 @ =gUnknown_03005928
	ldr r0, [r0]
	subs r0, #1
	subs r1, r1, r0
	cmp r8, r1
	ble _080874CC
	movs r4, #0
	cmp r4, r6
	bge _08087500
_0808748C:
	adds r0, r4, #0
	movs r1, #8
	bl DivRem
	adds r5, r4, #1
	cmp r0, #0
	beq _0808749E
	cmp r5, r6
	bne _080874B4
_0808749E:
	adds r2, r7, #0
	adds r2, #0x48
	adds r2, r4, r2
	ldr r0, _080874C8 @ =0x0000608F
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	mov r4, sl
	ldr r3, [r4]
	bl sub_0801BEBC
_080874B4:
	adds r4, r5, #0
	cmp r4, r6
	blt _0808748C
	b _08087500
	.align 2, 0
_080874BC: .4byte 0x00006088
_080874C0: .4byte gUnknown_02027F74
_080874C4: .4byte gUnknown_03005928
_080874C8: .4byte 0x0000608F
_080874CC:
	movs r4, #0
	cmp r4, r6
	bge _08087500
_080874D2:
	adds r0, r4, #0
	movs r1, #8
	bl DivRem
	adds r5, r4, #1
	cmp r0, #0
	beq _080874E4
	cmp r5, r6
	bne _080874FA
_080874E4:
	adds r2, r7, #0
	adds r2, #0x49
	adds r2, r4, r2
	ldr r0, _08087510 @ =0x0000608F
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	mov r4, sl
	ldr r3, [r4]
	bl sub_0801BEBC
_080874FA:
	adds r4, r5, #0
	cmp r4, r6
	blt _080874D2
_08087500:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087510: .4byte 0x0000608F

