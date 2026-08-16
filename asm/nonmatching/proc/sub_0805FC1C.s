	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805FC1C
sub_0805FC1C: @ 0x0805FC1C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r1
	ldr r0, _0805FCCC @ =gUnknown_0816DAC0
	ldr r1, [r0]
	ldrh r7, [r1]
	adds r1, r7, #0
	adds r1, #0x40
	cmp r7, r1
	blt _0805FC3A
	b _0805FD52
_0805FC3A:
	ldr r0, _0805FCD0 @ =gUnknown_085D5AD0
	mov sl, r0
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #2
	mov r8, r0
_0805FC46:
	ldr r1, _0805FCD4 @ =gUnknown_08499594
	ldr r0, [r1]
	mov r2, r8
	adds r3, r0, r2
	ldrb r0, [r3]
	cmp r0, #0
	beq _0805FD30
	ldrb r1, [r3, #1]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0805FD30
	ldrb r2, [r3, #3]
	lsls r0, r2, #2
	ldr r6, _0805FCD8 @ =gUnknown_03003340
	adds r0, r0, r6
	ldrb r1, [r3, #2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov ip, r1
	cmp r0, #0
	blt _0805FD30
	ldrb r4, [r3]
	movs r0, #0x5c
	muls r0, r4, r0
	add r0, sl
	ldr r5, [r0]
	ldr r0, _0805FCDC @ =gUnknown_030040D8
	ldr r0, [r0]
	str r0, [sp]
	adds r0, r5, #1
	ldr r1, [sp]
	ldrb r1, [r1]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805FD30
	ldr r0, _0805FCE0 @ =gUnknown_08499590
	ldr r1, [r0]
	lsls r2, r2, #1
	ldr r6, _0805FCE4 @ =0x0000417A
	adds r0, r1, r6
	adds r0, r0, r2
	ldrh r0, [r0]
	add r0, ip
	ldr r2, _0805FCE8 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r1, #0x1f
	ands r1, r0
	adds r0, r5, #0
	adds r0, #0x1a
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805FD30
	cmp r4, #0x14
	beq _0805FCF2
	cmp r4, #0x14
	bgt _0805FCEC
	cmp r4, #7
	beq _0805FCF2
	b _0805FD30
	.align 2, 0
_0805FCCC: .4byte gUnknown_0816DAC0
_0805FCD0: .4byte gUnknown_085D5AD0
_0805FCD4: .4byte gUnknown_08499594
_0805FCD8: .4byte gUnknown_03003340
_0805FCDC: .4byte gUnknown_030040D8
_0805FCE0: .4byte gUnknown_08499590
_0805FCE4: .4byte 0x0000417A
_0805FCE8: .4byte 0x00001432
_0805FCEC:
	cmp r4, #0x17
	beq _0805FD0A
	b _0805FD30
_0805FCF2:
	ldrb r1, [r3, #9]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _0805FD02
	ldrb r0, [r3, #7]
	cmp r0, #0
	beq _0805FD48
_0805FD02:
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	b _0805FD2C
_0805FD0A:
	ldr r6, [sp]
	ldrb r1, [r6, #9]
	movs r0, #0x38
	ands r0, r1
	cmp r0, #0x18
	bne _0805FD30
	ldrb r1, [r3, #9]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0x80
	beq _0805FD26
	ldrb r0, [r3, #8]
	cmp r0, #0
	beq _0805FD48
_0805FD26:
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x80
_0805FD2C:
	orrs r0, r1
	strb r0, [r3, #9]
_0805FD30:
	movs r0, #0xc
	add r8, r0
	adds r7, #1
	ldr r0, _0805FD44 @ =gUnknown_03003F2C
	ldrh r0, [r0]
	adds r0, #0x40
	cmp r7, r0
	blt _0805FC46
	b _0805FD52
	.align 2, 0
_0805FD44: .4byte gUnknown_03003F2C
_0805FD48:
	mov r2, ip
	mov r1, sb
	strh r2, [r1]
	ldrb r0, [r3, #3]
	strh r0, [r1, #2]
_0805FD52:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

