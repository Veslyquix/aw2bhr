	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08089A04
sub_08089A04: @ 0x08089A04
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r0, #0
	adds r1, r6, #0
	adds r1, #0x4c
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0xf
	bgt _08089AE8
	movs r2, #0x9e
	rsbs r2, r2, #0
	adds r3, r0, #0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #1
	movs r1, #0
	bl Interpolate
	str r0, [r6, #0x30]
	ldr r1, _08089AAC @ =gUnknown_03002F18
	movs r2, #0xb0
	lsls r2, r2, #1
	adds r0, r0, r2
	strh r0, [r1]
	movs r4, #0
	movs r7, #0
	movs r5, #8
_08089A3E:
	adds r0, r4, #0
	adds r0, #0x83
	ldr r2, [r6, #0x30]
	subs r2, #0x28
	subs r2, r7, r2
	movs r1, #0xff
	ands r2, r1
	movs r1, #4
	str r1, [sp]
	adds r1, r5, #0
	movs r3, #0x80
	lsls r3, r3, #4
	bl sub_0801F34C
	adds r7, #6
	adds r5, #0x18
	adds r4, #1
	cmp r4, #3
	ble _08089A3E
	movs r4, #0
	movs r7, #0
	movs r5, #0x10
_08089A6A:
	adds r0, r4, #0
	adds r0, #0x87
	ldr r2, [r6, #0x30]
	subs r2, #0x4a
	subs r2, r7, r2
	movs r1, #0xff
	mov r8, r1
	ands r2, r1
	movs r1, #4
	str r1, [sp]
	adds r1, r5, #0
	movs r3, #0x80
	lsls r3, r3, #4
	bl sub_0801F34C
	adds r7, #6
	adds r5, #0x18
	adds r4, #1
	cmp r4, #3
	ble _08089A6A
	ldr r1, _08089AB0 @ =gUnknown_03005964
	ldrb r0, [r1]
	cmp r0, #3
	bhi _08089AB8
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r1, r2, #3
	ldr r0, _08089AB4 @ =0x000001FF
	ands r1, r0
	lsls r2, r2, #1
	ldr r0, [r6, #0x30]
	subs r0, #0x20
	b _08089ACE
	.align 2, 0
_08089AAC: .4byte gUnknown_03002F18
_08089AB0: .4byte gUnknown_03005964
_08089AB4: .4byte 0x000001FF
_08089AB8:
	ldrb r0, [r1]
	subs r0, #4
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r1, r2, #3
	adds r1, #8
	ldr r0, _08089AE4 @ =0x000001FF
	ands r1, r0
	lsls r2, r2, #1
	ldr r0, [r6, #0x30]
	subs r0, #0x42
_08089ACE:
	subs r2, r2, r0
	mov r0, r8
	ands r2, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #5
	str r0, [sp]
	movs r0, #0x8b
	bl sub_0801F34C
	b _08089BFE
	.align 2, 0
_08089AE4: .4byte 0x000001FF
_08089AE8:
	cmp r0, #0x1f
	bgt _08089BE0
	movs r2, #0
	ldrsh r3, [r1, r2]
	subs r3, #0x10
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc2
	movs r2, #0x24
	bl Interpolate
	str r0, [r6, #0x30]
	ldr r5, _08089BCC @ =gUnknown_03002F18
	ldr r0, [r6, #0x3c]
	movs r1, #3
	bl Div
	movs r1, #4
	bl DivRem
	ldr r1, [r6, #0x30]
	subs r1, r1, r0
	strh r1, [r5]
	ldr r4, _08089BD0 @ =gUnknown_03002B34
	ldr r0, [r6, #0x3c]
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
	bge _08089B42
	ldrh r0, [r5]
	subs r0, #4
	strh r0, [r5]
	ldrh r0, [r4]
	adds r0, #0xc
	strh r0, [r4]
_08089B42:
	ldr r2, [r6, #0x30]
	movs r0, #0x78
	subs r0, r0, r2
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08089B62
	movs r1, #0x78
	subs r1, r1, r2
	movs r0, #0xff
	ands r1, r0
	movs r2, #0xa6
	lsls r2, r2, #6
	movs r0, #0x40
	movs r3, #4
	bl sub_08043FD8
_08089B62:
	ldr r2, [r6, #0x30]
	movs r0, #0x60
	subs r0, r0, r2
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08089B86
	movs r1, #0x60
	subs r1, r1, r2
	movs r0, #0xff
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r1, r0
	ldr r2, _08089BD4 @ =0x000039A4
	movs r0, #0x88
	movs r3, #4
	bl sub_08043FD8
_08089B86:
	ldr r2, [r6, #0x30]
	movs r0, #0x48
	subs r0, r0, r2
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08089BAA
	movs r1, #0x48
	subs r1, r1, r2
	movs r0, #0xff
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r1, r0
	ldr r2, _08089BD8 @ =0x000049C8
	movs r0, #0xd0
	movs r3, #4
	bl sub_08043FD8
_08089BAA:
	ldr r1, [r6, #0x30]
	movs r0, #0x80
	subs r0, r0, r1
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08089BFE
	movs r2, #0x40
	subs r2, r2, r1
	ldr r3, _08089BDC @ =gUnknown_0848B6A0
	movs r0, #0x80
	lsls r0, r0, #4
	str r0, [sp]
	movs r0, #1
	movs r1, #0x20
	bl PutSprite
	b _08089BFE
	.align 2, 0
_08089BCC: .4byte gUnknown_03002F18
_08089BD0: .4byte gUnknown_03002B34
_08089BD4: .4byte 0x000039A4
_08089BD8: .4byte 0x000049C8
_08089BDC: .4byte gUnknown_0848B6A0
_08089BE0:
	ldr r1, _08089C0C @ =gUnknown_03005908
	movs r0, #0
	str r0, [r1]
	bl sub_0808A5C4
	ldr r2, _08089C10 @ =gUnknown_03001FE8
	ldrb r1, [r2, #1]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2, #1]
	adds r0, r6, #0
	bl sub_08088ECC
_08089BFE:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089C0C: .4byte gUnknown_03005908
_08089C10: .4byte gUnknown_03001FE8

