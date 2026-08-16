	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08037260
sub_08037260: @ 0x08037260
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _0803739C @ =gUnknown_030030CC
	mov ip, r0
	ldrb r0, [r0]
	movs r4, #8
	rsbs r4, r4, #0
	ands r4, r0
	movs r0, #0x7f
	ands r4, r0
	movs r2, #2
	rsbs r2, r2, #0
	movs r5, #3
	rsbs r5, r5, #0
	movs r6, #5
	rsbs r6, r6, #0
	movs r1, #9
	rsbs r1, r1, #0
	mov r8, r1
	movs r7, #0x11
	rsbs r7, r7, #0
	mov sb, r7
	subs r0, #0xa0
	mov sl, r0
	movs r0, #0
	mov r1, ip
	strb r0, [r1, #1]
	ldr r0, _080373A0 @ =gUnknown_03002B40
	movs r1, #0
	strb r1, [r0]
	ldr r0, _080373A4 @ =gUnknown_03002EFC
	strb r1, [r0]
	ldr r0, _080373A8 @ =gUnknown_03002B4C
	strb r1, [r0]
	ldr r0, _080373AC @ =gUnknown_03002B44
	strb r1, [r0]
	ldr r0, _080373B0 @ =gUnknown_03002B68
	strb r1, [r0]
	ldr r0, _080373B4 @ =gUnknown_03002B30
	strb r1, [r0]
	ldr r0, _080373B8 @ =gUnknown_030024E4
	strb r1, [r0]
	ldr r0, _080373BC @ =gUnknown_030020B8
	strb r1, [r0]
	ldr r3, _080373C0 @ =gUnknown_030030A4
	ldrb r1, [r3]
	adds r0, r2, #0
	ands r0, r1
	ands r0, r5
	ands r0, r6
	mov r7, r8
	ands r0, r7
	mov r1, sb
	ands r0, r1
	strb r0, [r3]
	ldrb r1, [r3, #1]
	adds r0, r2, #0
	ands r0, r1
	ands r0, r5
	ands r0, r6
	ands r0, r7
	mov r7, sb
	ands r0, r7
	strb r0, [r3, #1]
	ldr r3, _080373C4 @ =gUnknown_030030DC
	ldrb r1, [r3, #1]
	adds r0, r2, #0
	ands r0, r1
	ands r0, r5
	ands r0, r6
	mov r1, r8
	ands r0, r1
	ands r0, r7
	strb r0, [r3, #1]
	ldrb r0, [r3]
	ands r2, r0
	ands r2, r5
	ands r2, r6
	ands r2, r1
	ands r2, r7
	strb r2, [r3]
	movs r0, #0x38
	ands r4, r0
	mov r7, ip
	strb r4, [r7]
	ldr r2, _080373C8 @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	mov r8, r0
	ands r0, r1
	strb r0, [r2]
	ldr r6, _080373CC @ =gUnknown_03002020
	movs r3, #0
	strh r3, [r6]
	ldr r5, _080373D0 @ =gUnknown_03002B28
	strh r3, [r5]
	ldr r4, _080373D4 @ =gUnknown_03001FFC
	strh r3, [r4]
	ldrh r1, [r2]
	ldr r0, _080373D8 @ =0x0000FFE0
	ands r0, r1
	ldr r1, _080373DC @ =0x0000E0FF
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r2]
	mov r0, sl
	ands r0, r1
	ldrb r1, [r2, #1]
	mov r7, sl
	ands r7, r1
	strb r7, [r2, #1]
	mov r1, r8
	ands r0, r1
	strb r0, [r2]
	movs r0, #0x10
	strh r0, [r6]
	strh r3, [r5]
	strh r3, [r4]
	ldr r3, _080373E0 @ =gUnknown_03002B6C
	ldrb r1, [r3]
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	ands r0, r2
	movs r1, #2
	orrs r0, r1
	movs r1, #3
	orrs r0, r1
	ands r0, r2
	strb r0, [r3]
	ldr r3, _080373E4 @ =gUnknown_03001FE8
	ldrb r1, [r3]
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r3]
	ldr r3, _080373E8 @ =gUnknown_030030B4
	ldrb r1, [r3]
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r3]
	ldr r1, _080373EC @ =gUnknown_0300251C
	ldrb r0, [r1]
	ands r2, r0
	strb r2, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803739C: .4byte gUnknown_030030CC
_080373A0: .4byte gUnknown_03002B40
_080373A4: .4byte gUnknown_03002EFC
_080373A8: .4byte gUnknown_03002B4C
_080373AC: .4byte gUnknown_03002B44
_080373B0: .4byte gUnknown_03002B68
_080373B4: .4byte gUnknown_03002B30
_080373B8: .4byte gUnknown_030024E4
_080373BC: .4byte gUnknown_030020B8
_080373C0: .4byte gUnknown_030030A4
_080373C4: .4byte gUnknown_030030DC
_080373C8: .4byte gUnknown_030030E0
_080373CC: .4byte gUnknown_03002020
_080373D0: .4byte gUnknown_03002B28
_080373D4: .4byte gUnknown_03001FFC
_080373D8: .4byte 0x0000FFE0
_080373DC: .4byte 0x0000E0FF
_080373E0: .4byte gUnknown_03002B6C
_080373E4: .4byte gUnknown_03001FE8
_080373E8: .4byte gUnknown_030030B4
_080373EC: .4byte gUnknown_0300251C

