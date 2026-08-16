	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804E4CC
sub_0804E4CC: @ 0x0804E4CC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r4, r0, #0
	mov r8, r1
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r5, sp
	adds r0, r4, #0
	mov r1, sp
	bl sub_0801566C
	ldrh r2, [r5, #4]
	lsls r2, r2, #0x16
	lsrs r0, r2, #0x16
	mov r1, r8
	ldrh r3, [r1, #4]
	subs r0, r3, r0
	ldr r5, _0804E570 @ =0x000003FF
	adds r1, r5, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsrs r0, r0, #0x16
	mov sb, r0
	movs r1, #0x3f
	ands r1, r6
	ldr r0, _0804E574 @ =gUnknown_03001470
	mov ip, r0
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r7, r0, #5
	mov r0, ip
	adds r0, #0x30
	adds r0, r7, r0
	ldrh r5, [r0]
	movs r0, #0xfc
	lsls r0, r0, #8
	ands r0, r3
	adds r1, r1, r0
	lsrs r2, r2, #0x16
	adds r2, r2, r1
	mov r1, r8
	strh r2, [r1, #4]
	ldr r1, _0804E578 @ =gUnknown_02029668
	lsls r2, r5, #2
	adds r0, r2, r5
	lsls r0, r0, #1
	adds r1, #8
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r4, r0
	bne _0804E562
	mov r0, ip
	adds r0, #0x28
	adds r0, r7, r0
	ldr r0, [r0]
	cmp r6, r0
	beq _0804E562
	ldr r0, _0804E57C @ =gUnknown_08552FB0
	adds r0, r2, r0
	mov r2, sb
	lsls r1, r2, #0xb
	ldr r0, [r0]
	adds r0, r0, r1
	lsls r1, r5, #0xd
	ldr r5, _0804E580 @ =0x06011800
	adds r1, r1, r5
	movs r2, #0x80
	lsls r2, r2, #4
	bl sub_08011E54
_0804E562:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804E570: .4byte 0x000003FF
_0804E574: .4byte gUnknown_03001470
_0804E578: .4byte gUnknown_02029668
_0804E57C: .4byte gUnknown_08552FB0
_0804E580: .4byte 0x06011800

