	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804DB14
sub_0804DB14: @ 0x0804DB14
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0804DC28 @ =gUnknown_0300453C
	strh r5, [r0]
	ldr r2, _0804DC2C @ =gUnknown_0300451C
	ldr r1, _0804DC30 @ =gUnknown_08552148
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldr r0, _0804DC34 @ =gUnknown_03004580
	lsls r1, r5, #4
	adds r2, r1, r0
	ldrh r7, [r2]
	adds r0, #8
	adds r1, r1, r0
	ldrh r1, [r1]
	str r1, [sp, #4]
	adds r0, r5, #0
	bl sub_0804C400
	lsls r6, r5, #0xd
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r1, #0
	adds r6, r6, r0
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	ldr r2, _0804DC38 @ =gUnknown_08552178
	mov sl, r2
	lsls r0, r5, #2
	str r0, [sp, #8]
	adds r5, r0, r5
	lsls r5, r5, #1
	mov r0, sl
	adds r0, #4
	adds r0, r5, r0
	ldrh r0, [r0]
	lsls r4, r0, #3
	subs r4, r4, r0
	ldr r0, _0804DC3C @ =gUnknown_08553444
	ldr r1, _0804DC40 @ =gUnknown_08557B58
	mov sb, r1
	lsls r2, r7, #1
	mov r8, r2
	add r8, r7
	mov r1, r8
	lsls r1, r1, #2
	mov r8, r1
	mov r1, sb
	adds r1, #8
	add r1, r8
	ldr r2, [r1]
	mov r1, sb
	adds r1, #4
	add r1, r8
	ldr r3, [r1]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp]
	movs r1, #1
	bl sub_08015410
	ldr r7, _0804DC44 @ =gUnknown_02029668
	adds r1, r7, #4
	adds r1, r5, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1]
	ldr r0, _0804DC48 @ =gUnknown_08562128
	ldr r2, [sp, #4]
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sb
	ldr r0, [r0]
	ldr r1, _0804DC4C @ =0x06010000
	adds r6, r6, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r6, #0
	bl CpuFastSet
	ldr r6, _0804DC50 @ =gUnknown_08557B94
	mov r1, r8
	adds r0, r1, r6
	ldr r0, [r0]
	ldr r1, _0804DC54 @ =gUnknown_08552FB0
	ldr r2, [sp, #8]
	adds r1, r2, r1
	ldr r1, [r1]
	bl Decompress
	movs r0, #8
	add sl, r0
	add sl, r5
	mov r1, sl
	ldrh r0, [r1]
	lsls r4, r0, #3
	subs r4, r4, r0
	ldr r0, _0804DC58 @ =gUnknown_08553474
	adds r1, r6, #0
	adds r1, #8
	add r1, r8
	ldr r2, [r1]
	adds r6, #4
	add r8, r6
	mov r1, r8
	ldr r3, [r1]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp]
	movs r1, #1
	bl sub_08015410
	adds r1, r7, #0
	adds r1, #8
	adds r5, r5, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r5]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804DC28: .4byte gUnknown_0300453C
_0804DC2C: .4byte gUnknown_0300451C
_0804DC30: .4byte gUnknown_08552148
_0804DC34: .4byte gUnknown_03004580
_0804DC38: .4byte gUnknown_08552178
_0804DC3C: .4byte gUnknown_08553444
_0804DC40: .4byte gUnknown_08557B58
_0804DC44: .4byte gUnknown_02029668
_0804DC48: .4byte gUnknown_08562128
_0804DC4C: .4byte 0x06010000
_0804DC50: .4byte gUnknown_08557B94
_0804DC54: .4byte gUnknown_08552FB0
_0804DC58: .4byte gUnknown_08553474

