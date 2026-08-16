	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08047C04
sub_08047C04: @ 0x08047C04
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sl, r0
	movs r1, #0
	movs r0, #0
	mov r2, sl
	strh r0, [r2, #0x28]
	mov r0, sl
	adds r0, #0x22
	strb r1, [r0]
	strb r1, [r2, #0x1e]
	strb r1, [r2, #0x1f]
	subs r0, #2
	strb r1, [r0]
	ldr r0, _08047E34 @ =gUnknown_0823E140
	ldr r4, _08047E38 @ =gUnknown_0200FC50
	adds r1, r4, #0
	bl sub_08011CAC
	ldr r0, _08047E3C @ =0x06013A40
	mov r8, r0
	movs r1, #0xa0
	lsls r1, r1, #3
	adds r7, r4, r1
	ldr r5, _08047E40 @ =0x060139C0
	movs r2, #0x80
	lsls r2, r2, #1
	adds r4, r4, r2
	movs r6, #1
_08047C46:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x20
	bl CpuFastSet
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x20
	bl CpuFastSet
	movs r0, #0x80
	lsls r0, r0, #1
	add r8, r0
	adds r7, #0x80
	adds r5, r5, r0
	adds r4, #0x80
	subs r6, #1
	cmp r6, #0
	bge _08047C46
	ldr r4, _08047E44 @ =gUnknown_0200FE50
	ldr r1, _08047E48 @ =0x06013BC0
	adds r0, r4, #0
	movs r2, #0x10
	bl CpuFastSet
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r4, r1
	ldr r1, _08047E4C @ =0x06013C00
	movs r2, #0x10
	bl CpuFastSet
	adds r0, r4, #0
	adds r0, #0x40
	ldr r1, _08047E50 @ =0x06013C40
	movs r2, #0x20
	bl CpuFastSet
	movs r2, #0x88
	lsls r2, r2, #3
	adds r0, r4, r2
	ldr r1, _08047E54 @ =0x06013CC0
	movs r2, #0x20
	bl CpuFastSet
	mov r0, sl
	adds r0, #0x20
	str r0, [sp, #8]
	mov r1, sl
	adds r1, #0x21
	str r1, [sp, #0xc]
	ldr r2, _08047E58 @ =0x06013DC0
	mov r8, r2
	movs r0, #0x98
	lsls r0, r0, #3
	adds r5, r4, r0
	ldr r7, _08047E5C @ =0x06013D40
	adds r4, #0xc0
	movs r6, #1
_08047CBC:
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0x20
	bl CpuFastSet
	adds r0, r5, #0
	mov r1, r8
	movs r2, #0x20
	bl CpuFastSet
	movs r1, #0x80
	lsls r1, r1, #1
	add r8, r1
	adds r5, #0x80
	adds r7, r7, r1
	adds r4, #0x80
	subs r6, #1
	cmp r6, #0
	bge _08047CBC
	ldr r4, _08047E60 @ =gUnknown_02010450
	ldr r1, _08047E64 @ =0x06013F40
	adds r0, r4, #0
	movs r2, #0x20
	bl CpuFastSet
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r4, r2
	ldr r1, _08047E68 @ =0x06013FC0
	movs r2, #0x20
	bl CpuFastSet
	adds r0, r4, #0
	adds r0, #0x80
	ldr r1, _08047E6C @ =0x06014040
	movs r2, #8
	bl CpuFastSet
	movs r1, #0x90
	lsls r1, r1, #3
	adds r0, r4, r1
	ldr r1, _08047E70 @ =0x06014060
	movs r2, #8
	bl CpuFastSet
	ldr r0, _08047E74 @ =gUnknown_0823E550
	movs r1, #0xa8
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_08013618
	ldr r0, _08047E78 @ =gUnknown_0823FFA8
	ldr r2, _08047E7C @ =0xFFFFF800
	adds r4, r4, r2
	adds r1, r4, #0
	bl sub_08011CAC
	ldr r1, _08047E80 @ =0x06014100
	adds r0, r4, #0
	movs r2, #0x10
	bl CpuFastSet
	bl sub_0801F114
	ldr r4, _08047E84 @ =0x06010000
	ldr r2, _08047E88 @ =0x0000020A
	movs r0, #0
	adds r1, r4, #0
	movs r3, #0x16
	bl sub_0801F150
	movs r0, #1
	bl sub_0801F234
	movs r2, #0x81
	lsls r2, r2, #2
	movs r0, #1
	adds r1, r4, #0
	movs r3, #0x14
	bl sub_0801F150
	ldr r0, _08047E8C @ =gUnknown_030033EC
	mov sb, r0
	ldrh r1, [r0]
	ldr r2, _08047E90 @ =gUnknown_08499598
	mov r8, r2
	ldr r2, [r2]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1a]
	adds r0, #0x3d
	bl sub_0801F234
	ldr r0, _08047E94 @ =gUnknown_0812A2AC
	ldr r1, _08047E98 @ =0x06013940
	movs r2, #0x80
	bl sub_08011C68
	movs r0, #0
	bl sub_0801B780
	bl sub_08013C00
	bl sub_08013CA8
	ldr r0, _08047E9C @ =gUnknown_08499580
	ldr r0, [r0]
	ldr r3, _08047EA0 @ =gUnknown_0812A8C8
	ldr r1, _08047EA4 @ =0x00008360
	str r1, [sp]
	movs r1, #1
	movs r2, #0
	bl sub_08071948
	mov r0, sl
	ldrb r1, [r0, #0x1e]
	bl sub_08047190
	ldr r6, _08047EA8 @ =gUnknown_08499578
	ldr r2, [r6]
	ldr r5, _08047EAC @ =gUnknown_08610A38
	ldr r4, _08047EB0 @ =gUnknown_0849F658
	mov r0, sb
	ldrh r1, [r0]
	mov r0, r8
	ldr r3, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #0x1a]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r3, [r0]
	movs r5, #0x80
	lsls r5, r5, #8
	str r5, [sp]
	movs r4, #0
	str r4, [sp, #4]
	movs r0, #4
	movs r1, #1
	bl sub_080149C0
	ldr r2, [r6]
	ldr r3, _08047EB4 @ =0x0000096F
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #8
	movs r1, #5
	bl sub_08014A5C
	ldr r2, [r6]
	movs r3, #0x97
	lsls r3, r3, #4
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #0xf
	movs r1, #5
	bl sub_08014A5C
	ldr r2, [r6]
	ldr r3, _08047EB8 @ =0x00000971
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #0x12
	movs r1, #5
	bl sub_08014A5C
	ldr r2, [r6]
	ldr r3, _08047EBC @ =0x00000972
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #0x18
	movs r1, #5
	bl sub_08014A5C
	ldr r1, [sp, #0xc]
	ldrb r0, [r1]
	cmp r0, #0
	bne _08047EC0
	adds r3, r0, #0
	b _08047EC6
	.align 2, 0
_08047E34: .4byte gUnknown_0823E140
_08047E38: .4byte gUnknown_0200FC50
_08047E3C: .4byte 0x06013A40
_08047E40: .4byte 0x060139C0
_08047E44: .4byte gUnknown_0200FE50
_08047E48: .4byte 0x06013BC0
_08047E4C: .4byte 0x06013C00
_08047E50: .4byte 0x06013C40
_08047E54: .4byte 0x06013CC0
_08047E58: .4byte 0x06013DC0
_08047E5C: .4byte 0x06013D40
_08047E60: .4byte gUnknown_02010450
_08047E64: .4byte 0x06013F40
_08047E68: .4byte 0x06013FC0
_08047E6C: .4byte 0x06014040
_08047E70: .4byte 0x06014060
_08047E74: .4byte gUnknown_0823E550
_08047E78: .4byte gUnknown_0823FFA8
_08047E7C: .4byte 0xFFFFF800
_08047E80: .4byte 0x06014100
_08047E84: .4byte 0x06010000
_08047E88: .4byte 0x0000020A
_08047E8C: .4byte gUnknown_030033EC
_08047E90: .4byte gUnknown_08499598
_08047E94: .4byte gUnknown_0812A2AC
_08047E98: .4byte 0x06013940
_08047E9C: .4byte gUnknown_08499580
_08047EA0: .4byte gUnknown_0812A8C8
_08047EA4: .4byte 0x00008360
_08047EA8: .4byte gUnknown_08499578
_08047EAC: .4byte gUnknown_08610A38
_08047EB0: .4byte gUnknown_0849F658
_08047EB4: .4byte 0x0000096F
_08047EB8: .4byte 0x00000971
_08047EBC: .4byte 0x00000972
_08047EC0:
	mov r2, sl
	ldrb r0, [r2, #0x1f]
	adds r3, r0, #1
_08047EC6:
	ldr r6, _08047F3C @ =gUnknown_08499578
	ldr r2, [r6]
	movs r5, #0x80
	lsls r5, r5, #8
	str r5, [sp]
	movs r4, #0
	str r4, [sp, #4]
	movs r0, #0x18
	movs r1, #1
	bl sub_08014B0C
	ldr r2, [r6]
	ldr r3, _08047F40 @ =gUnknown_084C3F38
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #0x19
	movs r1, #1
	bl sub_080149C0
	ldr r2, [r6]
	ldr r0, [sp, #0xc]
	ldrb r3, [r0]
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #0x1b
	movs r1, #1
	bl sub_08014B0C
	mov r0, sl
	bl sub_08047920
	bl sub_08013AEC
	bl sub_08013B0C
	bl sub_08022A34
	mov r2, sl
	ldrb r1, [r2, #0x1f]
	ldr r2, [sp, #8]
	ldrb r0, [r2]
	subs r1, r1, r0
	lsls r1, r1, #0x14
	movs r0, #0xd8
	lsls r0, r0, #0xe
	adds r1, r1, r0
	asrs r1, r1, #0x10
	movs r0, #0x1e
	bl sub_08022AD0
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047F3C: .4byte gUnknown_08499578
_08047F40: .4byte gUnknown_084C3F38

