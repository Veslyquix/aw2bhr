	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080880BC
sub_080880BC: @ 0x080880BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x4c
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0x18
	bgt _08088178
	movs r1, #0xcc
	rsbs r1, r1, #0
	adds r3, r0, #0
	movs r0, #0x18
	mov r8, r0
	str r0, [sp]
	movs r0, #5
	movs r2, #0x24
	bl Interpolate
	str r0, [r5, #0x30]
	ldr r7, _08088170 @ =gUnknown_03002F18
	ldr r0, [r5, #0x3c]
	movs r1, #3
	bl Div
	movs r1, #4
	bl DivRem
	ldr r1, [r5, #0x30]
	subs r1, r1, r0
	strh r1, [r7]
	ldr r4, _08088174 @ =gUnknown_03002B34
	ldr r0, [r5, #0x3c]
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
	bge _0808812C
	ldrh r0, [r7]
	subs r0, #4
	strh r0, [r7]
	ldrh r0, [r4]
	adds r0, #0xc
	strh r0, [r4]
_0808812C:
	movs r1, #0
	ldrsh r3, [r6, r1]
	mov r2, r8
	str r2, [sp]
	movs r0, #5
	movs r1, #0x78
	movs r2, #0
	bl Interpolate
	str r0, [r5, #0x34]
	ldrh r1, [r6]
	adds r0, r1, #0
	subs r0, #0xf
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #3
	bhi _08088190
	movs r0, #0x15
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0
	ldrsh r2, [r6, r1]
	subs r2, #0xd
	lsls r2, r2, #0x11
	asrs r2, r2, #0x10
	movs r1, #0xe
	movs r3, #4
	bl sub_0801A444
	bl sub_0808A47C
	b _08088190
	.align 2, 0
_08088170: .4byte gUnknown_03002F18
_08088174: .4byte gUnknown_03002B34
_08088178:
	adds r0, r5, #0
	bl Proc_Break
	ldr r2, _080881E0 @ =gUnknown_03001FE8
	ldrb r1, [r2, #1]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2, #1]
	bl sub_0808A3DC
_08088190:
	adds r0, r5, #0
	adds r0, #0x4c
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r6, r0, #0
	cmp r1, #0x11
	bgt _080881A0
	b _08088378
_080881A0:
	ldr r4, _080881E4 @ =gUnknown_081D9454
	ldr r0, [r4]
	adds r0, #0x80
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	mov sb, r0
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	movs r0, #0
	ldrsh r3, [r6, r0]
	subs r3, #0x11
	movs r7, #8
	str r7, [sp]
	movs r0, #0
	movs r1, #0x10
	bl Interpolate
	cmp r0, #0
	beq _080881E8
	movs r1, #0
	ldrsh r3, [r6, r1]
	subs r3, #0x11
	str r7, [sp]
	movs r0, #0
	movs r1, #0x10
	mov r2, r8
	bl Interpolate
	adds r1, r0, #0
	b _080881EA
	.align 2, 0
_080881E0: .4byte gUnknown_03001FE8
_080881E4: .4byte gUnknown_081D9454
_080881E8:
	movs r1, #2
_080881EA:
	mov r0, sb
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
	ldr r0, _08088244 @ =gSinLut
	movs r2, #0
	ldrsh r4, [r0, r2]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	movs r7, #0x80
	lsls r7, r7, #1
	adds r1, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sb, r0
	lsls r4, r4, #4
	mov r8, r4
	movs r0, #0
	ldrsh r3, [r6, r0]
	subs r3, #0x11
	movs r4, #8
	str r4, [sp]
	movs r0, #0
	movs r1, #0x10
	adds r2, r7, #0
	bl Interpolate
	cmp r0, #0
	beq _08088248
	movs r1, #0
	ldrsh r3, [r6, r1]
	subs r3, #0x11
	str r4, [sp]
	movs r0, #0
	movs r1, #0x10
	adds r2, r7, #0
	bl Interpolate
	adds r1, r0, #0
	b _0808824A
	.align 2, 0
_08088244: .4byte gSinLut
_08088248:
	movs r1, #2
_0808824A:
	mov r0, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r0, _080882C4 @ =gSinLut
	adds r0, #0x80
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r7, r0, #4
	movs r0, #0x80
	lsls r0, r0, #1
	mov r8, r0
	adds r0, r7, #0
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	mov r1, sl
	mov r2, sb
	adds r3, r4, #0
	bl SetObjAffine
	movs r1, #0xbc
	lsls r1, r1, #1
	ldr r2, _080882C8 @ =0x0000A2CC
	movs r0, #0x30
	movs r3, #3
	bl sub_08043B60
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0x15
	bgt _0808835E
	adds r3, r0, #0
	subs r3, #0x11
	movs r4, #4
	str r4, [sp]
	movs r0, #0
	movs r1, #0x10
	mov r2, r8
	bl Interpolate
	cmp r0, #0
	beq _080882CC
	movs r0, #0
	ldrsh r3, [r6, r0]
	subs r3, #0x11
	str r4, [sp]
	movs r0, #0
	movs r1, #0x10
	mov r2, r8
	bl Interpolate
	adds r1, r0, #0
	b _080882CE
	.align 2, 0
_080882C4: .4byte gSinLut
_080882C8: .4byte 0x0000A2CC
_080882CC:
	movs r1, #2
_080882CE:
	adds r0, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
	ldr r0, _08088328 @ =gSinLut
	movs r1, #0
	ldrsh r4, [r0, r1]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	movs r7, #0x80
	lsls r7, r7, #1
	adds r1, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sb, r0
	lsls r4, r4, #4
	mov r8, r4
	movs r2, #0
	ldrsh r3, [r6, r2]
	subs r3, #0x11
	movs r4, #4
	str r4, [sp]
	movs r0, #0
	movs r1, #0x10
	adds r2, r7, #0
	bl Interpolate
	cmp r0, #0
	beq _0808832C
	movs r0, #0
	ldrsh r3, [r6, r0]
	subs r3, #0x11
	str r4, [sp]
	movs r0, #0
	movs r1, #0x10
	adds r2, r7, #0
	bl Interpolate
	adds r1, r0, #0
	b _0808832E
	.align 2, 0
_08088328: .4byte gSinLut
_0808832C:
	movs r1, #2
_0808832E:
	mov r0, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r0, _08088438 @ =gSinLut
	adds r0, #0x80
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #1
	mov r1, sl
	mov r2, sb
	adds r3, r4, #0
	bl SetObjAffine
_0808835E:
	ldr r1, _0808843C @ =gUnknown_03005958
	ldr r0, [r5, #0x58]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r0, #0x3e
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0xbc
	lsls r2, r2, #1
	movs r3, #0
	str r3, [sp]
	bl sub_0801F34C
_08088378:
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
	ldr r2, [r5, #0x30]
	movs r0, #0x78
	subs r0, r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xd0
	bgt _080883A0
	movs r1, #0x78
	subs r1, r1, r2
	movs r0, #0xff
	ands r1, r0
	movs r2, #0xa6
	lsls r2, r2, #6
	movs r0, #0x40
	movs r3, #4
	bl sub_08043FD8
_080883A0:
	ldr r2, [r5, #0x30]
	movs r0, #0x60
	subs r0, r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xd0
	bgt _080883C6
	movs r1, #0x60
	subs r1, r1, r2
	movs r0, #0xff
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r1, r0
	ldr r2, _08088440 @ =0x000039A4
	movs r0, #0x88
	movs r3, #4
	bl sub_08043FD8
_080883C6:
	ldr r2, [r5, #0x30]
	movs r0, #0x48
	subs r0, r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xd0
	bgt _080883EC
	movs r1, #0x48
	subs r1, r1, r2
	movs r0, #0xff
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r1, r0
	ldr r2, _08088444 @ =0x000049C8
	movs r0, #0xd0
	movs r3, #4
	bl sub_08043FD8
_080883EC:
	ldr r1, [r5, #0x30]
	movs r0, #0x40
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xd0
	bgt _0808840C
	movs r2, #0x40
	subs r2, r2, r1
	ldr r3, _08088448 @ =gUnknown_0848B6A0
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x20
	bl PutSprite
_0808840C:
	ldr r0, [r5, #0x34]
	adds r0, #0xb0
	movs r2, #0x82
	lsls r2, r2, #5
	movs r1, #1
	str r1, [sp]
	movs r1, #0xa0
	movs r3, #2
	bl sub_08043C28
	ldr r0, [r5, #0x3c]
	subs r0, #1
	str r0, [r5, #0x3c]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08088438: .4byte gSinLut
_0808843C: .4byte gUnknown_03005958
_08088440: .4byte 0x000039A4
_08088444: .4byte 0x000049C8
_08088448: .4byte gUnknown_0848B6A0

