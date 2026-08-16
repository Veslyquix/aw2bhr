	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08088ECC
sub_08088ECC: @ 0x08088ECC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x4e
	adds r0, r0, r7
	mov r8, r0
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov sb, r1
	cmp r1, #0
	bne _08088EEC
	b _08089172
_08088EEC:
	ldr r1, [r7, #0x38]
	lsls r2, r1, #1
	adds r2, r2, r1
	movs r0, #0x88
	subs r0, r0, r2
	ldr r4, _08088F6C @ =0x000001FF
	ands r0, r4
	adds r1, #0x3c
	movs r5, #0xff
	ands r1, r5
	movs r6, #0x80
	lsls r6, r6, #3
	orrs r1, r6
	ldr r2, _08088F70 @ =0x00007A34
	movs r3, #4
	bl sub_08043FD8
	ldr r1, [r7, #0x38]
	lsls r2, r1, #1
	adds r2, r2, r1
	movs r0, #0xd0
	subs r0, r0, r2
	ands r0, r4
	adds r1, #0x24
	ands r1, r5
	orrs r1, r6
	ldr r2, _08088F74 @ =0x00008A58
	movs r3, #4
	bl sub_08043FD8
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	ble _08088F80
	ldr r1, [r7, #0x2c]
	lsls r2, r1, #1
	adds r2, r2, r1
	movs r0, #0x40
	subs r0, r0, r2
	ands r0, r4
	adds r1, #0x54
	ands r1, r5
	orrs r1, r6
	ldr r2, _08088F78 @ =0x00006A10
	movs r3, #4
	bl sub_08043FD8
	ldr r1, [r7, #0x38]
	lsls r2, r1, #1
	adds r2, r2, r1
	movs r0, #0x8c
	lsls r0, r0, #1
	subs r0, r0, r2
	ands r0, r4
	adds r1, #0xc
	ands r1, r5
	orrs r1, r6
	ldr r2, _08088F7C @ =0x000059EC
	movs r3, #4
	bl sub_08043FD8
	b _08088FBC
	.align 2, 0
_08088F6C: .4byte 0x000001FF
_08088F70: .4byte 0x00007A34
_08088F74: .4byte 0x00008A58
_08088F78: .4byte 0x00006A10
_08088F7C: .4byte 0x000059EC
_08088F80:
	cmp r0, #0
	bge _08088FBC
	ldr r1, [r7, #0x38]
	lsls r2, r1, #1
	adds r2, r2, r1
	movs r0, #0x40
	subs r0, r0, r2
	ands r0, r4
	adds r1, #0x54
	ands r1, r5
	orrs r1, r6
	ldr r2, _080890B0 @ =0x00006A10
	movs r3, #4
	bl sub_08043FD8
	ldr r1, [r7, #0x2c]
	adds r0, r1, #5
	lsls r2, r0, #1
	adds r2, r2, r0
	movs r0, #8
	rsbs r0, r0, #0
	subs r0, r0, r2
	ands r0, r4
	adds r1, #0x71
	ands r1, r5
	orrs r1, r6
	ldr r2, _080890B4 @ =0x000059EC
	movs r3, #4
	bl sub_08043FD8
_08088FBC:
	ldr r5, _080890B8 @ =gUnknown_03002F18
	ldr r0, [r7, #0x3c]
	movs r1, #4
	bl DivRem
	movs r1, #0x24
	subs r1, r1, r0
	strh r1, [r5]
	ldr r4, _080890BC @ =gUnknown_03002B34
	ldr r0, [r7, #0x3c]
	movs r1, #4
	bl DivRem
	lsls r1, r0, #1
	adds r1, r1, r0
	strh r1, [r4]
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08088FF0
	ldrh r0, [r5]
	subs r0, #4
	strh r0, [r5]
	ldrh r0, [r4]
	adds r0, #0xc
	strh r0, [r4]
_08088FF0:
	adds r0, r7, #0
	adds r0, #0x4e
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _080890C0
	adds r6, r7, #0
	adds r6, #0x48
	ldrh r0, [r6]
	movs r1, #0x20
	bl DivRem
	adds r3, r0, #0
	movs r5, #0x20
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #8
	bl sub_08074234
	adds r1, r0, #0
	movs r2, #0x4c
	adds r2, r2, r7
	mov sb, r2
	movs r0, #0
	ldrsh r3, [r2, r0]
	movs r2, #0x10
	mov r8, r2
	str r2, [sp]
	movs r0, #4
	bl sub_08074234
	movs r4, #0x18
	subs r4, r4, r0
	movs r1, #0
	ldrsh r0, [r6, r1]
	movs r1, #0x20
	bl DivRem
	adds r3, r0, #0
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #4
	bl sub_08074234
	adds r1, r0, #0
	mov r2, sb
	movs r0, #0
	ldrsh r3, [r2, r0]
	mov r2, r8
	str r2, [sp]
	movs r0, #4
	movs r2, #8
	bl sub_08074234
	adds r2, r0, #0
	adds r2, #0x3c
	movs r0, #0
	mov r8, r0
	str r0, [sp]
	movs r0, #0x48
	adds r1, r4, #0
	movs r3, #0
	bl sub_0801F34C
	ldrh r0, [r6]
	movs r1, #0x20
	bl DivRem
	adds r3, r0, #0
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #8
	bl sub_08074234
	adds r4, r0, #0
	adds r4, #0x58
	movs r1, #0
	ldrsh r0, [r6, r1]
	movs r1, #0x20
	bl DivRem
	adds r3, r0, #0
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #4
	bl sub_08074234
	movs r2, #0x2c
	subs r2, r2, r0
	mov r0, r8
	b _080892C2
	.align 2, 0
_080890B0: .4byte 0x00006A10
_080890B4: .4byte 0x000059EC
_080890B8: .4byte gUnknown_03002F18
_080890BC: .4byte gUnknown_03002B34
_080890C0:
	adds r6, r7, #0
	adds r6, #0x48
	ldrh r0, [r6]
	movs r1, #0x20
	bl DivRem
	adds r3, r0, #0
	movs r5, #0x20
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #8
	bl sub_08074234
	movs r4, #0x18
	subs r4, r4, r0
	movs r1, #0
	ldrsh r0, [r6, r1]
	movs r1, #0x20
	bl DivRem
	adds r3, r0, #0
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #4
	bl sub_08074234
	adds r2, r0, #0
	adds r2, #0x3c
	movs r0, #0
	mov sl, r0
	str r0, [sp]
	movs r0, #0x48
	adds r1, r4, #0
	movs r3, #0
	bl sub_0801F34C
	ldrh r0, [r6]
	movs r1, #0x20
	bl DivRem
	adds r3, r0, #0
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #8
	bl sub_08074234
	adds r1, r0, #0
	movs r2, #0x4c
	adds r2, r2, r7
	mov sb, r2
	movs r0, #0
	ldrsh r3, [r2, r0]
	movs r2, #0x10
	mov r8, r2
	str r2, [sp]
	movs r0, #4
	bl sub_08074234
	adds r4, r0, #0
	adds r4, #0x58
	movs r1, #0
	ldrsh r0, [r6, r1]
	movs r1, #0x20
	bl DivRem
	adds r3, r0, #0
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #4
	bl sub_08074234
	adds r1, r0, #0
	mov r2, sb
	movs r0, #0
	ldrsh r3, [r2, r0]
	mov r2, r8
	str r2, [sp]
	movs r0, #4
	movs r2, #8
	bl sub_08074234
	movs r2, #0x2c
	subs r2, r2, r0
	mov r0, sl
	b _080892C2
_08089172:
	ldr r1, [r7, #0x60]
	mov r8, r1
	cmp r1, #0
	bne _0808917C
	b _080892D0
_0808917C:
	ldr r0, [r7, #0x30]
	movs r1, #0x54
	subs r1, r1, r0
	movs r5, #0xff
	ands r1, r5
	movs r4, #0x80
	lsls r4, r4, #3
	orrs r1, r4
	movs r2, #0xa6
	lsls r2, r2, #6
	movs r0, #0x40
	movs r3, #4
	bl sub_08043FD8
	ldr r0, [r7, #0x30]
	movs r1, #0x3c
	subs r1, r1, r0
	ands r1, r5
	orrs r1, r4
	ldr r2, _08089230 @ =0x000039A4
	movs r0, #0x88
	movs r3, #4
	bl sub_08043FD8
	ldr r0, [r7, #0x30]
	movs r1, #0x24
	subs r1, r1, r0
	ands r1, r5
	orrs r1, r4
	ldr r2, _08089234 @ =0x000049C8
	movs r0, #0xd0
	movs r3, #4
	bl sub_08043FD8
	ldr r5, _08089238 @ =gUnknown_03002F18
	ldr r0, [r7, #0x3c]
	movs r1, #4
	bl Div
	movs r1, #4
	bl DivRem
	ldr r1, [r7, #0x30]
	adds r1, #0x24
	subs r1, r1, r0
	strh r1, [r5]
	ldr r4, _0808923C @ =gUnknown_03002B34
	ldr r0, [r7, #0x3c]
	movs r1, #4
	bl Div
	movs r1, #4
	bl DivRem
	lsls r1, r0, #1
	adds r1, r1, r0
	strh r1, [r4]
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08089202
	ldrh r0, [r5]
	subs r0, #4
	strh r0, [r5]
	ldrh r0, [r4]
	adds r0, #0xc
	strh r0, [r4]
_08089202:
	ldr r0, [r7, #0x60]
	cmp r0, #0
	bge _08089240
	adds r6, r7, #0
	adds r6, #0x48
	ldrh r0, [r6]
	movs r1, #0x20
	bl DivRem
	adds r3, r0, #0
	movs r5, #0x20
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #8
	bl sub_08074234
	movs r4, #0x18
	subs r4, r4, r0
	movs r2, #0
	ldrsh r0, [r6, r2]
	b _08089264
	.align 2, 0
_08089230: .4byte 0x000039A4
_08089234: .4byte 0x000049C8
_08089238: .4byte gUnknown_03002F18
_0808923C: .4byte gUnknown_03002B34
_08089240:
	adds r6, r7, #0
	adds r6, #0x48
	ldrh r0, [r6]
	movs r1, #0x20
	bl DivRem
	adds r3, r0, #0
	movs r5, #0x20
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #8
	bl sub_08074234
	movs r4, #0x18
	subs r4, r4, r0
	movs r1, #0
	ldrsh r0, [r6, r1]
_08089264:
	movs r1, #0x20
	bl DivRem
	adds r3, r0, #0
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #4
	bl sub_08074234
	adds r2, r0, #0
	adds r2, #0x3c
	mov r0, sb
	str r0, [sp]
	movs r0, #0x48
	adds r1, r4, #0
	movs r3, #0
	bl sub_0801F34C
	ldrh r0, [r6]
	movs r1, #0x20
	bl DivRem
	adds r3, r0, #0
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #8
	bl sub_08074234
	adds r4, r0, #0
	adds r4, #0x58
	movs r1, #0
	ldrsh r0, [r6, r1]
	movs r1, #0x20
	bl DivRem
	adds r3, r0, #0
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #4
	bl sub_08074234
	movs r2, #0x2c
	subs r2, r2, r0
	mov r0, sb
_080892C2:
	str r0, [sp]
	movs r0, #0x49
	adds r1, r4, #0
	movs r3, #0
	bl sub_0801F34C
	b _080893C0
_080892D0:
	movs r2, #0xa6
	lsls r2, r2, #6
	movs r0, #0x40
	movs r1, #0x54
	movs r3, #4
	bl sub_08043FD8
	ldr r1, _0808943C @ =0x0000043C
	ldr r2, _08089440 @ =0x000039A4
	movs r0, #0x88
	movs r3, #4
	bl sub_08043FD8
	ldr r1, _08089444 @ =0x00000424
	ldr r2, _08089448 @ =0x000049C8
	movs r0, #0xd0
	movs r3, #4
	bl sub_08043FD8
	ldr r5, _0808944C @ =gUnknown_03002F18
	ldr r0, [r7, #0x3c]
	movs r1, #3
	bl Div
	movs r1, #4
	bl DivRem
	movs r1, #0x24
	subs r1, r1, r0
	strh r1, [r5]
	ldr r4, _08089450 @ =gUnknown_03002B34
	ldr r0, [r7, #0x3c]
	movs r1, #3
	bl Div
	movs r1, #4
	bl DivRem
	lsls r1, r0, #1
	adds r1, r1, r0
	strh r1, [r4]
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08089336
	ldrh r0, [r5]
	subs r0, #4
	strh r0, [r5]
	ldrh r0, [r4]
	adds r0, #0xc
	strh r0, [r4]
_08089336:
	adds r6, r7, #0
	adds r6, #0x48
	ldrh r0, [r6]
	movs r1, #0x20
	bl DivRem
	adds r3, r0, #0
	movs r5, #0x20
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #8
	bl sub_08074234
	movs r4, #0x18
	subs r4, r4, r0
	ldrh r0, [r6]
	movs r1, #0x20
	bl DivRem
	adds r3, r0, #0
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #4
	bl sub_08074234
	adds r2, r0, #0
	adds r2, #0x3c
	mov r1, r8
	str r1, [sp]
	movs r0, #0x48
	adds r1, r4, #0
	movs r3, #0
	bl sub_0801F34C
	ldrh r0, [r6]
	movs r1, #0x20
	bl DivRem
	adds r3, r0, #0
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #8
	bl sub_08074234
	adds r4, r0, #0
	adds r4, #0x58
	ldrh r0, [r6]
	movs r1, #0x20
	bl DivRem
	adds r3, r0, #0
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #4
	bl sub_08074234
	movs r2, #0x2c
	subs r2, r2, r0
	mov r0, r8
	str r0, [sp]
	movs r0, #0x49
	adds r1, r4, #0
	movs r3, #0
	bl sub_0801F34C
_080893C0:
	ldr r0, _08089454 @ =gUnknown_03005944
	ldr r0, [r0]
	cmp r0, #1
	ble _080893E6
	movs r4, #0
	str r4, [sp]
	movs r0, #0x43
	movs r1, #0x38
	movs r2, #0x1c
	movs r3, #0
	bl sub_0801F34C
	str r4, [sp]
	movs r0, #0x44
	movs r1, #0x38
	movs r2, #0x54
	movs r3, #0
	bl sub_0801F34C
_080893E6:
	ldr r0, [r7, #0x34]
	adds r0, #0xb0
	movs r2, #0x82
	lsls r2, r2, #5
	movs r1, #1
	str r1, [sp]
	movs r1, #0xa0
	movs r3, #2
	bl sub_08043C28
	ldr r3, _08089458 @ =gUnknown_0848B6A0
	movs r4, #0
	str r4, [sp]
	movs r0, #1
	movs r1, #0x20
	movs r2, #0x1c
	bl sub_0801BEBC
	ldr r1, _0808945C @ =gUnknown_03005958
	ldr r0, [r7, #0x58]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r0, #0x3e
	str r4, [sp]
	movs r1, #0x20
	movs r2, #0x78
	movs r3, #0
	bl sub_0801F34C
	ldr r2, _08089460 @ =0x0000A2CC
	movs r0, #0x30
	movs r1, #0x78
	movs r3, #3
	bl sub_08043B60
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808943C: .4byte 0x0000043C
_08089440: .4byte 0x000039A4
_08089444: .4byte 0x00000424
_08089448: .4byte 0x000049C8
_0808944C: .4byte gUnknown_03002F18
_08089450: .4byte gUnknown_03002B34
_08089454: .4byte gUnknown_03005944
_08089458: .4byte gUnknown_0848B6A0
_0808945C: .4byte gUnknown_03005958
_08089460: .4byte 0x0000A2CC

