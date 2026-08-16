	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08055A38
sub_08055A38: @ 0x08055A38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	movs r3, #0
	movs r6, #0
	cmp r5, #0
	bne _08055A68
	ldr r0, _08055A64 @ =gUnknown_020298E0
	lsls r1, r7, #3
	adds r1, r1, r7
	lsls r1, r1, #4
	adds r1, r1, r0
	movs r0, #0xff
	strh r0, [r1, #0x1a]
	b _08055D38
	.align 2, 0
_08055A64: .4byte gUnknown_020298E0
_08055A68:
	ldr r2, _08055AC0 @ =gUnknown_085D6A48
	ldr r0, _08055AC4 @ =gUnknown_03004580
	lsls r1, r7, #4
	adds r0, #2
	adds r1, r1, r0
	ldrh r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #4]
	lsls r1, r7, #3
	mov sb, r1
	cmp r0, #1
	bne _08055AF4
	ldr r4, _08055AC8 @ =gUnknown_085521B4
	mov r8, r4
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r2, r0, #2
	ldr r0, _08055ACC @ =gUnknown_020298FA
	mov ip, r0
	adds r0, r1, r7
	lsls r4, r0, #4
_08055A98:
	lsls r0, r6, #2
	adds r0, r0, r2
	add r0, r8
	ldrh r1, [r0]
	lsls r0, r3, #1
	adds r0, r0, r4
	add r0, ip
	strh r1, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r5
	beq _08055AD0
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #4
	bls _08055A98
	b _08055B56
	.align 2, 0
_08055AC0: .4byte gUnknown_085D6A48
_08055AC4: .4byte gUnknown_03004580
_08055AC8: .4byte gUnknown_085521B4
_08055ACC: .4byte gUnknown_020298FA
_08055AD0:
	subs r1, r5, #1
	lsls r1, r1, #1
	adds r1, r1, r4
	add r1, ip
	ldr r2, _08055AF0 @ =gUnknown_08552148
	lsls r0, r7, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	lsls r0, r5, #1
	adds r0, r0, r4
	add r0, ip
	movs r1, #0xff
	strh r1, [r0]
	b _08055B56
	.align 2, 0
_08055AF0: .4byte gUnknown_08552148
_08055AF4:
	cmp r6, r5
	beq _08055B56
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #2
	mov sl, r0
	ldr r1, _08055CC0 @ =gUnknown_02029A10
	mov ip, r1
	ldr r4, _08055CC4 @ =gUnknown_020298FA
	movs r0, #0xb4
	adds r1, r7, #0
	muls r1, r0, r1
	mov r8, r1
	mov r1, sb
	adds r0, r1, r7
	lsls r2, r0, #4
_08055B14:
	lsls r0, r6, #2
	add r0, sl
	ldr r1, _08055CC8 @ =gUnknown_0855218C
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	add r0, ip
	ldrb r0, [r0]
	cmp r0, #0
	beq _08055B46
	lsls r0, r3, #1
	adds r0, r0, r2
	adds r0, r0, r4
	strh r1, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r0, r3, #1
	adds r0, r0, r2
	adds r0, r0, r4
	movs r1, #0xff
	strh r1, [r0]
_08055B46:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #5
	bne _08055B52
	movs r6, #0
_08055B52:
	cmp r3, r5
	bne _08055B14
_08055B56:
	movs r4, #0
	movs r6, #0
	ldr r2, _08055CC0 @ =gUnknown_02029A10
	movs r0, #0xb4
	adds r1, r7, #0
	muls r1, r0, r1
_08055B62:
	lsls r0, r6, #3
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _08055B78
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_08055B78:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #4
	bls _08055B62
	cmp r5, r4
	bhs _08055BB6
	movs r6, #0
	ldr r3, _08055CC0 @ =gUnknown_02029A10
	movs r0, #0xb4
	adds r2, r7, #0
	muls r2, r0, r2
	ldr r1, _08055CCC @ =gUnknown_020298E0
	mov r4, sb
	adds r0, r4, r7
	lsls r0, r0, #4
	adds r1, r0, r1
_08055B9A:
	lsls r0, r6, #3
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, r0, r3
	ldrb r0, [r0, #1]
	cmp r0, #1
	bne _08055BAC
	strh r6, [r1, #0x1a]
_08055BAC:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #4
	bls _08055B9A
_08055BB6:
	movs r6, #0
	ldr r1, _08055CD0 @ =gUnknown_08551E64
	ldr r3, _08055CD4 @ =gUnknown_030045A0
	ldr r2, _08055CD8 @ =gUnknown_0300450C
	ldrh r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp]
	ldr r4, _08055CCC @ =gUnknown_020298E0
	mov ip, sb
	mov r1, sb
	adds r0, r1, r7
	lsls r0, r0, #4
	adds r1, r4, #0
	adds r1, #0x1a
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0xff
	beq _08055C58
	lsls r0, r7, #1
	str r0, [sp, #4]
	mov r8, r4
	movs r1, #1
	adds r0, r7, #0
	eors r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	mov sl, r0
_08055BF6:
	ldr r1, _08055CD8 @ =gUnknown_0300450C
	ldrh r0, [r1]
	ldr r4, [sp, #4]
	adds r0, r4, r0
	lsls r0, r0, #1
	ldr r1, _08055CDC @ =gUnknown_08551E7C
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r2, r0, #2
	adds r2, r2, r0
	adds r2, r6, r2
	lsls r3, r6, #1
	mov r4, ip
	adds r5, r4, r7
	lsls r5, r5, #4
	adds r3, r3, r5
	mov r4, r8
	adds r4, #0xc
	adds r4, r3, r4
	lsls r2, r2, #1
	ldr r0, [sp]
	adds r2, r2, r0
	mov r0, sl
	ldrh r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08055CE0 @ =gUnknown_08551D28
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r2, [r2]
	adds r0, r0, r2
	strh r0, [r4]
	mov r0, r8
	adds r0, #0x3a
	adds r3, r3, r0
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r0, r6, #1
	adds r0, r0, r5
	ldr r4, _08055CC4 @ =gUnknown_020298FA
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, #0xff
	bne _08055BF6
_08055C58:
	ldr r2, _08055CE4 @ =gUnknown_02029BE8
	movs r1, #1
	adds r0, r7, #0
	eors r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	cmp r0, #1
	beq _08055CE8
	movs r6, #0
	ldr r3, _08055CCC @ =gUnknown_020298E0
	mov r1, sb
	adds r0, r1, r7
	lsls r1, r0, #4
	adds r2, r3, #0
	adds r2, #0x1a
	adds r0, r1, r2
	ldrh r0, [r0]
	cmp r0, #0xff
	beq _08055D38
	adds r5, r1, #0
	adds r3, #0x3a
	mov ip, r3
	adds r7, r2, #0
_08055C88:
	movs r4, #0
	adds r3, r6, #1
	lsls r0, r6, #1
	adds r0, r0, r5
	adds r2, r0, r7
_08055C92:
	ldrh r0, [r2]
	cmp r0, r4
	bne _08055CA4
	lsls r1, r4, #1
	adds r1, r1, r5
	add r1, ip
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_08055CA4:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #4
	bls _08055C92
	lsls r0, r3, #0x10
	lsrs r6, r0, #0x10
	lsls r0, r6, #1
	adds r0, r0, r5
	adds r0, r0, r7
	ldrh r0, [r0]
	cmp r0, #0xff
	bne _08055C88
	b _08055D38
	.align 2, 0
_08055CC0: .4byte gUnknown_02029A10
_08055CC4: .4byte gUnknown_020298FA
_08055CC8: .4byte gUnknown_0855218C
_08055CCC: .4byte gUnknown_020298E0
_08055CD0: .4byte gUnknown_08551E64
_08055CD4: .4byte gUnknown_030045A0
_08055CD8: .4byte gUnknown_0300450C
_08055CDC: .4byte gUnknown_08551E7C
_08055CE0: .4byte gUnknown_08551D28
_08055CE4: .4byte gUnknown_02029BE8
_08055CE8:
	movs r6, #0
	ldr r3, _08055D48 @ =gUnknown_020298E0
	mov r4, sb
	adds r0, r4, r7
	lsls r1, r0, #4
	adds r2, r3, #0
	adds r2, #0x1a
	adds r0, r1, r2
	ldrh r0, [r0]
	cmp r0, #0xff
	beq _08055D38
	adds r3, #0x3a
	mov ip, r3
	adds r5, r2, #0
	movs r7, #0xc
_08055D06:
	movs r4, #0
	adds r3, r6, #1
	lsls r0, r6, #1
	adds r0, r0, r1
	adds r2, r0, r5
_08055D10:
	ldrh r0, [r2]
	cmp r0, r4
	bne _08055D1E
	lsls r0, r4, #1
	adds r0, r0, r1
	add r0, ip
	strh r7, [r0]
_08055D1E:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #4
	bls _08055D10
	lsls r0, r3, #0x10
	lsrs r6, r0, #0x10
	lsls r0, r6, #1
	adds r0, r0, r1
	adds r0, r0, r5
	ldrh r0, [r0]
	cmp r0, #0xff
	bne _08055D06
_08055D38:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08055D48: .4byte gUnknown_020298E0

