	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080897C8
sub_080897C8: @ 0x080897C8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	adds r3, r7, #0
	adds r3, #0x4c
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r0, #0xf
	ble _080897E0
	b _080898E8
_080897E0:
	ldr r2, _080898D0 @ =gUnknown_03001FE8
	ldrb r1, [r2, #1]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #1]
	movs r2, #0
	ldrsh r3, [r3, r2]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #1
	movs r1, #0x24
	movs r2, #0xc2
	bl Interpolate
	str r0, [r7, #0x30]
	ldr r5, _080898D4 @ =gUnknown_03002F18
	ldr r0, [r7, #0x3c]
	movs r1, #3
	bl Div
	movs r1, #4
	bl DivRem
	ldr r1, [r7, #0x30]
	subs r1, r1, r0
	strh r1, [r5]
	ldr r4, _080898D8 @ =gUnknown_03002B34
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
	bge _08089842
	ldrh r0, [r5]
	subs r0, #4
	strh r0, [r5]
	ldrh r0, [r4]
	adds r0, #0xc
	strh r0, [r4]
_08089842:
	ldr r2, [r7, #0x30]
	movs r0, #0x78
	subs r0, r0, r2
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08089862
	movs r1, #0x78
	subs r1, r1, r2
	movs r0, #0xff
	ands r1, r0
	movs r2, #0xa6
	lsls r2, r2, #6
	movs r0, #0x40
	movs r3, #4
	bl sub_08043FD8
_08089862:
	ldr r2, [r7, #0x30]
	movs r0, #0x60
	subs r0, r0, r2
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08089886
	movs r1, #0x60
	subs r1, r1, r2
	movs r0, #0xff
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r1, r0
	ldr r2, _080898DC @ =0x000039A4
	movs r0, #0x88
	movs r3, #4
	bl sub_08043FD8
_08089886:
	ldr r2, [r7, #0x30]
	movs r0, #0x48
	subs r0, r0, r2
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _080898AA
	movs r1, #0x48
	subs r1, r1, r2
	movs r0, #0xff
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r1, r0
	ldr r2, _080898E0 @ =0x000049C8
	movs r0, #0xd0
	movs r3, #4
	bl sub_08043FD8
_080898AA:
	ldr r1, [r7, #0x30]
	movs r0, #0x80
	subs r0, r0, r1
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _080898B8
	b _080899EA
_080898B8:
	movs r2, #0x40
	subs r2, r2, r1
	ldr r3, _080898E4 @ =gUnknown_0848B6A0
	movs r0, #0x80
	lsls r0, r0, #4
	str r0, [sp]
	movs r0, #1
	movs r1, #0x20
	bl PutSprite
	b _080899EA
	.align 2, 0
_080898D0: .4byte gUnknown_03001FE8
_080898D4: .4byte gUnknown_03002F18
_080898D8: .4byte gUnknown_03002B34
_080898DC: .4byte 0x000039A4
_080898E0: .4byte 0x000049C8
_080898E4: .4byte gUnknown_0848B6A0
_080898E8:
	cmp r0, #0x1f
	bgt _080899C8
	movs r1, #0x9e
	rsbs r1, r1, #0
	movs r0, #0
	ldrsh r3, [r3, r0]
	subs r3, #0x10
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	movs r2, #0
	bl Interpolate
	str r0, [r7, #0x30]
	ldr r1, _08089988 @ =gUnknown_03002F18
	movs r2, #0xb0
	lsls r2, r2, #1
	adds r0, r0, r2
	strh r0, [r1]
	ldr r1, _0808998C @ =gUnknown_03002B34
	movs r0, #0
	strh r0, [r1]
	movs r4, #0
	movs r6, #0
	movs r5, #8
_0808991A:
	adds r0, r4, #0
	adds r0, #0x83
	ldr r2, [r7, #0x30]
	subs r2, #0x28
	subs r2, r6, r2
	movs r1, #0xff
	ands r2, r1
	movs r1, #4
	str r1, [sp]
	adds r1, r5, #0
	movs r3, #0x80
	lsls r3, r3, #4
	bl sub_0801F34C
	adds r6, #6
	adds r5, #0x18
	adds r4, #1
	cmp r4, #3
	ble _0808991A
	movs r4, #0
	movs r6, #0
	movs r5, #0x10
_08089946:
	adds r0, r4, #0
	adds r0, #0x87
	ldr r2, [r7, #0x30]
	subs r2, #0x4a
	subs r2, r6, r2
	movs r1, #0xff
	mov r8, r1
	ands r2, r1
	movs r1, #4
	str r1, [sp]
	adds r1, r5, #0
	movs r3, #0x80
	lsls r3, r3, #4
	bl sub_0801F34C
	adds r6, #6
	adds r5, #0x18
	adds r4, #1
	cmp r4, #3
	ble _08089946
	ldr r1, _08089990 @ =gUnknown_03005964
	ldrb r0, [r1]
	cmp r0, #3
	bhi _08089998
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r1, r2, #3
	ldr r0, _08089994 @ =0x000001FF
	ands r1, r0
	lsls r2, r2, #1
	ldr r0, [r7, #0x30]
	subs r0, #0x20
	b _080899AE
	.align 2, 0
_08089988: .4byte gUnknown_03002F18
_0808998C: .4byte gUnknown_03002B34
_08089990: .4byte gUnknown_03005964
_08089994: .4byte 0x000001FF
_08089998:
	ldrb r0, [r1]
	subs r0, #4
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r1, r2, #3
	adds r1, #8
	ldr r0, _080899C4 @ =0x000001FF
	ands r1, r0
	lsls r2, r2, #1
	ldr r0, [r7, #0x30]
	subs r0, #0x42
_080899AE:
	subs r2, r2, r0
	mov r0, r8
	ands r2, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #5
	str r0, [sp]
	movs r0, #0x8b
	bl sub_0801F34C
	b _080899EA
	.align 2, 0
_080899C4: .4byte 0x000001FF
_080899C8:
	ldr r1, _080899F8 @ =gUnknown_03002F18
	movs r2, #0xb0
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _080899FC @ =gUnknown_03002B34
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08089A00 @ =gUnknown_03005908
	movs r0, #1
	str r0, [r1]
	adds r1, r7, #0
	adds r1, #0x48
	movs r0, #0
	strh r0, [r1]
	bl sub_0808A5C4
_080899EA:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080899F8: .4byte gUnknown_03002F18
_080899FC: .4byte gUnknown_03002B34
_08089A00: .4byte gUnknown_03005908

