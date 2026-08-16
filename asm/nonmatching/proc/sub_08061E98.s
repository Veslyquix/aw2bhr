	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08061E98
sub_08061E98: @ 0x08061E98
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	mov r1, sp
	ldr r0, _08061F20 @ =gUnknown_0816DB10
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r1, _08061F24 @ =gUnknown_0816DB1C
	ldr r0, [r1]
	ldrh r4, [r0]
	adds r0, r4, #0
	adds r0, #0x40
	mov r8, r1
	cmp r4, r0
	bge _08061F12
	ldr r7, _08061F28 @ =gUnknown_03004784
	ldr r6, _08061F2C @ =gUnknown_085766E0
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r5, r0, #2
_08061EC2:
	ldr r0, _08061F30 @ =gUnknown_08499594
	ldr r0, [r0]
	adds r2, r0, r5
	ldrb r0, [r2]
	cmp r0, #0
	beq _08061F02
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, #4
	ldr r1, [r6]
	adds r1, r1, r0
	str r1, [r7]
	ldrb r1, [r2, #9]
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1d
	cmp r0, #2
	bls _08061EF2
	movs r3, #8
	rsbs r3, r3, #0
	adds r0, r3, #0
	ands r0, r1
	strb r0, [r2, #9]
_08061EF2:
	ldrb r0, [r2, #9]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1b
	add r0, sp
	ldr r1, [r0]
	adds r0, r2, #0
	bl _call_via_r1
_08061F02:
	adds r5, #0xc
	adds r4, #1
	mov r1, r8
	ldr r0, [r1]
	ldrh r0, [r0]
	adds r0, #0x40
	cmp r4, r0
	blt _08061EC2
_08061F12:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08061F20: .4byte gUnknown_0816DB10
_08061F24: .4byte gUnknown_0816DB1C
_08061F28: .4byte gUnknown_03004784
_08061F2C: .4byte gUnknown_085766E0
_08061F30: .4byte gUnknown_08499594

