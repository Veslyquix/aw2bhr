	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080212AC
sub_080212AC: @ 0x080212AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r2, _08021300 @ =gUnknown_08090960
	ldr r0, [r2]
	ldr r1, [r0]
	lsls r0, r5, #4
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r1, r0, r1
	ldrb r0, [r1, #0x1b]
	cmp r0, #0
	beq _08021386
	ldrb r0, [r1, #0x1c]
	cmp r0, #0
	beq _08021386
	movs r4, #0
	lsls r0, r5, #1
	str r0, [sp, #8]
	ldr r0, _08021304 @ =gUnknown_084995FE
	ldr r1, [sp, #8]
	adds r6, r1, r0
_080212E2:
	ldrb r0, [r6]
	adds r0, r0, r4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	bl sub_080211DC
	adds r4, #1
	cmp r4, #0x32
	ble _080212E2
	movs r6, #0
	ldr r1, _08021308 @ =gUnknown_08499590
	ldr r0, [r1]
	b _08021380
	.align 2, 0
_08021300: .4byte gUnknown_08090960
_08021304: .4byte gUnknown_084995FE
_08021308: .4byte gUnknown_08499590
_0802130C:
	movs r4, #0
	ldr r2, _08021398 @ =gUnknown_08499590
	ldr r0, [r2]
	adds r3, r6, #1
	mov sl, r3
	ldrh r0, [r0]
	cmp r4, r0
	bge _0802137A
	adds r7, r2, #0
	ldr r0, _0802139C @ =gUnknown_084995F4
	ldr r1, [sp, #8]
	adds r1, r1, r0
	mov sb, r1
	lsls r2, r6, #0x10
	mov r8, r2
_0802132A:
	ldr r1, [r7]
	lsls r2, r6, #1
	ldr r3, _080213A0 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r4
	ldr r2, _080213A4 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r1, [r1]
	movs r0, #0xe0
	ands r0, r1
	mov r3, sb
	ldrh r3, [r3]
	cmp r0, r3
	bne _08021370
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	ldr r1, _080213A8 @ =gUnknown_08499598
	ldr r2, [r1]
	lsls r1, r5, #4
	subs r1, r1, r5
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r3, [r1, #0x1c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	mov r2, r8
	asrs r1, r2, #0x10
	movs r2, #0
	bl sub_080210C8
_08021370:
	adds r4, #1
	ldr r0, [r7]
	ldrh r0, [r0]
	cmp r4, r0
	blt _0802132A
_0802137A:
	mov r6, sl
	ldr r3, _08021398 @ =gUnknown_08499590
	ldr r0, [r3]
_08021380:
	ldrh r0, [r0, #2]
	cmp r6, r0
	blt _0802130C
_08021386:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08021398: .4byte gUnknown_08499590
_0802139C: .4byte gUnknown_084995F4
_080213A0: .4byte 0x0000417A
_080213A4: .4byte 0x00001432
_080213A8: .4byte gUnknown_08499598

