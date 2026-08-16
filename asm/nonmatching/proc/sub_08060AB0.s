	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08060AB0
sub_08060AB0: @ 0x08060AB0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	movs r7, #0
	ldr r0, _08060AD8 @ =gUnknown_0816DAD8
	ldr r1, [r0]
	ldrb r1, [r1, #6]
	cmp r1, #0
	beq _08060ACA
	b _08060D3C
_08060ACA:
	ldr r4, _08060ADC @ =gUnknown_03004674
	ldr r0, [r4]
	cmp r0, #0
	bne _08060AE0
	movs r0, #0x64
	b _08060AF0
	.align 2, 0
_08060AD8: .4byte gUnknown_0816DAD8
_08060ADC: .4byte gUnknown_03004674
_08060AE0:
	movs r0, #4
	bl sub_08057F00
	movs r1, #0x64
	muls r0, r1, r0
	ldr r1, [r4]
	bl __divsi3
_08060AF0:
	str r0, [sp, #0x20]
	bl sub_08060F00
	bl sub_08062C94
_08060AFA:
	movs r1, #0
	mov sl, r1
	movs r5, #1
	ldr r0, _08060B34 @ =gUnknown_02029C20
	adds r2, r0, #2
_08060B04:
	ldrh r0, [r2]
	lsls r1, r7, #0x10
	lsls r0, r0, #0x10
	cmp r1, r0
	bge _08060B18
	ldrh r0, [r2]
	adds r7, r0, #0
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
_08060B18:
	adds r2, #2
	adds r5, #1
	cmp r5, #0x18
	ble _08060B04
	mov r2, sl
	cmp r2, #0
	bne _08060B28
	b _08060D3C
_08060B28:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x64
	ble _08060B38
	movs r0, #0x28
	b _08060B42
	.align 2, 0
_08060B34: .4byte gUnknown_02029C20
_08060B38:
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_08060B42:
	str r0, [sp, #0x1c]
	movs r5, #1
	add r1, sp, #4
	mov sb, r1
	movs r2, #0
	str r2, [sp, #0x24]
_08060B4E:
	movs r1, #0
	mov r0, sb
	strb r1, [r0]
	ldr r0, _08060BBC @ =gUnknown_085766E0
	ldr r0, [r0]
	ldr r2, [sp, #0x24]
	adds r0, r0, r2
	ldrb r0, [r0, #0x1b]
	cmp r0, #0
	beq _08060BF2
	ldr r6, _08060BC0 @ =gUnknown_030033EC
	ldrh r0, [r6]
	ldr r7, _08060BC4 @ =gUnknown_08499598
	ldr r2, [r7]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r1, #0x1d]
	ldrb r1, [r1, #0x1e]
	movs r2, #0
	str r2, [sp]
	adds r2, r5, #0
	mov r3, sl
	bl sub_08043070
	adds r4, r0, #0
	ldrh r0, [r6]
	ldr r2, [r7]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r1, #0x1d]
	ldrb r1, [r1, #0x1e]
	movs r2, #1
	mov r8, r2
	str r2, [sp]
	adds r2, r5, #0
	mov r3, sl
	bl sub_08043070
	cmp r4, r0
	ble _08060BC8
	ldrh r0, [r6]
	ldr r2, [r7]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r1, #0x1d]
	ldrb r1, [r1, #0x1e]
	movs r2, #0
	b _08060BDA
	.align 2, 0
_08060BBC: .4byte gUnknown_085766E0
_08060BC0: .4byte gUnknown_030033EC
_08060BC4: .4byte gUnknown_08499598
_08060BC8:
	ldrh r0, [r6]
	ldr r2, [r7]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r1, #0x1d]
	ldrb r1, [r1, #0x1e]
	mov r2, r8
_08060BDA:
	str r2, [sp]
	adds r2, r5, #0
	mov r3, sl
	bl sub_08043070
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [sp, #0x1c]
	cmp r0, r1
	blo _08060BF2
	mov r2, sb
	strb r0, [r2]
_08060BF2:
	movs r0, #1
	add sb, r0
	ldr r1, [sp, #0x24]
	adds r1, #0xc
	str r1, [sp, #0x24]
	adds r5, #1
	cmp r5, #0x18
	ble _08060B4E
	ldr r1, _08060C78 @ =gUnknown_085766E0
	ldr r0, _08060C7C @ =gUnknown_03004640
	add r3, sp, #4
	adds r4, r0, #2
	ldr r2, [r1]
	movs r6, #0
	movs r5, #0x17
_08060C10:
	ldrb r1, [r2, #0x1b]
	lsrs r0, r1, #1
	adds r1, r1, r0
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bge _08060C22
	strb r6, [r3]
_08060C22:
	adds r3, #1
	adds r4, #2
	adds r2, #0xc
	subs r5, #1
	cmp r5, #0
	bge _08060C10
_08060C2E:
	movs r6, #0
	movs r7, #0
	movs r5, #1
	add r2, sp, #4
_08060C36:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	ldrb r1, [r2]
	cmp r0, r1
	bge _08060C46
	adds r7, r1, #0
	lsls r0, r5, #0x18
	lsrs r6, r0, #0x18
_08060C46:
	adds r2, #1
	adds r5, #1
	cmp r5, #0x18
	ble _08060C36
	cmp r6, #0
	beq _08060D28
	subs r0, r6, #1
	mov r1, sp
	adds r1, r1, r0
	adds r1, #4
	movs r0, #0
	strb r0, [r1]
	ldr r2, _08060C80 @ =gUnknown_0816DADC
	ldr r1, [r2]
	movs r0, #0x5c
	muls r0, r6, r0
	adds r0, r0, r1
	ldrb r0, [r0, #0x1a]
	cmp r0, #0x10
	beq _08060C84
	cmp r0, #0x20
	beq _08060C88
	movs r4, #2
	b _08060C8A
	.align 2, 0
_08060C78: .4byte gUnknown_085766E0
_08060C7C: .4byte gUnknown_03004640
_08060C80: .4byte gUnknown_0816DADC
_08060C84:
	movs r4, #4
	b _08060C8A
_08060C88:
	movs r4, #6
_08060C8A:
	ldr r2, _08060D08 @ =gUnknown_030033EC
	mov r8, r2
	ldrh r0, [r2]
	adds r1, r6, #0
	bl sub_08042C9C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #0x11
	lsrs r5, r1, #0x10
	mov sb, r5
	adds r0, r4, #0
	bl sub_08060ED4
	cmp r0, #0
	beq _08060C2E
	mov r0, r8
	ldrh r1, [r0]
	ldr r0, _08060D0C @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r2, [r0]
	cmp r5, r2
	bhi _08060C2E
	ldr r1, _08060D10 @ =gUnknown_085D5ABC
	movs r0, #0x5c
	muls r0, r6, r0
	adds r0, r0, r1
	ldrb r0, [r0, #0x1b]
	cmp r0, #4
	bne _08060CDC
	ldr r0, _08060D14 @ =gUnknown_085766E0
	ldr r0, [r0]
	adds r0, #0x21
	ldr r1, [sp, #0x20]
	ldrb r0, [r0]
	cmp r1, r0
	bgt _08060CF6
_08060CDC:
	movs r0, #0x64
	mov r1, sb
	muls r1, r0, r1
	adds r0, r1, #0
	adds r1, r2, #0
	bl __udivsi3
	ldr r1, _08060D14 @ =gUnknown_085766E0
	ldr r1, [r1]
	adds r1, #0x23
	ldrb r1, [r1]
	cmp r0, r1
	bls _08060D1C
_08060CF6:
	ldr r1, _08060D18 @ =gUnknown_02029C20
	mov r2, sl
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r1, #0
	strh r1, [r0]
	b _08060AFA
	.align 2, 0
_08060D08: .4byte gUnknown_030033EC
_08060D0C: .4byte gUnknown_08499598
_08060D10: .4byte gUnknown_085D5ABC
_08060D14: .4byte gUnknown_085766E0
_08060D18: .4byte gUnknown_02029C20
_08060D1C:
	ldr r0, _08060D24 @ =gUnknown_030046C0
	strb r6, [r0, #6]
	b _08060D3C
	.align 2, 0
_08060D24: .4byte gUnknown_030046C0
_08060D28:
	ldr r0, _08060D38 @ =gUnknown_02029C20
	mov r2, sl
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r6, [r1]
	b _08060AFA
	.align 2, 0
_08060D38: .4byte gUnknown_02029C20
_08060D3C:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

