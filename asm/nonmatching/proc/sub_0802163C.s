	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802163C
sub_0802163C: @ 0x0802163C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	subs r0, #0xb4
	cmp r0, #0xb
	bhi _08021658
	adds r0, r5, #0
	bl sub_08021750
	b _0802171E
_08021658:
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r5, #0
	bl sub_080247A4
	ldr r6, _08021730 @ =gUnknown_08499590
	ldr r4, [r6]
	ldr r0, _08021734 @ =gUnknown_03003F68
	ldr r2, [r0]
	ldrb r1, [r2]
	movs r0, #0
	strh r1, [r4]
	ldrb r1, [r2, #1]
	strh r1, [r4, #2]
	strh r0, [r4, #4]
	strh r0, [r4, #6]
	strh r0, [r4, #8]
	strh r0, [r4, #0xa]
	strh r0, [r4, #0xc]
	strh r0, [r4, #0xe]
	strh r0, [r4, #0x10]
	ldr r0, _08021738 @ =0x0000421A
	adds r4, r4, r0
	adds r0, r5, #0
	bl sub_08024944
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_0803CC84
	adds r0, r5, #0
	bl sub_0802490C
	ldr r1, [r6]
	ldr r2, _0802173C @ =0x00004233
	adds r1, r1, r2
	strb r0, [r1]
	bl sub_080215FC
	movs r1, #0
	ldr r0, [r6]
	ldrh r0, [r0, #2]
	cmp r1, r0
	bge _0802171A
	mov sl, r6
_080216B2:
	movs r5, #0
	mov r7, sl
	ldr r0, [r7]
	adds r2, r1, #1
	mov ip, r2
	ldrh r0, [r0]
	cmp r5, r0
	bge _0802170E
	ldr r7, _08021734 @ =gUnknown_03003F68
	mov sb, r7
	ldr r6, _08021730 @ =gUnknown_08499590
	lsls r1, r1, #1
	str r1, [sp]
	ldr r0, _08021740 @ =gUnknown_0849959C
	mov r8, r0
_080216D0:
	mov r1, sb
	ldr r0, [r1]
	ldr r2, [r6]
	ldr r7, _08021744 @ =0x0000417A
	adds r3, r2, r7
	ldr r1, [sp]
	adds r3, r3, r1
	ldrh r1, [r3]
	adds r1, r1, r5
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrh r4, [r0, #2]
	ldr r7, _08021748 @ =0x00000A22
	adds r0, r2, r7
	adds r0, r0, r1
	strh r4, [r0]
	ldrh r0, [r3]
	adds r0, r0, r5
	ldr r1, _0802174C @ =0x00001432
	adds r2, r2, r1
	adds r2, r2, r0
	mov r7, r8
	ldr r0, [r7]
	adds r0, r0, r4
	ldrb r0, [r0]
	strb r0, [r2]
	adds r5, #1
	ldr r0, [r6]
	ldrh r0, [r0]
	cmp r5, r0
	blt _080216D0
_0802170E:
	mov r1, ip
	mov r2, sl
	ldr r0, [r2]
	ldrh r0, [r0, #2]
	cmp r1, r0
	blt _080216B2
_0802171A:
	bl sub_0802481C
_0802171E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08021730: .4byte gUnknown_08499590
_08021734: .4byte gUnknown_03003F68
_08021738: .4byte 0x0000421A
_0802173C: .4byte 0x00004233
_08021740: .4byte gUnknown_0849959C
_08021744: .4byte 0x0000417A
_08021748: .4byte 0x00000A22
_0802174C: .4byte 0x00001432

