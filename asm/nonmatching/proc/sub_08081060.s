	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08081060
sub_08081060: @ 0x08081060
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	bl sub_0807898C
	bl sub_08078AF0
	ldr r0, _080812B0 @ =gUnknown_030030CC
	mov sl, r0
	ldrb r2, [r0, #1]
	movs r4, #1
	orrs r2, r4
	movs r1, #2
	mov sb, r1
	mov r0, sb
	orrs r2, r0
	movs r5, #5
	rsbs r5, r5, #0
	ands r2, r5
	movs r1, #8
	mov r8, r1
	mov r0, r8
	orrs r2, r0
	movs r6, #0x10
	orrs r2, r6
	ldr r3, _080812B4 @ =gUnknown_030030A4
	ldrb r0, [r3, #1]
	orrs r0, r4
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	ands r0, r5
	subs r1, #6
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r3, #1]
	ldr r3, _080812B8 @ =gUnknown_030030DC
	ldrb r0, [r3]
	orrs r0, r4
	mov r1, sb
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	mov r1, r8
	orrs r0, r1
	orrs r0, r6
	strb r0, [r3]
	ldr r1, _080812BC @ =gUnknown_03002B68
	movs r0, #0
	strb r0, [r1]
	ldr r1, _080812C0 @ =gUnknown_03002B30
	movs r0, #0x90
	strb r0, [r1]
	ldr r1, _080812C4 @ =gUnknown_030024E4
	movs r0, #0xf0
	strb r0, [r1]
	ldr r1, _080812C8 @ =gUnknown_030020B8
	movs r0, #0xa0
	strb r0, [r1]
	movs r0, #0x20
	orrs r2, r0
	movs r0, #0x40
	orrs r2, r0
	movs r0, #0x7f
	ands r2, r0
	mov r0, sl
	strb r2, [r0, #1]
	ldr r2, _080812CC @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	strb r0, [r2]
	ldr r1, _080812D0 @ =gUnknown_03002020
	movs r0, #0x10
	strh r0, [r1]
	ldr r0, _080812D4 @ =gUnknown_03002B28
	movs r1, #0
	strh r1, [r0]
	ldr r0, _080812D8 @ =gUnknown_03001FFC
	strh r1, [r0]
	ldr r1, _080812DC @ =gUnknown_03001400
	ldr r2, _080812E0 @ =0x0000FFF8
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _080812E4 @ =gUnknown_0823A3D4
	ldr r1, _080812E8 @ =gUnknown_0300251C
	ldr r1, [r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	movs r4, #0xc0
	lsls r4, r4, #0x13
	adds r1, r1, r4
	bl sub_08011CAC
	ldr r0, _080812EC @ =gUnknown_08239FA4
	ldr r1, _080812F0 @ =gUnknown_08499584
	ldr r1, [r1]
	bl sub_08011CAC
	ldr r0, _080812F4 @ =gUnknown_0823BDE0
	movs r1, #0
	movs r2, #0x20
	bl sub_08013618
	bl sub_08013B1C
	ldr r0, _080812F8 @ =gUnknown_0823BF28
	ldr r1, _080812FC @ =gUnknown_030030B4
	ldr r1, [r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	adds r1, r1, r4
	bl sub_08011CAC
	ldr r0, _08081300 @ =gUnknown_0823BE40
	ldr r1, _08081304 @ =gUnknown_08499580
	ldr r1, [r1]
	bl sub_08011CAC
	ldr r0, _08081308 @ =gUnknown_0823BFD4
	movs r1, #0x20
	movs r2, #0x20
	bl sub_08013618
	bl sub_08013B0C
	bl sub_08013AEC
	bl sub_08013AFC
	ldr r1, _0808130C @ =gUnknown_03005920
	movs r0, #0
	str r0, [r1]
	ldr r6, _08081310 @ =gUnknown_081D9398
	ldr r5, [r6]
	ldr r4, _08081314 @ =gUnknown_081D939C
	ldr r0, [r4]
	ldr r0, [r0]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r5
	ldrb r0, [r0]
	bl sub_080845A8
	mov r8, r4
	movs r4, #1
_08081194:
	movs r0, #0
	movs r1, #0x88
	lsls r1, r1, #1
	bl sub_080845C4
	movs r0, #1
	movs r1, #0xa8
	lsls r1, r1, #1
	bl sub_080845C4
	movs r0, #2
	movs r1, #0xc0
	lsls r1, r1, #1
	bl sub_080845C4
	movs r0, #3
	movs r1, #0xc8
	lsls r1, r1, #1
	bl sub_080845C4
	movs r0, #4
	movs r1, #0xe0
	lsls r1, r1, #1
	bl sub_080845C4
	movs r0, #5
	movs r1, #0x94
	lsls r1, r1, #2
	bl sub_080845C4
	subs r4, #1
	cmp r4, #0
	bge _08081194
	movs r4, #1
_080811D8:
	movs r0, #0
	movs r1, #0xe8
	lsls r1, r1, #1
	bl sub_080845E8
	movs r0, #1
	movs r1, #0xeb
	lsls r1, r1, #1
	bl sub_080845E8
	movs r0, #2
	ldr r1, _08081318 @ =0x00000212
	bl sub_080845E8
	movs r0, #3
	movs r1, #0x83
	lsls r1, r1, #2
	bl sub_080845E8
	subs r4, #1
	cmp r4, #0
	bge _080811D8
	movs r0, #0x20
	bl sub_0803CBD8
	cmp r0, #0
	beq _0808121A
	ldr r0, _0808131C @ =gUnknown_0823DC38
	movs r1, #0xe8
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_08013618
_0808121A:
	bl sub_08084804
	movs r4, #0
	movs r5, #0x90
	lsls r5, r5, #0x12
_08081224:
	adds r0, r4, #0
	bl sub_08084864
	lsrs r1, r5, #0x10
	movs r2, #0x20
	bl sub_08013618
	movs r0, #0x80
	lsls r0, r0, #0xe
	adds r5, r5, r0
	adds r4, #1
	cmp r4, #5
	ble _08081224
	ldr r0, _08081320 @ =gUnknown_0823DDB8
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x60
	bl sub_08013618
	movs r0, #0
	movs r1, #0
	movs r2, #1
	bl sub_08043BA4
	movs r0, #0
	bl sub_0801B780
	ldr r0, _08081324 @ =gUnknown_081320AC
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x20
	bl sub_08013618
	ldr r0, _08081328 @ =gUnknown_08616A58
	adds r1, r7, #0
	bl Proc_Start
	ldr r0, _0808132C @ =gUnknown_030058FC
	ldr r0, [r0]
	cmp r0, #0
	beq _080812A0
	ldr r4, [r6]
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r4
	ldrb r0, [r0]
	bl sub_08084864
	movs r1, #0xc0
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_08013618
	ldr r0, _08081330 @ =gUnknown_08616A40
	adds r1, r7, #0
	bl Proc_Start
_080812A0:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080812B0: .4byte gUnknown_030030CC
_080812B4: .4byte gUnknown_030030A4
_080812B8: .4byte gUnknown_030030DC
_080812BC: .4byte gUnknown_03002B68
_080812C0: .4byte gUnknown_03002B30
_080812C4: .4byte gUnknown_030024E4
_080812C8: .4byte gUnknown_030020B8
_080812CC: .4byte gUnknown_030030E0
_080812D0: .4byte gUnknown_03002020
_080812D4: .4byte gUnknown_03002B28
_080812D8: .4byte gUnknown_03001FFC
_080812DC: .4byte gUnknown_03001400
_080812E0: .4byte 0x0000FFF8
_080812E4: .4byte gUnknown_0823A3D4
_080812E8: .4byte gUnknown_0300251C
_080812EC: .4byte gUnknown_08239FA4
_080812F0: .4byte gUnknown_08499584
_080812F4: .4byte gUnknown_0823BDE0
_080812F8: .4byte gUnknown_0823BF28
_080812FC: .4byte gUnknown_030030B4
_08081300: .4byte gUnknown_0823BE40
_08081304: .4byte gUnknown_08499580
_08081308: .4byte gUnknown_0823BFD4
_0808130C: .4byte gUnknown_03005920
_08081310: .4byte gUnknown_081D9398
_08081314: .4byte gUnknown_081D939C
_08081318: .4byte 0x00000212
_0808131C: .4byte gUnknown_0823DC38
_08081320: .4byte gUnknown_0823DDB8
_08081324: .4byte gUnknown_081320AC
_08081328: .4byte gUnknown_08616A58
_0808132C: .4byte gUnknown_030058FC
_08081330: .4byte gUnknown_08616A40

