	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802F588
sub_0802F588: @ 0x0802F588
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	lsls r1, r1, #0x10
	movs r0, #0
	mov sb, r0
	ldr r3, _0802F640 @ =gUnknown_08090C80
	ldr r0, [r3]
	ldrh r0, [r0]
	adds r5, r0, #0
	lsrs r6, r1, #0x11
	ldr r1, _0802F644 @ =0x00004FFF
	adds r7, r6, r1
	ldr r2, _0802F648 @ =gUnknown_08090C84
	ldr r0, [r2]
	mov ip, r0
	lsls r0, r5, #1
	add r0, ip
	ldrh r4, [r0]
	strh r1, [r0]
	adds r5, #1
	ldr r1, _0802F64C @ =0x000001FF
	mov r8, r1
	ands r5, r1
	ldr r0, _0802F650 @ =gUnknown_08090C88
	ldr r4, [r0]
	ldrh r1, [r4]
	cmp r5, r1
	beq _0802F63A
	lsls r0, r5, #1
	add r0, ip
	ldrh r1, [r0]
	strh r6, [r0]
	adds r5, #1
	mov r0, r8
	ands r5, r0
	ldrh r0, [r4]
	lsls r1, r5, #1
	mov ip, r1
	adds r1, r5, #1
	mov r8, r1
	cmp r5, r0
	beq _0802F63A
	movs r3, #0
	cmp r3, r6
	bge _0802F60C
	mov r4, sl
_0802F5EC:
	ldrh r0, [r4]
	adds r2, r3, #1
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r7, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	mvns r1, r1
	add r1, sb
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	adds r4, #2
	adds r3, r2, #0
	cmp r3, r6
	blt _0802F5EC
_0802F60C:
	ldr r2, _0802F654 @ =gUnknown_02025818
	mov r1, ip
	adds r0, r1, r2
	ldrh r1, [r0]
	strh r7, [r0]
	ldr r7, _0802F64C @ =0x000001FF
	adds r5, r7, #0
	mov r0, r8
	ands r5, r0
	ldr r4, _0802F658 @ =gUnknown_030040CC
	ldrh r0, [r4]
	cmp r5, r0
	beq _0802F63A
	lsls r0, r5, #1
	adds r0, r0, r2
	ldrh r1, [r0]
	mov r1, sb
	strh r1, [r0]
	adds r5, #1
	ands r5, r7
	ldrh r0, [r4]
	cmp r5, r0
	bne _0802F65C
_0802F63A:
	movs r0, #1
	rsbs r0, r0, #0
	b _0802F68E
	.align 2, 0
_0802F640: .4byte gUnknown_08090C80
_0802F644: .4byte 0x00004FFF
_0802F648: .4byte gUnknown_08090C84
_0802F64C: .4byte 0x000001FF
_0802F650: .4byte gUnknown_08090C88
_0802F654: .4byte gUnknown_02025818
_0802F658: .4byte gUnknown_030040CC
_0802F65C:
	movs r3, #0
	cmp r3, r6
	bge _0802F688
	mov sb, r2
	mov r8, r7
	adds r7, r4, #0
	mov r4, sl
_0802F66A:
	lsls r0, r5, #1
	add r0, sb
	ldrh r1, [r4]
	ldrh r2, [r0]
	strh r1, [r0]
	adds r5, #1
	mov r0, r8
	ands r5, r0
	ldrh r0, [r7]
	cmp r5, r0
	beq _0802F63A
	adds r4, #2
	adds r3, #1
	cmp r3, r6
	blt _0802F66A
_0802F688:
	ldr r0, _0802F69C @ =gUnknown_0300410C
	strh r5, [r0]
	adds r0, r6, #0
_0802F68E:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802F69C: .4byte gUnknown_0300410C

