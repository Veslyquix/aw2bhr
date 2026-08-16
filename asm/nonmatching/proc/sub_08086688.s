	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08086688
sub_08086688: @ 0x08086688
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	bl sub_080867BC
	bl sub_08087040
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r4, #0
	adds r1, #0x66
	movs r2, #0
	ldrsh r1, [r1, r2]
	adds r2, r4, #0
	adds r2, #0x68
	movs r3, #0
	ldrsh r2, [r2, r3]
	adds r3, r4, #0
	adds r3, #0x6a
	movs r5, #0
	ldrsh r3, [r3, r5]
	bl sub_080870B8
	ldr r0, [r4, #0x5c]
	bl sub_08087168
	ldr r0, [r4, #0x5c]
	bl sub_080872D0
	ldr r0, _080866DC @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _080866E4
	ldr r0, _080866E0 @ =gUnknown_03005930
	ldrh r0, [r0]
	movs r1, #0x28
	bl sub_08087220
	b _080866EE
	.align 2, 0
_080866DC: .4byte gUnknown_03003FC0
_080866E0: .4byte gUnknown_03005930
_080866E4:
	ldr r0, _080867B0 @ =gUnknown_03005980
	ldrh r0, [r0]
	movs r1, #0x48
	bl sub_08087220
_080866EE:
	adds r0, r4, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x1d
	bgt _080867A6
	adds r7, r4, #0
	adds r7, #0x48
	movs r2, #0
	ldrsh r0, [r7, r2]
	movs r1, #4
	bl Div
	movs r1, #0x10
	bl DivRem
	lsls r0, r0, #1
	ldr r1, _080867B4 @ =gUnknown_08239F84
	adds r0, r0, r1
	movs r1, #0xa6
	lsls r1, r1, #2
	movs r2, #2
	bl ApplyPaletteExt
	movs r3, #0
	ldrsh r0, [r7, r3]
	movs r1, #4
	bl Div
	movs r1, #0x10
	bl DivRem
	adds r5, r0, #0
	lsls r5, r5, #1
	ldr r0, _080867B8 @ =gUnknown_0823E550
	mov r8, r0
	add r5, r8
	movs r6, #0xa8
	lsls r6, r6, #2
	movs r1, #0
	ldrsh r0, [r7, r1]
	movs r1, #4
	bl Div
	movs r1, #0x10
	bl DivRem
	adds r2, r0, #0
	movs r4, #0x10
	subs r2, r4, r2
	lsls r2, r2, #0x11
	lsrs r2, r2, #0x10
	adds r0, r5, #0
	adds r1, r6, #0
	bl ApplyPaletteExt
	movs r2, #0
	ldrsh r0, [r7, r2]
	movs r1, #4
	bl Div
	movs r1, #0x10
	bl DivRem
	subs r4, r4, r0
	lsls r4, r4, #1
	adds r4, r4, r6
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r3, #0
	ldrsh r0, [r7, r3]
	movs r1, #4
	bl Div
	movs r1, #0x10
	bl DivRem
	adds r2, r0, #0
	lsls r2, r2, #0x11
	lsrs r2, r2, #0x10
	mov r0, r8
	adds r1, r4, #0
	bl ApplyPaletteExt
	ldrh r0, [r7]
	subs r0, #1
	strh r0, [r7]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080867A6
	movs r0, #0x40
	strh r0, [r7]
_080867A6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080867B0: .4byte gUnknown_03005980
_080867B4: .4byte gUnknown_08239F84
_080867B8: .4byte gUnknown_0823E550

