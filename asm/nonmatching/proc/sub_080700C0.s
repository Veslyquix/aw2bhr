	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080700C0
sub_080700C0: @ 0x080700C0
	push {r4, r5, r6, r7, lr}
	mov r4, r8
	mov r5, sb
	mov r6, sl
	mov r7, fp
	push {r4, r5, r6, r7}
	sub sp, #0x18
	str r1, [sp]
	adds r5, r2, #0
	ldr r1, _080702B8 @ =gUnknown_03007FF0
	ldr r1, [r1]
	str r1, [sp, #4]
	ldr r1, _080702BC @ =gUnknown_081B9FD8
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r5, #4]
	ldr r3, [r5, #0x40]
	ldrb r0, [r3]
	cmp r0, #0x80
	bhs _08070106
	strb r0, [r5, #5]
	adds r3, #1
	ldrb r0, [r3]
	cmp r0, #0x80
	bhs _08070104
	strb r0, [r5, #6]
	adds r3, #1
	ldrb r0, [r3]
	cmp r0, #0x80
	bhs _08070104
	ldrb r1, [r5, #4]
	adds r1, r1, r0
	strb r1, [r5, #4]
	adds r3, #1
_08070104:
	str r3, [r5, #0x40]
_08070106:
	movs r0, #0
	str r0, [sp, #0x14]
	adds r4, r5, #0
	adds r4, #0x24
	ldrb r2, [r4]
	movs r0, #0xc0
	tst r0, r2
	beq _08070158
	ldrb r3, [r5, #5]
	movs r0, #0x40
	tst r0, r2
	beq _08070126
	ldr r1, [r5, #0x2c]
	adds r1, r1, r3
	ldrb r0, [r1]
	b _08070128
_08070126:
	adds r0, r3, #0
_08070128:
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r5, #0x28]
	adds r1, r1, r0
	mov sb, r1
	mov r6, sb
	ldrb r1, [r6]
	movs r0, #0xc0
	tst r0, r1
	beq _08070140
	b _080702A6
_08070140:
	movs r0, #0x80
	tst r0, r2
	beq _0807015C
	ldrb r1, [r6, #3]
	movs r0, #0x80
	tst r0, r1
	beq _08070154
	subs r1, #0xc0
	lsls r1, r1, #1
	str r1, [sp, #0x14]
_08070154:
	ldrb r3, [r6, #1]
	b _0807015C
_08070158:
	mov sb, r4
	ldrb r3, [r5, #5]
_0807015C:
	str r3, [sp, #8]
	ldr r6, [sp]
	ldrb r1, [r6, #9]
	ldrb r0, [r5, #0x1d]
	adds r0, r0, r1
	cmp r0, #0xff
	bls _0807016C
	movs r0, #0xff
_0807016C:
	str r0, [sp, #0x10]
	mov r6, sb
	ldrb r0, [r6]
	movs r6, #7
	ands r6, r0
	str r6, [sp, #0xc]
	beq _080701AC
	ldr r0, [sp, #4]
	ldr r4, [r0, #0x1c]
	cmp r4, #0
	bne _08070184
	b _080702A6
_08070184:
	subs r6, #1
	lsls r0, r6, #6
	adds r4, r4, r0
	ldrb r1, [r4]
	movs r0, #0xc7
	tst r0, r1
	beq _08070200
	movs r0, #0x40
	tst r0, r1
	bne _08070200
	ldrb r1, [r4, #0x13]
	ldr r0, [sp, #0x10]
	cmp r1, r0
	blo _08070200
	beq _080701A4
	b _080702A6
_080701A4:
	ldr r0, [r4, #0x2c]
	cmp r0, r5
	bhs _08070200
	b _080702A6
_080701AC:
	ldr r6, [sp, #0x10]
	adds r7, r5, #0
	movs r2, #0
	mov r8, r2
	ldr r4, [sp, #4]
	ldrb r3, [r4, #6]
	adds r4, #0x50
_080701BA:
	ldrb r1, [r4]
	movs r0, #0xc7
	tst r0, r1
	beq _08070200
	movs r0, #0x40
	tst r0, r1
	beq _080701D4
	cmp r2, #0
	bne _080701D8
	adds r2, #1
	ldrb r6, [r4, #0x13]
	ldr r7, [r4, #0x2c]
	b _080701F2
_080701D4:
	cmp r2, #0
	bne _080701F4
_080701D8:
	ldrb r0, [r4, #0x13]
	cmp r0, r6
	bhs _080701E4
	adds r6, r0, #0
	ldr r7, [r4, #0x2c]
	b _080701F2
_080701E4:
	bhi _080701F4
	ldr r0, [r4, #0x2c]
	cmp r0, r7
	bls _080701F0
	adds r7, r0, #0
	b _080701F2
_080701F0:
	blo _080701F4
_080701F2:
	mov r8, r4
_080701F4:
	adds r4, #0x40
	subs r3, #1
	bgt _080701BA
	mov r4, r8
	cmp r4, #0
	beq _080702A6
_08070200:
	adds r0, r4, #0
	bl sub_080707CC
	movs r1, #0
	str r1, [r4, #0x30]
	ldr r3, [r5, #0x20]
	str r3, [r4, #0x34]
	cmp r3, #0
	beq _08070214
	str r4, [r3, #0x30]
_08070214:
	str r4, [r5, #0x20]
	str r5, [r4, #0x2c]
	ldrb r0, [r5, #0x1b]
	strb r0, [r5, #0x1c]
	cmp r0, r1
	beq _08070226
	adds r1, r5, #0
	bl sub_08070300
_08070226:
	ldr r0, [sp]
	adds r1, r5, #0
	bl sub_08070D98
	ldr r0, [r5, #4]
	str r0, [r4, #0x10]
	ldr r0, [sp, #0x10]
	strb r0, [r4, #0x13]
	ldr r0, [sp, #8]
	strb r0, [r4, #8]
	ldr r0, [sp, #0x14]
	strb r0, [r4, #0x14]
	mov r6, sb
	ldrb r0, [r6]
	strb r0, [r4, #1]
	ldr r7, [r6, #4]
	str r7, [r4, #0x24]
	ldr r0, [r6, #8]
	str r0, [r4, #4]
	ldrh r0, [r5, #0x1e]
	strh r0, [r4, #0xc]
	bl sub_08070090
	ldrb r1, [r4, #8]
	movs r0, #8
	ldrsb r0, [r5, r0]
	adds r3, r1, r0
	bpl _08070260
	movs r3, #0
_08070260:
	ldr r6, [sp, #0xc]
	cmp r6, #0
	beq _0807028E
	mov r6, sb
	ldrb r0, [r6, #2]
	strb r0, [r4, #0x1e]
	ldrb r1, [r6, #3]
	movs r0, #0x80
	tst r0, r1
	bne _0807027A
	movs r0, #0x70
	tst r0, r1
	bne _0807027C
_0807027A:
	movs r1, #8
_0807027C:
	strb r1, [r4, #0x1f]
	ldrb r2, [r5, #9]
	adds r1, r3, #0
	ldr r0, [sp, #0xc]
	ldr r3, [sp, #4]
	ldr r3, [r3, #0x30]
	bl sub_0807003C
	b _08070298
_0807028E:
	ldrb r2, [r5, #9]
	adds r1, r3, #0
	adds r0, r7, #0
	bl sub_08070350
_08070298:
	str r0, [r4, #0x20]
	movs r0, #0x80
	strb r0, [r4]
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	strb r0, [r5]
_080702A6:
	add sp, #0x18
	pop {r0, r1, r2, r3, r4, r5, r6, r7}
	mov r8, r0
	mov sb, r1
	mov sl, r2
	mov fp, r3
	pop {r0}
	bx r0
	.align 2, 0
_080702B8: .4byte gUnknown_03007FF0
_080702BC: .4byte gUnknown_081B9FD8

