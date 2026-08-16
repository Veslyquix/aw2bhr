	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08058058
sub_08058058: @ 0x08058058
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	ldr r0, _08058080 @ =gUnknown_03003F20
	ldr r2, [r0]
	lsls r0, r7, #2
	adds r2, r2, r0
	ldr r0, _08058084 @ =gUnknown_030040D8
	ldr r0, [r0]
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _08058088
	movs r0, #0
	b _08058130
	.align 2, 0
_08058080: .4byte gUnknown_03003F20
_08058084: .4byte gUnknown_030040D8
_08058088:
	movs r6, #0
	ldr r1, _080580F8 @ =gUnknown_08499590
	ldr r0, [r1]
	ldrh r0, [r0, #2]
	cmp r6, r0
	bge _0805812A
	mov sl, r1
_08058096:
	movs r3, #0
	mov r1, sl
	ldr r0, [r1]
	adds r4, r6, #1
	mov sb, r4
	ldrh r0, [r0]
	cmp r3, r0
	bge _0805811E
	lsls r0, r6, #2
	ldr r1, _080580FC @ =gUnknown_03003340
	adds r5, r0, r1
	ldr r4, _080580F8 @ =gUnknown_08499590
	mov ip, r4
	lsls r0, r6, #1
	mov r8, r0
_080580B4:
	ldr r0, [r5]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _08058112
	mov r4, ip
	ldr r1, [r4]
	ldr r4, _08058100 @ =0x0000417A
	adds r0, r1, r4
	add r0, r8
	ldrh r0, [r0]
	adds r0, r0, r3
	ldr r4, _08058104 @ =0x00001432
	adds r1, r1, r4
	adds r1, r1, r0
	ldrb r1, [r1]
	movs r0, #0x1f
	ands r0, r1
	cmp r0, #0x11
	bne _08058112
	adds r7, #1
	movs r4, #0
	strb r3, [r2]
	strb r6, [r2, #1]
	ldr r0, [r5]
	adds r1, r0, r3
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #4
	bgt _08058108
	strh r4, [r2, #2]
	b _08058110
	.align 2, 0
_080580F8: .4byte gUnknown_08499590
_080580FC: .4byte gUnknown_03003340
_08058100: .4byte 0x0000417A
_08058104: .4byte 0x00001432
_08058108:
	movs r0, #0
	ldrsb r0, [r1, r0]
	subs r0, #5
	strh r0, [r2, #2]
_08058110:
	adds r2, #4
_08058112:
	adds r3, #1
	mov r1, ip
	ldr r0, [r1]
	ldrh r0, [r0]
	cmp r3, r0
	blt _080580B4
_0805811E:
	mov r6, sb
	mov r4, sl
	ldr r0, [r4]
	ldrh r0, [r0, #2]
	cmp r6, r0
	blt _08058096
_0805812A:
	ldr r0, _08058140 @ =0x0000FFFF
	strh r0, [r2, #2]
	adds r0, r7, #0
_08058130:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08058140: .4byte 0x0000FFFF

