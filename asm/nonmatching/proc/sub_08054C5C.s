	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08054C5C
sub_08054C5C: @ 0x08054C5C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	ldr r0, _08054E60 @ =gUnknown_0300450C
	ldrh r0, [r0]
	mov sl, r0
	movs r6, #0
	mov r0, sp
	adds r0, #8
	str r0, [sp, #0x24]
	mov r1, sp
	adds r1, #0x14
	str r1, [sp, #0x30]
	add r2, sp, #0x10
	mov r8, r2
	mov r3, sp
	adds r3, #0xc
	str r3, [sp, #0x2c]
	mov r4, sp
	adds r4, #6
	str r4, [sp, #0x20]
	mov r7, sp
	adds r7, #0xa
	str r7, [sp, #0x28]
	ldr r7, _08054E64 @ =gUnknown_03004580
	ldr r0, _08054E68 @ =gUnknown_085D6A48
	mov sb, r0
	ldr r1, [sp, #0x24]
	mov ip, r1
_08054C9C:
	lsls r3, r6, #1
	mov r2, ip
	adds r5, r2, r3
	lsls r2, r6, #4
	adds r0, r7, #4
	adds r0, r2, r0
	ldrh r0, [r0]
	strh r0, [r5]
	ldr r4, [sp, #0x30]
	adds r1, r4, r3
	adds r0, r2, r7
	ldrh r0, [r0]
	strh r0, [r1]
	mov r4, sp
	adds r4, r4, r3
	adds r4, #4
	ldr r0, _08054E6C @ =gUnknown_03004582
	adds r2, r2, r0
	ldrh r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	add r0, sb
	ldrh r0, [r0]
	strh r0, [r4]
	mov r4, r8
	adds r1, r4, r3
	movs r0, #0x6c
	muls r0, r6, r0
	ldr r4, _08054E70 @ =gUnknown_02029808
	adds r0, r0, r4
	ldrh r0, [r0, #0x30]
	strh r0, [r1]
	ldr r0, [sp, #0x2c]
	adds r3, r0, r3
	ldrh r1, [r5]
	lsls r1, r1, #1
	ldrh r2, [r2]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r1, r1, r0
	ldr r2, _08054E74 @ =gUnknown_085D6A52
	adds r1, r1, r2
	ldrh r0, [r1]
	strh r0, [r3]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #1
	bls _08054C9C
	ldr r0, _08054E78 @ =gUnknown_08540F7C
	ldr r1, _08054E7C @ =0x05000300
	movs r2, #0x10
	bl CpuFastSet
	mov r3, sl
	lsls r4, r3, #1
	mov r5, sp
	adds r5, r5, r4
	adds r5, #4
	ldrh r0, [r5]
	ldr r7, [sp, #0x24]
	adds r6, r7, r4
	ldrh r1, [r6]
	ldr r2, [sp, #0x2c]
	adds r2, r2, r4
	str r2, [sp, #0x18]
	ldrh r2, [r2]
	movs r3, #1
	mov sb, sl
	mov r7, sb
	eors r7, r3
	mov sb, r7
	adds r3, r7, #0
	lsls r3, r3, #1
	str r3, [sp, #0x1c]
	add r3, r8
	ldrh r3, [r3]
	bl sub_08055058
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldrh r0, [r5]
	adds r1, r7, #0
	bl sub_08055374
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldrh r1, [r5]
	ldrh r2, [r6]
	mov r0, sl
	adds r3, r7, #0
	bl sub_0805521C
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldrh r1, [r5]
	ldr r0, [sp, #0x30]
	adds r4, r0, r4
	ldrh r2, [r4]
	ldrh r3, [r6]
	str r7, [sp]
	mov r0, sl
	bl sub_08055288
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldrh r1, [r5]
	ldrh r2, [r6]
	mov r0, sl
	adds r3, r7, #0
	bl sub_0805530C
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r2, _08054E80 @ =gUnknown_020296B0
	mov r3, sb
	lsls r1, r3, #2
	add r1, sb
	lsls r1, r1, #3
	adds r1, r1, r2
	mov r4, sl
	lsls r0, r4, #2
	add r0, sl
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r2, _08054E84 @ =gUnknown_020298E0
	lsls r1, r3, #3
	add r1, sb
	lsls r1, r1, #4
	adds r1, r1, r2
	lsls r0, r4, #3
	add r0, sl
	lsls r0, r0, #4
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r2, _08054E88 @ =gUnknown_02029710
	movs r0, #0x58
	mov r1, sb
	muls r1, r0, r1
	adds r1, r1, r2
	mov r3, sl
	muls r3, r0, r3
	adds r0, r3, #0
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r4, [sp, #0x18]
	ldrh r0, [r4]
	cmp r0, #2
	beq _08054E2C
	add r0, sp, #4
	ldrh r0, [r0]
	ldr r1, [sp, #0x20]
	ldrh r1, [r1]
	cmp r0, r1
	bne _08054DEC
	mov r1, sp
	adds r1, #0xe
	ldr r2, [sp, #0x2c]
	ldrh r0, [r2]
	ldrh r1, [r1]
	cmp r0, r1
	beq _08054E2C
_08054DEC:
	ldr r5, [sp, #0x1c]
	add r5, sp
	adds r5, #4
	ldrh r1, [r5]
	ldr r3, [sp, #0x24]
	ldr r0, [sp, #0x1c]
	adds r4, r3, r0
	ldrh r2, [r4]
	mov r0, sb
	adds r3, r7, #0
	bl sub_0805521C
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldrh r1, [r5]
	ldr r2, [sp, #0x30]
	ldr r3, [sp, #0x1c]
	adds r0, r2, r3
	ldrh r2, [r0]
	ldrh r3, [r4]
	str r7, [sp]
	mov r0, sb
	bl sub_08055288
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldrh r1, [r5]
	ldrh r2, [r4]
	mov r0, sb
	adds r3, r7, #0
	bl sub_0805530C
_08054E2C:
	add r0, sp, #4
	ldrh r1, [r0]
	ldr r4, [sp, #0x24]
	ldrh r2, [r4]
	movs r0, #0
	movs r3, #0
	bl sub_08054E8C
	adds r3, r0, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	ldr r7, [sp, #0x20]
	ldrh r1, [r7]
	ldr r0, [sp, #0x28]
	ldrh r2, [r0]
	movs r0, #1
	bl sub_08054E8C
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08054E60: .4byte gUnknown_0300450C
_08054E64: .4byte gUnknown_03004580
_08054E68: .4byte gUnknown_085D6A48
_08054E6C: .4byte gUnknown_03004582
_08054E70: .4byte gUnknown_02029808
_08054E74: .4byte gUnknown_085D6A52
_08054E78: .4byte gUnknown_08540F7C
_08054E7C: .4byte 0x05000300
_08054E80: .4byte gUnknown_020296B0
_08054E84: .4byte gUnknown_020298E0
_08054E88: .4byte gUnknown_02029710

