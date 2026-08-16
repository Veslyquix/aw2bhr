	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08012C58
sub_08012C58: @ 0x08012C58
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	bl sub_080122EC
	ldr r0, _08012E20 @ =gUnknown_03002B6C
	mov r8, r0
	ldr r1, [r7]
	bl sub_08012C30
	ldr r1, [r7, #4]
	mov r0, r8
	bl sub_08012C1C
	ldr r1, [r7, #0xc]
	mov r0, r8
	bl sub_08012C48
	ldr r6, _08012E24 @ =gUnknown_03001FE8
	ldr r1, [r7, #0x10]
	adds r0, r6, #0
	bl sub_08012C30
	ldr r1, [r7, #0x14]
	adds r0, r6, #0
	bl sub_08012C1C
	ldr r1, [r7, #0x1c]
	adds r0, r6, #0
	bl sub_08012C48
	ldr r5, _08012E28 @ =gUnknown_030030B4
	ldr r1, [r7, #0x20]
	adds r0, r5, #0
	bl sub_08012C30
	ldr r1, [r7, #0x24]
	adds r0, r5, #0
	bl sub_08012C1C
	ldr r1, [r7, #0x2c]
	adds r0, r5, #0
	bl sub_08012C48
	ldr r1, _08012E2C @ =gUnknown_0300251C
	mov sl, r1
	ldr r1, [r7, #0x30]
	mov r0, sl
	bl sub_08012C30
	ldr r1, [r7, #0x34]
	mov r0, sl
	bl sub_08012C1C
	ldr r1, [r7, #0x3c]
	mov r0, sl
	bl sub_08012C48
	ldr r3, _08012E30 @ =gDispIo
	ldrb r0, [r3]
	movs r2, #8
	rsbs r2, r2, #0
	ands r2, r0
	ldrb r0, [r3, #1]
	movs r1, #1
	mov ip, r1
	mov r1, ip
	orrs r0, r1
	movs r1, #2
	mov sb, r1
	mov r1, sb
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r3, #1]
	movs r0, #0x20
	orrs r2, r0
	movs r0, #0x40
	orrs r2, r0
	strb r2, [r3]
	mov r0, r8
	ldrb r2, [r0]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	mov r2, r8
	strb r0, [r2]
	ldrb r2, [r6]
	adds r0, r1, #0
	ands r0, r2
	mov r2, sb
	orrs r0, r2
	strb r0, [r6]
	ldrb r0, [r5]
	ands r1, r0
	mov r0, ip
	orrs r1, r0
	strb r1, [r5]
	mov r1, sl
	ldrb r0, [r1]
	movs r1, #3
	orrs r0, r1
	mov r2, sl
	strb r0, [r2]
	movs r5, #0
	ldr r0, _08012E34 @ =gUnknown_08499580
	mov ip, r0
	ldr r1, _08012E38 @ =0x000003FF
	mov sb, r1
	ldr r2, [r7, #0x38]
	mov sl, r2
	ldr r0, _08012E3C @ =gUnknown_08499584
	mov r8, r0
	ldr r3, [r7, #8]
	ldr r4, [r7, #0x18]
	ldr r6, [r7, #0x28]
_08012D52:
	ldr r2, _08012E40 @ =gUnknown_08499578
	ldr r1, [r2]
	lsls r2, r5, #1
	adds r1, r2, r1
	ldr r0, [r7, #8]
	strh r0, [r1]
	ldr r1, _08012E44 @ =gUnknown_0849957C
	ldr r0, [r1]
	adds r0, r2, r0
	ldr r1, [r7, #0x18]
	strh r1, [r0]
	mov r1, ip
	ldr r0, [r1]
	adds r0, r2, r0
	ldr r1, [r7, #0x28]
	strh r1, [r0]
	mov r1, r8
	ldr r0, [r1]
	adds r2, r2, r0
	ldr r0, [r7, #0x38]
	strh r0, [r2]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, sb
	bls _08012D52
	lsls r1, r3, #5
	ldr r0, [r7]
	adds r0, r0, r1
	mov sb, r0
	lsls r1, r4, #5
	ldr r0, [r7, #0x10]
	adds r0, r0, r1
	mov r8, r0
	lsls r1, r6, #5
	ldr r0, [r7, #0x20]
	adds r4, r0, r1
	mov r2, sl
	lsls r1, r2, #5
	ldr r0, [r7, #0x30]
	adds r6, r0, r1
	movs r5, #0
	ldr r0, [r7, #4]
	mov ip, r0
	ldr r1, _08012E48 @ =gUnknown_08489334
	mov sl, r1
_08012DAE:
	lsls r0, r5, #1
	mov r2, sb
	adds r2, r0, r2
	str r2, [sp]
	mov r1, r8
	adds r3, r0, r1
	adds r2, r0, r4
	adds r1, r0, r6
	add r0, sl
	ldrh r0, [r0]
	strh r0, [r1]
	strh r0, [r2]
	strh r0, [r3]
	ldr r2, [sp]
	strh r0, [r2]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0xf
	bls _08012DAE
	ldr r0, _08012E40 @ =gUnknown_08499578
	ldr r0, [r0]
	mov r1, ip
	movs r2, #0x80
	lsls r2, r2, #4
	bl sub_08011C68
	ldr r0, _08012E44 @ =gUnknown_0849957C
	ldr r0, [r0]
	ldr r1, [r7, #0x14]
	movs r2, #0x80
	lsls r2, r2, #4
	bl sub_08011C68
	ldr r0, _08012E34 @ =gUnknown_08499580
	ldr r0, [r0]
	ldr r1, [r7, #0x24]
	movs r2, #0x80
	lsls r2, r2, #4
	bl sub_08011C68
	ldr r0, _08012E3C @ =gUnknown_08499584
	ldr r0, [r0]
	ldr r1, [r7, #0x34]
	movs r2, #0x80
	lsls r2, r2, #4
	bl sub_08011C68
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08012E20: .4byte gUnknown_03002B6C
_08012E24: .4byte gUnknown_03001FE8
_08012E28: .4byte gUnknown_030030B4
_08012E2C: .4byte gUnknown_0300251C
_08012E30: .4byte gDispIo
_08012E34: .4byte gUnknown_08499580
_08012E38: .4byte 0x000003FF
_08012E3C: .4byte gUnknown_08499584
_08012E40: .4byte gUnknown_08499578
_08012E44: .4byte gUnknown_0849957C
_08012E48: .4byte gUnknown_08489334

