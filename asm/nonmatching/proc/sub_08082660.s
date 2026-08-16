	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08082660
sub_08082660: @ 0x08082660
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r4, r7, #0
	adds r4, #0x4c
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #3
	bgt _0808276C
	adds r1, r0, #0
	adds r0, r7, #0
	bl sub_08083484
	movs r5, #0
	adds r6, r4, #0
	adds r3, r7, #0
	adds r3, #0x52
	str r3, [sp, #4]
	movs r4, #0x4e
	adds r4, r4, r7
	mov sl, r4
	mov sb, r3
	mov r8, sl
_08082696:
	cmp r5, #2
	bne _080826EC
	ldr r5, [sp, #4]
	ldrh r0, [r5]
	adds r0, #2
	mov r2, sl
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	movs r1, #6
	bl DivRem
	ldr r4, _080826D8 @ =gUnknown_0861696C
	adds r0, r0, r4
	ldrb r3, [r0]
	adds r3, #2
	lsls r3, r3, #0xc
	ldr r0, _080826DC @ =0x00000998
	orrs r3, r0
	ldr r5, _080826E0 @ =gUnknown_08616972
	movs r0, #6
	ldrsh r1, [r5, r0]
	ldr r0, _080826E4 @ =gUnknown_08616980
	movs r4, #6
	ldrsh r2, [r0, r4]
	subs r2, #8
	str r3, [sp]
	movs r0, #2
	ldr r3, _080826E8 @ =gUnknown_08615C76
	bl PutSprite
	movs r4, #3
	b _08082752
	.align 2, 0
_080826D8: .4byte gUnknown_0861696C
_080826DC: .4byte 0x00000998
_080826E0: .4byte gUnknown_08616972
_080826E4: .4byte gUnknown_08616980
_080826E8: .4byte gUnknown_08615C76
_080826EC:
	mov r1, sb
	ldrh r0, [r1]
	adds r0, r0, r5
	mov r2, r8
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	movs r1, #6
	bl DivRem
	adds r4, r0, #0
	mov r1, sb
	ldrh r0, [r1]
	adds r0, r0, r5
	mov r2, r8
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	movs r1, #6
	bl DivRem
	ldr r1, _0808275C @ =gUnknown_0861696C
	adds r4, r4, r1
	ldrb r3, [r4]
	adds r3, #2
	lsls r3, r3, #0xc
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #5
	movs r2, #0xec
	lsls r2, r2, #1
	adds r0, r0, r2
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	orrs r3, r0
	adds r4, r5, #1
	lsls r2, r4, #1
	ldr r5, _08082760 @ =gUnknown_08616972
	adds r0, r2, r5
	movs r5, #0
	ldrsh r1, [r0, r5]
	ldr r0, _08082764 @ =gUnknown_08616980
	adds r2, r2, r0
	movs r0, #0
	ldrsh r2, [r2, r0]
	str r3, [sp]
	movs r0, #2
	ldr r3, _08082768 @ =gUnknown_08615C84
	bl PutSprite
_08082752:
	adds r5, r4, #0
	cmp r5, #5
	ble _08082696
	b _0808291E
	.align 2, 0
_0808275C: .4byte gUnknown_0861696C
_08082760: .4byte gUnknown_08616972
_08082764: .4byte gUnknown_08616980
_08082768: .4byte gUnknown_08615C84
_0808276C:
	cmp r0, #0xd
	bgt _080827D2
	movs r2, #0
	ldrsh r1, [r4, r2]
	subs r1, #4
	adds r0, r7, #0
	bl sub_08082C0C
	ldr r2, _080827A4 @ =gUnknown_081D93B8
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080827A8
	movs r3, #0
	ldrsh r0, [r4, r3]
	cmp r0, #7
	ble _080827A8
	cmp r0, #0xd
	bgt _080827A8
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x5c]
	adds r6, r4, #0
	b _0808291E
	.align 2, 0
_080827A4: .4byte gUnknown_081D93B8
_080827A8:
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x80
	ands r0, r1
	adds r6, r7, #0
	adds r6, #0x4c
	cmp r0, #0
	bne _080827BC
	b _0808291E
_080827BC:
	movs r4, #0
	ldrsh r0, [r6, r4]
	cmp r0, #7
	bgt _080827C6
	b _0808291E
_080827C6:
	cmp r0, #0xd
	ble _080827CC
	b _0808291E
_080827CC:
	movs r0, #1
	str r0, [r7, #0x5c]
	b _0808291E
_080827D2:
	cmp r0, #0x17
	bgt _080828C0
	ldr r1, [r7, #0x5c]
	cmp r1, #0
	bne _080827F6
	cmp r0, #0xe
	bne _080827F6
	movs r5, #0
	ldrsh r1, [r4, r5]
	subs r1, #0xe
	adds r0, r7, #0
	bl sub_080829B0
	ldrh r0, [r4]
	adds r0, #9
	strh r0, [r4]
	adds r6, r4, #0
	b _0808291E
_080827F6:
	adds r6, r7, #0
	adds r6, #0x4c
	cmp r1, #0
	bge _08082818
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0xe
	bne _08082818
	adds r1, r7, #0
	adds r1, #0x52
	ldrh r0, [r1]
	cmp r0, #5
	bne _08082814
	movs r0, #0
	b _08082836
_08082814:
	adds r0, #1
	b _08082836
_08082818:
	ldr r0, [r7, #0x5c]
	cmp r0, #0
	ble _08082840
	movs r2, #0
	ldrsh r0, [r6, r2]
	cmp r0, #0xe
	bne _08082840
	adds r1, r7, #0
	adds r1, #0x52
	ldrh r0, [r1]
	cmp r0, #0
	bne _08082834
	movs r0, #5
	b _08082836
_08082834:
	subs r0, #1
_08082836:
	strh r0, [r1]
	ldr r0, [r7, #0x5c]
	adds r1, r7, #0
	adds r1, #0x4e
	strh r0, [r1]
_08082840:
	movs r3, #0
	ldrsh r1, [r6, r3]
	subs r1, #0xe
	adds r0, r7, #0
	bl sub_08083034
	movs r4, #0
	ldrsh r0, [r6, r4]
	cmp r0, #0xe
	bne _08082862
	movs r4, #0
	str r4, [r7, #0x5c]
	movs r0, #0x67
	bl sub_0803B4DC
	ldr r0, _08082884 @ =gUnknown_03005920
	str r4, [r0]
_08082862:
	ldr r2, _08082888 @ =gUnknown_081D93B8
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0808288C
	movs r5, #0
	ldrsh r0, [r6, r5]
	cmp r0, #0xd
	ble _0808288C
	cmp r0, #0x17
	bgt _0808288C
	movs r0, #1
	rsbs r0, r0, #0
	b _080828A8
	.align 2, 0
_08082884: .4byte gUnknown_03005920
_08082888: .4byte gUnknown_081D93B8
_0808288C:
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080828AA
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0xd
	ble _080828AA
	cmp r0, #0x17
	bgt _080828AA
	movs r0, #1
_080828A8:
	str r0, [r7, #0x5c]
_080828AA:
	ldr r0, [r7, #0x5c]
	cmp r0, #0
	beq _0808291E
	ldrh r1, [r6]
	movs r2, #0
	ldrsh r0, [r6, r2]
	cmp r0, #0x17
	bne _0808291E
	adds r0, r1, #0
	subs r0, #0xa
	b _0808291C
_080828C0:
	adds r6, r4, #0
	cmp r0, #0x21
	bgt _0808291E
	movs r3, #0
	ldrsh r1, [r6, r3]
	subs r1, #0x18
	adds r0, r7, #0
	bl sub_080829B0
	ldr r2, _080828F4 @ =gUnknown_081D93B8
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080828F8
	movs r4, #0
	ldrsh r0, [r6, r4]
	cmp r0, #0x17
	ble _080828F8
	cmp r0, #0x1b
	bgt _080828F8
	movs r0, #1
	rsbs r0, r0, #0
	b _08082918
	.align 2, 0
_080828F4: .4byte gUnknown_081D93B8
_080828F8:
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x80
	ands r0, r1
	adds r6, r7, #0
	adds r6, #0x4c
	cmp r0, #0
	beq _0808291E
	movs r5, #0
	ldrsh r0, [r6, r5]
	cmp r0, #0x17
	ble _0808291E
	cmp r0, #0x1b
	bgt _0808291E
	movs r0, #1
_08082918:
	str r0, [r7, #0x5c]
	movs r0, #0xd
_0808291C:
	strh r0, [r6]
_0808291E:
	ldrh r2, [r6]
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #3
	bgt _08082934
	ldr r1, _08082930 @ =gUnknown_03002020
	movs r0, #3
	subs r0, r0, r2
	b _08082948
	.align 2, 0
_08082930: .4byte gUnknown_03002020
_08082934:
	cmp r0, #0x1d
	ble _08082944
	ldr r1, _08082940 @ =gUnknown_03002020
	adds r0, r2, #0
	subs r0, #0x1d
	b _08082948
	.align 2, 0
_08082940: .4byte gUnknown_03002020
_08082944:
	ldr r1, _080829A8 @ =gUnknown_03002020
	movs r0, #0
_08082948:
	strh r0, [r1]
	movs r2, #0
	ldrsh r0, [r6, r2]
	cmp r0, #0x17
	bne _08082986
	ldr r4, _080829AC @ =gUnknown_0861696C
	adds r5, r7, #0
	adds r5, #0x52
	ldrh r0, [r5]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r4
	ldrb r0, [r0]
	bl sub_080845A8
	ldrh r0, [r5]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r4
	ldrb r0, [r0]
	bl sub_08084864
	movs r1, #0xc0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
_08082986:
	movs r3, #0
	ldrsh r0, [r6, r3]
	cmp r0, #0x21
	bne _08082996
	adds r1, r7, #0
	adds r1, #0x4e
	movs r0, #0
	strh r0, [r1]
_08082996:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080829A8: .4byte gUnknown_03002020
_080829AC: .4byte gUnknown_0861696C

