	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805A388
sub_0805A388: @ 0x0805A388
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r6, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r1, _0805A3C8 @ =gUnknown_08576841
	ldr r2, _0805A3CC @ =gUnknown_0816D98C
	ldr r0, [r2]
	ldr r0, [r0]
	ldrb r0, [r0]
	adds r1, r0, r1
	ldrb r1, [r1]
	str r1, [sp, #4]
	subs r0, #0x13
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0805A3BA
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp]
_0805A3BA:
	movs r2, #0
	mov sb, r2
	ldr r1, _0805A3D0 @ =gUnknown_0816D990
	ldr r0, [r1]
	ldr r0, [r0]
	mov sl, r1
	b _0805A4E6
	.align 2, 0
_0805A3C8: .4byte gUnknown_08576841
_0805A3CC: .4byte gUnknown_0816D98C
_0805A3D0: .4byte gUnknown_0816D990
_0805A3D4:
	movs r7, #0
	adds r2, r1, #0
	ldr r0, [r2]
	ldr r0, [r0]
	mov r3, sb
	adds r3, #1
	str r3, [sp, #8]
	ldrh r0, [r0]
	cmp r7, r0
	bge _0805A4DC
	ldr r1, _0805A468 @ =gUnknown_03003340
	mov r3, sb
	lsls r0, r3, #2
	adds r0, r0, r1
	mov r8, r0
_0805A3F2:
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r7
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _0805A4CE
	ldr r0, [r2]
	ldr r4, [r0]
	mov r2, sb
	lsls r1, r2, #1
	ldr r3, _0805A46C @ =0x0000417A
	adds r0, r4, r3
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r3, r0, r7
	adds r0, r4, #0
	adds r0, #0x12
	adds r5, r0, r3
	ldrb r2, [r5]
	cmp r2, #0
	beq _0805A494
	movs r0, #0xc0
	ldr r1, _0805A470 @ =gUnknown_03003F2C
	ands r0, r2
	ldrh r1, [r1]
	cmp r0, r1
	bne _0805A4CE
	ldr r2, _0805A474 @ =gUnknown_08499594
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r4, r1, r0
	ldr r0, [sp]
	cmp r0, #0
	bne _0805A486
	adds r0, r4, #0
	bl sub_08042084
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805A480
	ldr r1, _0805A478 @ =gUnknown_084995A8
	ldr r0, _0805A47C @ =gUnknown_030040D8
	ldr r0, [r0]
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805A480
	strb r7, [r6]
	mov r1, sb
	strb r1, [r6, #1]
	mov r2, r8
	ldr r0, [r2]
	b _0805A4C2
	.align 2, 0
_0805A468: .4byte gUnknown_03003340
_0805A46C: .4byte 0x0000417A
_0805A470: .4byte gUnknown_03003F2C
_0805A474: .4byte gUnknown_08499594
_0805A478: .4byte gUnknown_084995A8
_0805A47C: .4byte gUnknown_030040D8
_0805A480:
	ldr r3, [sp]
	cmp r3, #0
	beq _0805A4CE
_0805A486:
	ldrb r0, [r4]
	cmp r0, #0x16
	bne _0805A4CE
	ldrb r0, [r4, #7]
	cmp r0, #0
	bne _0805A4CE
	b _0805A4B8
_0805A494:
	ldr r1, _0805A504 @ =gUnknown_0857685A
	ldr r2, _0805A508 @ =0x00001432
	adds r0, r4, r2
	adds r0, r0, r3
	ldrb r2, [r0]
	movs r0, #0x1f
	ands r0, r2
	adds r0, r0, r1
	ldrb r0, [r0]
	ldr r3, [sp, #4]
	cmp r0, r3
	bne _0805A4CE
	movs r0, #0xe0
	ldr r1, _0805A50C @ =gUnknown_03004084
	ands r0, r2
	ldrh r1, [r1]
	cmp r0, r1
	bne _0805A4CE
_0805A4B8:
	strb r7, [r6]
	mov r0, sb
	strb r0, [r6, #1]
	mov r1, r8
	ldr r0, [r1]
_0805A4C2:
	adds r0, r0, r7
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r6, #2]
	adds r6, #4
_0805A4CE:
	adds r7, #1
	mov r2, sl
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r7, r0
	blt _0805A3F2
_0805A4DC:
	ldr r2, [sp, #8]
	mov sb, r2
	mov r1, sl
	ldr r0, [r1]
	ldr r0, [r0]
_0805A4E6:
	ldrh r0, [r0, #2]
	cmp sb, r0
	bge _0805A4EE
	b _0805A3D4
_0805A4EE:
	ldr r0, _0805A510 @ =0x0000FFFF
	strh r0, [r6, #2]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A504: .4byte gUnknown_0857685A
_0805A508: .4byte 0x00001432
_0805A50C: .4byte gUnknown_03004084
_0805A510: .4byte 0x0000FFFF

