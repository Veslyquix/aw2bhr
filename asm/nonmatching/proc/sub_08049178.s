	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08049178
sub_08049178: @ 0x08049178
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	ldr r3, _080491A4 @ =gUnknown_084C30F8
	ldr r1, [r3]
	ldr r2, _080491A8 @ =0x00000836
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804919C
	ldr r4, _080491AC @ =0x0000083C
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _080491B0
_0804919C:
	mov r0, sl
	bl Proc_Break
	b _08049250
	.align 2, 0
_080491A4: .4byte gUnknown_084C30F8
_080491A8: .4byte 0x00000836
_080491AC: .4byte 0x0000083C
_080491B0:
	mov r0, sl
	adds r0, #0x64
	movs r4, #0
	ldrsh r2, [r0, r4]
	mov sb, r0
	cmp r2, #0
	bne _080491D8
	ldr r0, _080491D4 @ =0x00000838
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0
	movs r1, #0
	bl sub_08048850
	b _08049236
	.align 2, 0
_080491D4: .4byte 0x00000838
_080491D8:
	cmp r2, #0
	blt _08049236
	cmp r2, #9
	bgt _08049236
	cmp r2, #2
	blt _08049236
	mov r1, sb
	ldrb r0, [r1]
	subs r0, #1
	movs r1, #2
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _08049236
	adds r7, r0, #0
	ldr r2, _08049260 @ =gUnknown_08499578
	mov r8, r2
	mov ip, r3
_080491FC:
	movs r3, #0
	adds r0, r1, #0
	adds r0, #0xd
	adds r6, r1, #1
	subs r0, r0, r7
	lsls r5, r0, #5
	lsls r4, r1, #5
_0804920A:
	adds r2, r5, r3
	mov r1, r8
	ldr r0, [r1]
	lsls r2, r2, #1
	adds r2, r2, r0
	mov r1, ip
	ldr r0, [r1]
	adds r1, r4, r3
	lsls r1, r1, #1
	adds r0, #0x32
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x13
	bls _0804920A
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	cmp r1, r7
	blt _080491FC
_08049236:
	bl sub_08013AEC
	mov r2, sb
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	ble _08049250
	mov r0, sl
	bl Proc_Break
_08049250:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049260: .4byte gUnknown_08499578

