	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080236E8
sub_080236E8: @ 0x080236E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r2, _08023804 @ =gUnknown_08090A08
	ldr r0, [r2]
	ldr r6, [r0]
	ldrh r1, [r6, #0x10]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _080237F6
	ldr r0, _08023808 @ =gpKeySt
	ldr r0, [r0]
	mov ip, r0
	ldrh r0, [r0, #2]
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	mov sl, r1
	lsrs r5, r0, #0x14
	movs r0, #0xf
	ands r5, r0
	ldr r2, _0802380C @ =gUnknown_08090A0C
	mov sb, r2
	ldr r4, [r2]
	ldr r0, _08023810 @ =gUnknown_08090A10
	mov r8, r0
	ldr r2, [r0]
	lsls r3, r5, #2
	adds r0, r3, r2
	ldrh r1, [r0]
	ldrh r0, [r4]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	adds r2, #2
	adds r3, r3, r2
	ldrh r0, [r3]
	ldrh r2, [r4, #2]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r3, r1, #0x10
	orrs r3, r0
	ldrh r0, [r4, #2]
	lsls r0, r0, #1
	ldr r1, _08023814 @ =0x0000417A
	adds r7, r6, r1
	adds r0, r7, r0
	ldrh r0, [r0]
	ldrh r1, [r4]
	adds r0, r0, r1
	ldr r4, _08023818 @ =0x00002852
	adds r2, r6, r4
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _0802377C
	lsrs r0, r3, #0x10
	lsls r0, r0, #1
	adds r0, r7, r0
	lsls r1, r3, #0x10
	lsrs r1, r1, #0x10
	ldrh r0, [r0]
	adds r1, r1, r0
	adds r1, r2, r1
	ldrb r0, [r1]
	cmp r0, #0x78
	bls _0802377C
	mov r0, ip
	ldrh r0, [r0, #4]
	cmp sl, r0
	bne _080237F6
_0802377C:
	mov r1, sb
	ldr r6, [r1]
	ldrh r0, [r6]
	mov r2, r8
	ldr r1, [r2]
	lsls r2, r5, #2
	adds r3, r2, r1
	movs r4, #0
	ldrsh r1, [r3, r4]
	adds r4, r0, r1
	adds r7, r2, #0
	cmp r4, #0
	blt _080237BA
	ldr r0, _0802381C @ =gUnknown_08499590
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r4, r0
	bge _080237BA
	ldr r0, _08023820 @ =gUnknown_030032C4
	lsls r1, r1, #2
	ldrh r2, [r0]
	adds r1, r1, r2
	strh r1, [r0]
	strh r4, [r6]
	movs r4, #0
	ldrsh r0, [r3, r4]
	cmp r0, #0
	beq _080237BA
	movs r0, #0x6a
	bl sub_0803B4DC
_080237BA:
	mov r0, sb
	ldr r6, [r0]
	ldrh r1, [r6, #2]
	mov r2, r8
	ldr r0, [r2]
	adds r0, #2
	adds r3, r7, r0
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r4, r1, r2
	cmp r4, #0
	blt _080237F6
	ldr r0, _0802381C @ =gUnknown_08499590
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	cmp r4, r0
	bge _080237F6
	ldr r0, _08023820 @ =gUnknown_030032C4
	lsls r1, r2, #2
	ldrh r2, [r0, #2]
	adds r1, r1, r2
	strh r1, [r0, #2]
	strh r4, [r6, #2]
	movs r4, #0
	ldrsh r0, [r3, r4]
	cmp r0, #0
	beq _080237F6
	movs r0, #0x6a
	bl sub_0803B4DC
_080237F6:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08023804: .4byte gUnknown_08090A08
_08023808: .4byte gpKeySt
_0802380C: .4byte gUnknown_08090A0C
_08023810: .4byte gUnknown_08090A10
_08023814: .4byte 0x0000417A
_08023818: .4byte 0x00002852
_0802381C: .4byte gUnknown_08499590
_08023820: .4byte gUnknown_030032C4

