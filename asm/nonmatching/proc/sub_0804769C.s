	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804769C
sub_0804769C: @ 0x0804769C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	movs r0, #0
	mov ip, r0
	ldr r2, _08047734 @ =gUnknown_08499594
	ldr r0, _08047738 @ =gUnknown_03003F2C
	ldrh r7, [r0]
	adds r1, r7, r5
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r6, [r2]
	adds r3, r6, r0
	ldrb r1, [r3, #1]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08047728
	movs r0, #1
	mov ip, r0
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _08047728
	movs r4, #0
	mov r0, r8
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r4, r0
	bhs _08047728
	adds r2, r7, #0
	ldr r1, _0804773C @ =gUnknown_02028DD8
	mov r8, r1
	adds r7, r6, #0
	adds r6, r0, #0
_080476EA:
	mov r1, r8
	adds r0, r4, r1
	ldrb r1, [r0]
	adds r1, r2, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r7, r0
	ldrb r1, [r3, #1]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0804771E
	ldrb r0, [r3, #7]
	subs r0, r0, r2
	cmp r5, r0
	beq _08047714
	ldrb r0, [r3, #8]
	subs r0, r0, r2
	cmp r5, r0
	bne _0804771E
_08047714:
	mov r0, ip
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
_0804771E:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, r6
	blo _080476EA
_08047728:
	mov r0, ip
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08047734: .4byte gUnknown_08499594
_08047738: .4byte gUnknown_03003F2C
_0804773C: .4byte gUnknown_02028DD8

