	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08019F90
sub_08019F90: @ 0x08019F90
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	adds r7, r0, #0
	ldr r0, [sp, #0x4c]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #4]
	lsls r3, r3, #0x10
	lsrs r5, r3, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	movs r0, #0
	mov sb, r0
	movs r1, #0x10
	str r1, [sp, #8]
	mov sl, r0
	ldr r0, _08019FD8 @ =gUnknown_0848A42C
	movs r1, #0
	bl sub_080152EC
	adds r4, r0, #0
	adds r0, #0x4c
	strb r5, [r0]
	cmp r5, #0
	beq _08019FDC
	cmp r5, #1
	beq _08019FE4
	b _08019FE8
	.align 2, 0
_08019FD8: .4byte gUnknown_0848A42C
_08019FDC:
	ldr r0, _08019FE0 @ =sub_08019D78
	b _08019FE6
	.align 2, 0
_08019FE0: .4byte sub_08019D78
_08019FE4:
	ldr r0, _0801A0F8 @ =sub_08019DA8
_08019FE6:
	str r0, [r4, #0xc]
_08019FE8:
	str r7, [r4, #0x20]
	movs r6, #0
	adds r5, r7, #0
	ldrb r0, [r5]
	adds r2, r4, #0
	adds r2, #0x40
	str r2, [sp, #0x18]
	adds r3, r4, #0
	adds r3, #0x41
	str r3, [sp, #0x1c]
	adds r1, r4, #0
	adds r1, #0x43
	str r1, [sp, #0x24]
	adds r2, #2
	str r2, [sp, #0x20]
	subs r3, #3
	str r3, [sp, #0x14]
	adds r7, r4, #0
	adds r7, #0x48
	adds r1, #7
	str r1, [sp, #0x28]
	ldr r2, [sp]
	adds r2, #1
	str r2, [sp, #0xc]
	ldr r3, [sp, #4]
	adds r3, #1
	str r3, [sp, #0x10]
	cmp r0, #0xff
	beq _0801A082
_0801A022:
	ldr r0, [r5, #4]
	bl _call_via_r0
	adds r1, r4, #0
	adds r1, #0x24
	adds r1, r1, r6
	strb r0, [r1]
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _0801A074
	mov r1, sb
	lsls r0, r1, #0x10
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r0, r2
	lsrs r0, r0, #0x10
	mov sb, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	adds r0, #0x31
	adds r0, r0, r1
	strb r6, [r0]
	ldr r1, _0801A0FC @ =gUnknown_08610A38
	ldrh r0, [r5, #0x1c]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_08014D20
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp sl, r0
	bhs _0801A06A
	mov sl, r0
_0801A06A:
	ldr r0, [sp, #8]
	adds r0, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
_0801A074:
	adds r6, #1
	lsls r0, r6, #5
	ldr r1, [r4, #0x20]
	adds r5, r1, r0
	ldrb r0, [r5]
	cmp r0, #0xff
	bne _0801A022
_0801A082:
	movs r0, #0
	ldr r3, [sp, #0x18]
	strb r6, [r3]
	mov r1, sb
	ldr r5, [sp, #0x1c]
	strb r1, [r5]
	mov r3, r8
	ldr r2, [sp, #0x24]
	strb r3, [r2]
	ldr r5, [sp, #0x20]
	strb r3, [r5]
	ldr r1, [sp, #0x14]
	strb r0, [r1]
	mov r2, sp
	ldrh r2, [r2]
	strh r2, [r7]
	mov r3, sp
	ldrh r5, [r3, #4]
	ldr r3, [sp, #0x28]
	strh r5, [r3]
	ldr r0, _0801A100 @ =gUnknown_0848A44C
	movs r1, #0
	bl sub_080152EC
	str r0, [r4, #0x44]
	ldr r2, [sp, #0xc]
	lsls r1, r2, #3
	strh r1, [r0, #0x24]
	ldr r3, [sp, #0x10]
	lsls r1, r3, #3
	strh r1, [r0, #0x26]
	mov r5, r8
	strh r5, [r0, #0x20]
	adds r0, r4, #0
	bl sub_08019C40
	movs r1, #0
	ldrsh r0, [r7, r1]
	ldr r2, [sp, #0x28]
	movs r3, #0
	ldrsh r1, [r2, r3]
	mov r2, sl
	adds r2, #2
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r5, [sp, #8]
	lsrs r3, r5, #3
	bl sub_0801A444
	adds r0, r4, #0
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801A0F8: .4byte sub_08019DA8
_0801A0FC: .4byte gUnknown_08610A38
_0801A100: .4byte gUnknown_0848A44C

