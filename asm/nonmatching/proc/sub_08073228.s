	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08073228
sub_08073228: @ 0x08073228
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp]
	str r1, [sp, #4]
	str r3, [sp, #8]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r1, #0
	movs r5, #0
	movs r0, #4
	str r0, [sp, #0xc]
	ldr r3, [sp]
	ldrb r0, [r3]
	cmp r0, #0
	beq _080732DE
	lsls r2, r2, #5
	str r2, [sp, #0x14]
	ldr r7, [sp, #8]
	adds r7, #0x2a
	str r7, [sp, #0x10]
	ldr r0, [sp, #8]
	adds r0, #0x46
	str r0, [sp, #0x18]
_0807325E:
	ldr r2, [sp]
	adds r0, r2, r5
	lsls r6, r5, #8
	lsls r3, r5, #1
	str r3, [sp, #0x1c]
	lsls r7, r5, #4
	mov r8, r7
	ldr r2, [sp, #0xc]
	lsls r2, r2, #0x10
	mov sb, r2
	adds r3, r5, #1
	mov sl, r3
	ldrb r3, [r0]
	lsls r4, r1, #3
	ldr r7, _08073290 @ =gUnknown_08614024
	adds r2, r4, r7
_0807327E:
	adds r0, r4, #0
	ldrb r7, [r2]
	cmp r3, r7
	beq _08073294
	adds r4, #8
	adds r2, #8
	adds r1, #1
	b _0807327E
	.align 2, 0
_08073290: .4byte gUnknown_08614024
_08073294:
	lsls r0, r1, #8
	ldr r1, [sp, #4]
	adds r0, r1, r0
	ldr r2, _080732FC @ =0x06010000
	adds r1, r6, r2
	ldr r3, [sp, #0x14]
	adds r1, r3, r1
	movs r2, #0x40
	bl CpuFastSet
	ldr r7, [sp, #0x10]
	ldr r0, [sp, #0x1c]
	adds r1, r7, r0
	mov r0, r8
	adds r0, #4
	strh r0, [r1]
	ldr r1, [sp, #0x18]
	adds r0, r1, r5
	mov r2, sp
	ldrb r2, [r2, #0xc]
	strb r2, [r0]
	ldr r3, _08073300 @ =gUnknown_08614028
	adds r0, r4, r3
	ldr r1, [r0]
	mov r7, sb
	asrs r0, r7, #0x10
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	mov r5, sl
	movs r1, #0
	ldr r2, [sp]
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807325E
_080732DE:
	ldr r3, [sp, #8]
	str r5, [r3, #0x58]
	lsls r0, r5, #2
	adds r0, #0x14
	adds r1, r3, #0
	adds r1, #0x60
	strh r0, [r1]
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080732FC: .4byte 0x06010000
_08073300: .4byte gUnknown_08614028

