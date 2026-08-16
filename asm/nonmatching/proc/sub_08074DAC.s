	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08074DAC
sub_08074DAC: @ 0x08074DAC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	mov r8, r0
	ldr r1, _08074EAC @ =gUnknown_0202FDFC
	ldrh r0, [r1]
	ldrh r2, [r1, #4]
	adds r0, r0, r2
	mov r3, r8
	strh r0, [r3, #0x2a]
	ldrh r0, [r1, #2]
	ldrh r4, [r1, #6]
	adds r0, r0, r4
	strh r0, [r3, #0x34]
	ldrh r7, [r1]
	str r7, [sp]
	ldrh r1, [r1, #2]
	str r1, [sp, #4]
	ldr r0, [r3, #0x58]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08074E6C
	movs r4, #4
	lsls r0, r7, #0x10
	str r0, [sp, #0xc]
	ldr r1, [sp, #4]
	lsls r1, r1, #0x10
	str r1, [sp, #0x10]
	adds r3, #0x34
	str r3, [sp, #0x14]
	mov r2, r8
	adds r2, #0x2a
	str r2, [sp, #8]
_08074DF6:
	lsls r3, r4, #1
	ldr r7, [sp, #8]
	adds r6, r7, r3
	subs r2, r4, #1
	lsls r5, r2, #1
	adds r0, r7, #0
	adds r0, r0, r5
	mov sb, r0
	movs r7, #0
	ldrsh r1, [r6, r7]
	mov ip, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	mov sl, r2
	cmp ip, r0
	bne _08074E2A
	ldr r2, [sp, #0x14]
	adds r0, r2, r3
	adds r1, r2, r5
	movs r2, #0
	ldrsh r7, [r0, r2]
	mov ip, r7
	movs r7, #0
	ldrsh r0, [r1, r7]
	cmp ip, r0
	beq _08074E66
_08074E2A:
	lsls r1, r4, #2
	mov r0, r8
	adds r0, #0x40
	adds r0, r0, r1
	ldr r0, [r0]
	movs r2, #0
	ldrsh r1, [r6, r2]
	ldr r4, [sp, #0xc]
	asrs r2, r4, #0x10
	subs r1, r1, r2
	ldr r2, _08074EB0 @ =0x000001FF
	ands r1, r2
	ldr r7, [sp, #0x14]
	adds r4, r7, r3
	movs r3, #0
	ldrsh r2, [r4, r3]
	ldr r7, [sp, #0x10]
	asrs r7, r7, #0x10
	subs r2, r2, r7
	movs r3, #0xff
	ands r2, r3
	bl sub_0801C254
	mov r1, sb
	ldrh r0, [r1]
	strh r0, [r6]
	ldr r2, [sp, #0x14]
	adds r0, r2, r5
	ldrh r0, [r0]
	strh r0, [r4]
_08074E66:
	mov r4, sl
	cmp r4, #0
	bgt _08074DF6
_08074E6C:
	mov r3, r8
	ldr r0, [r3, #0x40]
	movs r4, #0x2a
	ldrsh r1, [r3, r4]
	ldr r7, [sp]
	lsls r2, r7, #0x10
	asrs r2, r2, #0x10
	subs r1, r1, r2
	ldr r2, _08074EB0 @ =0x000001FF
	ands r1, r2
	movs r4, #0x34
	ldrsh r2, [r3, r4]
	ldr r7, [sp, #4]
	lsls r3, r7, #0x10
	asrs r3, r3, #0x10
	subs r2, r2, r3
	movs r3, #0xff
	ands r2, r3
	bl sub_0801C254
	mov r1, r8
	ldr r0, [r1, #0x58]
	adds r0, #1
	str r0, [r1, #0x58]
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074EAC: .4byte gUnknown_0202FDFC
_08074EB0: .4byte 0x000001FF

