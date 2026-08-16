	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080699E8
sub_080699E8: @ 0x080699E8
	push {r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r1, [r4, #0x2c]
	movs r0, #0xaa
	subs r0, r0, r1
	cmp r0, #0x4a
	beq _08069AA8
	cmp r0, #0x4a
	bgt _08069A14
	cmp r0, #0x1f
	beq _08069A5C
	cmp r0, #0x1f
	bgt _08069A0A
	cmp r0, #6
	beq _08069A34
	b _08069B4C
_08069A0A:
	cmp r0, #0x20
	beq _08069A7A
	cmp r0, #0x2c
	beq _08069A88
	b _08069B4C
_08069A14:
	cmp r0, #0x90
	beq _08069AC4
	cmp r0, #0x90
	bgt _08069A26
	cmp r0, #0x68
	beq _08069AD0
	cmp r0, #0x74
	beq _08069AF8
	b _08069B4C
_08069A26:
	cmp r0, #0x9a
	bne _08069A2C
	b _08069B34
_08069A2C:
	cmp r0, #0xa4
	bne _08069A32
	b _08069B42
_08069A32:
	b _08069B4C
_08069A34:
	ldr r2, _08069A58 @ =gUnknown_030030CC
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	adds r0, r4, #0
	bl sub_0806974C
	b _08069B4C
	.align 2, 0
_08069A58: .4byte gUnknown_030030CC
_08069A5C:
	movs r0, #0xa
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r4, [sp, #0x10]
	movs r0, #0
	movs r1, #0xa
	movs r2, #0x78
	movs r3, #0x78
	bl sub_08067ED0
	b _08069B4C
_08069A7A:
	movs r0, #0
	movs r1, #0xa
	movs r2, #0x28
	adds r3, r4, #0
	bl sub_08068014
	b _08069B4C
_08069A88:
	ldr r2, _08069AA4 @ =gUnknown_030030CC
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	b _08069AEA
	.align 2, 0
_08069AA4: .4byte gUnknown_030030CC
_08069AA8:
	ldr r2, _08069ACC @ =gUnknown_030030CC
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
_08069AC4:
	bl sub_080697A4
	b _08069B4C
	.align 2, 0
_08069ACC: .4byte gUnknown_030030CC
_08069AD0:
	ldr r2, _08069AF4 @ =gUnknown_030030CC
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
_08069AEA:
	strb r0, [r2, #1]
	bl sub_0806978C
	b _08069B4C
	.align 2, 0
_08069AF4: .4byte gUnknown_030030CC
_08069AF8:
	ldr r2, _08069B30 @ =gUnknown_030030CC
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #1
	bl sub_08069924
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0
	adds r3, r4, #0
	bl sub_08067898
	b _08069B4C
	.align 2, 0
_08069B30: .4byte gUnknown_030030CC
_08069B34:
	movs r0, #0
	bl sub_08069924
	movs r0, #1
	bl sub_080678BC
	b _08069B4C
_08069B42:
	ldr r0, _08069B58 @ =gUnknown_08581108
	bl Proc_EndEach
	bl sub_080697BC
_08069B4C:
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	beq _08069B5C
	subs r0, #1
	str r0, [r4, #0x2c]
	b _08069B62
	.align 2, 0
_08069B58: .4byte gUnknown_08581108
_08069B5C:
	adds r0, r4, #0
	bl Proc_Break
_08069B62:
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

