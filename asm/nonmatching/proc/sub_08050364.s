	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08050364
sub_08050364: @ 0x08050364
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov r8, r1
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	mov r4, sp
	adds r0, r7, #0
	mov r1, sp
	bl sub_0801566C
	ldrh r2, [r4, #4]
	lsls r2, r2, #0x16
	lsrs r0, r2, #0x16
	mov r1, r8
	ldrh r3, [r1, #4]
	subs r0, r3, r0
	ldr r4, _08050400 @ =0x000003FF
	adds r1, r4, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	mov ip, r1
	lsrs r0, r0, #0x14
	mov sb, r0
	ldr r4, _08050404 @ =gUnknown_03001470
	lsls r1, r7, #1
	adds r1, r1, r7
	lsls r1, r1, #5
	adds r0, r4, #0
	adds r0, #0x30
	adds r0, r1, r0
	ldrh r5, [r0]
	adds r0, r4, #0
	adds r0, #0x34
	adds r0, r1, r0
	ldrh r6, [r0]
	movs r0, #0xfc
	lsls r0, r0, #8
	ands r0, r3
	lsrs r2, r2, #0x16
	adds r2, r2, r0
	mov r0, r8
	strh r2, [r0, #4]
	adds r0, r4, #0
	adds r0, #0x28
	adds r3, r1, r0
	ldr r0, [r3]
	cmp ip, r0
	beq _080503F2
	ldr r2, _08050408 @ =gUnknown_02029A10
	lsls r0, r6, #3
	adds r0, r0, r6
	lsls r0, r0, #2
	movs r1, #0xb4
	muls r1, r5, r1
	adds r0, r0, r1
	adds r0, r0, r2
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	cmp r7, r0
	bne _080503F2
	mov r4, ip
	str r4, [r3]
	adds r0, r5, #0
	adds r1, r6, #0
	mov r2, sb
	bl sub_08050424
_080503F2:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050400: .4byte 0x000003FF
_08050404: .4byte gUnknown_03001470
_08050408: .4byte gUnknown_02029A10

