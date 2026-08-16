	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801D390
sub_0801D390: @ 0x0801D390
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp, #0x14]
	mov sl, r1
	ldr r0, _0801D3EC @ =gUnknown_03003040
	mov r1, sp
	ldrh r1, [r1, #0x14]
	strh r1, [r0]
	ldr r1, _0801D3F0 @ =gUnknown_0200E438
	movs r0, #0x4c
	ldr r2, [sp, #0x14]
	muls r0, r2, r0
	adds r0, r0, r1
	mov r8, r0
	ldr r7, [r0, #8]
	cmp r7, #0
	bne _0801D3BC
	b _0801D6D8
_0801D3BC:
	movs r3, #0x28
	add r3, r8
	mov sb, r3
_0801D3C2:
	ldrh r1, [r7]
	ldr r4, _0801D3F4 @ =0xFFFFF000
	adds r0, r4, #0
	adds r2, r0, #0
	ands r2, r1
	movs r0, #0xa0
	lsls r0, r0, #7
	cmp r2, r0
	bne _0801D3D6
	b _0801D4FA
_0801D3D6:
	cmp r2, r0
	bgt _0801D402
	movs r0, #0x80
	lsls r0, r0, #5
	cmp r2, r0
	beq _0801D488
	cmp r2, r0
	bgt _0801D3F8
	cmp r2, #0
	beq _0801D432
	b _0801D6CC
	.align 2, 0
_0801D3EC: .4byte gUnknown_03003040
_0801D3F0: .4byte gUnknown_0200E438
_0801D3F4: .4byte 0xFFFFF000
_0801D3F8:
	movs r0, #0x80
	lsls r0, r0, #6
	cmp r2, r0
	beq _0801D474
	b _0801D6CC
_0801D402:
	movs r0, #0xd0
	lsls r0, r0, #8
	cmp r2, r0
	bne _0801D40C
	b _0801D60C
_0801D40C:
	cmp r2, r0
	bgt _0801D41C
	movs r0, #0xc0
	lsls r0, r0, #7
	cmp r2, r0
	bne _0801D41A
	b _0801D556
_0801D41A:
	b _0801D6CC
_0801D41C:
	movs r0, #0xe0
	lsls r0, r0, #8
	cmp r2, r0
	bne _0801D426
	b _0801D5FA
_0801D426:
	movs r0, #0xf0
	lsls r0, r0, #8
	cmp r2, r0
	bne _0801D430
	b _0801D61C
_0801D430:
	b _0801D6CC
_0801D432:
	mov r6, sl
	cmp r6, #0
	bne _0801D43A
	b _0801D6D8
_0801D43A:
	mov r0, r8
	ldrh r2, [r0, #0x1c]
	movs r3, #0x1c
	ldrsh r0, [r0, r3]
	cmp r0, #0
	beq _0801D44E
	subs r0, r2, #1
	mov r4, r8
	strh r0, [r4, #0x1c]
	b _0801D458
_0801D44E:
	ldr r0, _0801D470 @ =0x00000FFF
	ands r0, r1
	subs r0, #1
	mov r6, r8
	strh r0, [r6, #0x1c]
_0801D458:
	mov r0, r8
	movs r2, #0x1c
	ldrsh r1, [r0, r2]
	cmp r1, #0
	beq _0801D464
	b _0801D6D8
_0801D464:
	adds r0, r7, #2
	mov r3, r8
	str r0, [r3, #8]
	strh r1, [r3, #2]
	b _0801D6D8
	.align 2, 0
_0801D470: .4byte 0x00000FFF
_0801D474:
	ldr r4, _0801D484 @ =0x00000FFF
	ands r1, r4
	mov r6, r8
	ldr r7, [r6, #4]
	lsls r0, r1, #1
	adds r7, r7, r0
	b _0801D6CC
	.align 2, 0
_0801D484: .4byte 0x00000FFF
_0801D488:
	movs r0, #0xff
	ands r0, r1
	mov r1, r8
	strh r0, [r1, #0x24]
	adds r7, #2
	mov r2, sl
	cmp r2, #0
	beq _0801D49A
	b _0801D6CC
_0801D49A:
	ldr r3, [r1, #0x20]
	ldrh r0, [r1, #0x24]
	lsls r0, r0, #2
	adds r3, r3, r0
	mov r0, r8
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	cmp r0, #0
	bge _0801D4B0
	b _0801D6CC
_0801D4B0:
	ldrh r5, [r1, #0x26]
	ldr r1, [r1, #0x14]
	mov r4, r8
	ldr r0, [r4, #0xc]
	adds r1, r1, r0
	cmp r1, #0
	bge _0801D4C0
	adds r1, #0xff
_0801D4C0:
	asrs r4, r1, #8
	mov r6, r8
	ldr r1, [r6, #0x18]
	ldr r0, [r6, #0x10]
	adds r1, r1, r0
	cmp r1, #0
	bge _0801D4D0
	adds r1, #0xff
_0801D4D0:
	asrs r2, r1, #8
	ldr r3, [r3]
	mov r1, r8
	ldrb r0, [r1, #0x1e]
	str r0, [sp]
	mov r6, sb
	ldrb r0, [r6]
	str r0, [sp, #4]
	ldr r0, [r1, #0x30]
	ldr r1, [r1, #0x34]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	mov r1, r8
	movs r6, #0x38
	ldrsh r0, [r1, r6]
	str r0, [sp, #0x10]
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0801D348
	b _0801D6CC
_0801D4FA:
	ldr r0, _0801D52C @ =0x00000FFF
	ands r1, r0
	adds r7, #2
	cmp r1, #0
	beq _0801D530
	mov r3, r8
	ldrh r2, [r3, #2]
	movs r3, #8
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _0801D514
	b _0801D614
_0801D514:
	adds r0, r2, #0
	orrs r0, r3
	mov r4, r8
	strh r0, [r4, #2]
	mov r6, sb
	ldrb r0, [r6]
	movs r3, #0
	ldrsh r2, [r7, r3]
	adds r7, #2
	bl sub_0801E294
	b _0801D6CC
	.align 2, 0
_0801D52C: .4byte 0x00000FFF
_0801D530:
	mov r4, r8
	ldrh r1, [r4, #2]
	movs r2, #4
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0801D614
	adds r0, r1, #0
	orrs r0, r2
	mov r6, r8
	strh r0, [r6, #2]
	mov r1, sb
	ldrb r0, [r1]
	movs r2, #0
	ldrsh r1, [r7, r2]
	adds r7, #2
	bl sub_0801E264
	b _0801D6CC
_0801D556:
	ldr r3, _0801D5B0 @ =0x00000FFF
	ands r1, r3
	adds r7, #2
	movs r6, #0
	ldrsh r4, [r7, r6]
	adds r7, #2
	cmp r1, #0
	beq _0801D5B4
	mov r0, r8
	ldrh r2, [r0, #2]
	movs r3, #0x20
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	bne _0801D614
	adds r0, r2, #0
	orrs r0, r3
	mov r2, r8
	strh r0, [r2, #2]
	mov r3, sb
	ldrb r5, [r3]
	adds r6, r1, #0
	lsls r0, r4, #8
	movs r1, #0x64
	bl __divsi3
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r1, #0
	ldrsh r0, [r7, r1]
	lsls r0, r0, #8
	movs r1, #0x64
	bl __divsi3
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r7, #2
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_0801E27C
	b _0801D6CC
	.align 2, 0
_0801D5B0: .4byte 0x00000FFF
_0801D5B4:
	mov r2, r8
	ldrh r1, [r2, #2]
	movs r2, #0x10
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0801D614
	adds r0, r1, #0
	orrs r0, r2
	mov r3, r8
	strh r0, [r3, #2]
	mov r6, sb
	ldrb r5, [r6]
	lsls r0, r4, #8
	movs r1, #0x64
	bl __divsi3
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r1, #0
	ldrsh r0, [r7, r1]
	lsls r0, r0, #8
	movs r1, #0x64
	bl __divsi3
	adds r2, r0, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r7, #2
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0801E248
	b _0801D6CC
_0801D5FA:
	ldr r0, _0801D608 @ =0x00000FFF
	ands r0, r1
	mov r2, r8
	str r0, [r2, #0x2c]
	adds r7, #2
	str r7, [r2, #8]
	b _0801D6CC
	.align 2, 0
_0801D608: .4byte 0x00000FFF
_0801D60C:
	ldr r0, _0801D618 @ =0x00000FFF
	ands r0, r1
	mov r3, r8
	strh r0, [r3, #0x26]
_0801D614:
	adds r7, #2
	b _0801D6CC
	.align 2, 0
_0801D618: .4byte 0x00000FFF
_0801D61C:
	movs r3, #0xf0
	lsls r3, r3, #4
	adds r2, r3, #0
	ands r2, r1
	movs r0, #0xa0
	lsls r0, r0, #4
	cmp r2, r0
	beq _0801D6BA
	cmp r2, r0
	bgt _0801D63A
	movs r0, #0x90
	lsls r0, r0, #4
	cmp r2, r0
	beq _0801D6C0
	b _0801D6CC
_0801D63A:
	movs r0, #0xe0
	lsls r0, r0, #4
	cmp r2, r0
	beq _0801D6AC
	cmp r2, r3
	bne _0801D6CC
	mov r4, r8
	str r7, [r4, #8]
	mov r6, sl
	cmp r6, #0
	bne _0801D6D8
	ldr r3, [r4, #0x20]
	ldrh r0, [r4, #0x24]
	lsls r0, r0, #2
	adds r3, r3, r0
	mov r0, r8
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	cmp r0, #0
	blt _0801D6D8
	ldrh r5, [r4, #0x26]
	ldr r1, [r4, #0x14]
	ldr r0, [r4, #0xc]
	adds r1, r1, r0
	cmp r1, #0
	bge _0801D672
	adds r1, #0xff
_0801D672:
	asrs r4, r1, #8
	mov r0, r8
	ldr r1, [r0, #0x18]
	ldr r0, [r0, #0x10]
	adds r1, r1, r0
	cmp r1, #0
	bge _0801D682
	adds r1, #0xff
_0801D682:
	asrs r2, r1, #8
	ldr r3, [r3]
	mov r1, r8
	ldrb r0, [r1, #0x1e]
	str r0, [sp]
	mov r6, sb
	ldrb r0, [r6]
	str r0, [sp, #4]
	ldr r0, [r1, #0x30]
	ldr r1, [r1, #0x34]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	mov r1, r8
	movs r6, #0x38
	ldrsh r0, [r1, r6]
	str r0, [sp, #0x10]
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0801D348
	b _0801D6D8
_0801D6AC:
	mov r0, sl
	cmp r0, #0
	beq _0801D6D8
	ldr r0, [sp, #0x14]
	bl sub_0801D81C
	b _0801D6D8
_0801D6BA:
	mov r2, r8
	strb r1, [r2, #0x1e]
	b _0801D614
_0801D6C0:
	mov r3, r8
	str r7, [r3, #8]
	adds r7, #2
	ldr r0, [r3, #8]
	adds r0, #2
	str r0, [r3, #8]
_0801D6CC:
	movs r4, #0
	cmp r4, #0
	bne _0801D6D8
	cmp r7, #0
	beq _0801D6D8
	b _0801D3C2
_0801D6D8:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

