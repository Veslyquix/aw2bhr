	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045090
sub_08045090: @ 0x08045090
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	mov r1, r8
	adds r1, #0x2b
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bhi _080450B2
	b _080451B6
_080450B2:
	movs r0, #0
	strb r0, [r1]
	mov r0, r8
	adds r0, #0x2a
	ldrb r5, [r0]
	mov sl, r0
_080450BE:
	cmp r5, #4
	bls _080450CA
	mov r0, r8
	bl Proc_Break
	b _080451B6
_080450CA:
	adds r0, r5, #0
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080450FE
	ldr r0, _08045108 @ =gUnknown_08499598
	ldr r4, [r0]
	lsls r1, r5, #4
	subs r1, r1, r5
	lsls r1, r1, #2
	adds r1, r1, r4
	adds r1, #0x2a
	mov r3, r8
	adds r3, #0x2c
	ldrb r2, [r3]
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x2a
	ldrb r1, [r1]
	mov ip, r3
	ldrb r0, [r0]
	cmp r1, r0
	bne _0804510C
_080450FE:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _080450BE
	.align 2, 0
_08045108: .4byte gUnknown_08499598
_0804510C:
	mov r0, sl
	strb r5, [r0]
	mov r0, r8
	adds r0, #0x29
	ldrb r7, [r0]
	str r0, [sp]
	cmp r7, #0x32
	bhi _0804519C
	ldr r2, _0804516C @ =gUnknown_08499594
	movs r1, #0x80
	rsbs r1, r1, #0
	mov sb, r1
_08045124:
	ldr r1, _08045170 @ =gUnknown_084995FE
	mov r3, sl
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, r0, r7
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r2]
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, #0
	beq _08045192
	ldrb r1, [r4, #1]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _08045192
	ldrb r5, [r4, #4]
	lsls r6, r5, #0x19
	lsrs r2, r6, #0x19
	mov r0, r8
	adds r0, #0x2d
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r3, r0, #1
	adds r0, r3, #1
	cmp r2, r0
	bge _08045174
	mov r0, sb
	ands r0, r5
	movs r1, #1
	b _08045180
	.align 2, 0
_0804516C: .4byte gUnknown_08499594
_08045170: .4byte gUnknown_084995FE
_08045174:
	lsrs r1, r6, #0x19
	subs r1, r1, r3
	movs r0, #0x7f
	ands r1, r0
	mov r0, sb
	ands r0, r5
_08045180:
	orrs r0, r1
	strb r0, [r4, #4]
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	mov r3, ip
	ldrb r2, [r3]
	bl sub_080452C0
	b _0804519C
_08045192:
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0x32
	bls _08045124
_0804519C:
	adds r0, r7, #1
	ldr r1, [sp]
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x32
	bls _080451B6
	movs r0, #1
	strb r0, [r1]
	mov r3, sl
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
_080451B6:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

