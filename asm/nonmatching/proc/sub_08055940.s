	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08055940
sub_08055940: @ 0x08055940
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	mov r0, sp
	movs r1, #0
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	movs r2, #0
	adds r7, r0, #0
	ldr r0, _08055A2C @ =gUnknown_08136158
	mov sb, r0
	mov r3, sp
	ldr r5, _08055A30 @ =gUnknown_020296E4
	adds r4, r7, #0
	adds r6, r5, #0
	subs r6, #0x28
_08055972:
	lsls r1, r2, #1
	adds r0, r1, r6
	ldrh r0, [r0]
	cmp r0, #0xff
	beq _08055982
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
_08055982:
	adds r0, r1, r5
	ldrh r0, [r0]
	cmp r0, #0xff
	beq _08055990
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
_08055990:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #4
	bls _08055972
	mov r1, ip
	cmp r1, #2
	bne _080559AA
	ldr r0, _08055A34 @ =gUnknown_0300450C
	ldrh r0, [r0]
	cmp r0, #0
	bne _080559AA
	strh r0, [r7]
_080559AA:
	mov r0, r8
	cmp r0, #2
	bne _080559BE
	ldr r0, _08055A34 @ =gUnknown_0300450C
	ldrh r0, [r0]
	cmp r0, #1
	bne _080559BE
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
_080559BE:
	mov r1, ip
	cmp r1, #2
	bne _080559D2
	ldr r0, _08055A34 @ =gUnknown_0300450C
	ldrh r0, [r0]
	cmp r0, #0
	beq _080559D2
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
_080559D2:
	mov r0, r8
	cmp r0, #2
	bne _080559E4
	ldr r0, _08055A34 @ =gUnknown_0300450C
	ldrh r0, [r0]
	cmp r0, #1
	beq _080559E4
	movs r0, #0
	strh r0, [r7]
_080559E4:
	mov r1, sb
	ldr r0, [r1]
	ldrh r0, [r0, #2]
	cmp r0, #9
	beq _080559F2
	cmp r0, #0x14
	bne _080559F8
_080559F2:
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
_080559F8:
	mov r1, sb
	ldr r0, [r1]
	ldrh r0, [r0, #0x12]
	cmp r0, #9
	beq _08055A06
	cmp r0, #0x14
	bne _08055A0A
_08055A06:
	movs r0, #0
	strh r0, [r7]
_08055A0A:
	mov r0, sp
	ldrh r0, [r0]
	movs r1, #1
	bl sub_08055A38
	ldrh r0, [r7]
	movs r1, #0
	bl sub_08055A38
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08055A2C: .4byte gUnknown_08136158
_08055A30: .4byte gUnknown_020296E4
_08055A34: .4byte gUnknown_0300450C

