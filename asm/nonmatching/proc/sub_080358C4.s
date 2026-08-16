	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080358C4
sub_080358C4: @ 0x080358C4
	push {r4, r5, r6, r7, lr}
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	ldr r5, _08035934 @ =0x00002710
	adds r6, r5, #0
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	ldr r1, _08035938 @ =gUnknown_08090EA4
	ldr r0, [r1]
	ldr r4, [r0]
	movs r3, #4
	ldrsh r0, [r4, r3]
	subs r3, r2, r0
	mov ip, r1
	cmp r3, #0x1f
	bgt _080358EC
	adds r0, r2, #0
	subs r0, #0x20
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_080358EC:
	cmp r3, #0xc0
	ble _080358F8
	adds r0, r2, #0
	subs r0, #0xc0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_080358F8:
	lsls r0, r7, #0x10
	asrs r1, r0, #0x10
	movs r2, #6
	ldrsh r0, [r4, r2]
	subs r2, r1, r0
	cmp r2, #0x1f
	bgt _0803590E
	adds r0, r1, #0
	subs r0, #0x20
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_0803590E:
	cmp r2, #0x70
	ble _0803591A
	adds r0, r1, #0
	subs r0, #0x70
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_0803591A:
	lsls r0, r6, #0x10
	asrs r2, r0, #0x10
	ldr r0, _08035934 @ =0x00002710
	cmp r2, r0
	bne _0803593C
	lsls r0, r5, #0x10
	asrs r1, r0, #0x10
	adds r3, r0, #0
	cmp r1, r2
	beq _0803599C
	ldrh r6, [r4, #4]
	b _08035958
	.align 2, 0
_08035934: .4byte 0x00002710
_08035938: .4byte gUnknown_08090EA4
_0803593C:
	cmp r2, #0
	bge _08035946
	movs r6, #0
	lsls r3, r5, #0x10
	b _08035958
_08035946:
	ldrh r0, [r4]
	adds r1, r0, #0
	subs r1, #0xf
	lsls r0, r1, #4
	lsls r3, r5, #0x10
	cmp r2, r0
	ble _08035958
	lsls r0, r1, #0x14
	lsrs r6, r0, #0x10
_08035958:
	asrs r1, r3, #0x10
	ldr r0, _0803596C @ =0x00002710
	cmp r1, r0
	bne _08035970
	mov r3, ip
	ldr r0, [r3]
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	b _0803598E
	.align 2, 0
_0803596C: .4byte 0x00002710
_08035970:
	cmp r1, #0
	bge _08035978
	movs r5, #0
	b _0803598E
_08035978:
	mov r2, ip
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	adds r2, r0, #0
	subs r2, #0xa
	lsls r0, r2, #4
	cmp r1, r0
	ble _0803598E
	lsls r0, r2, #0x14
	lsrs r5, r0, #0x10
_0803598E:
	mov r3, ip
	ldr r0, [r3]
	ldr r0, [r0]
	strh r6, [r0, #4]
	strh r5, [r0, #6]
	bl sub_08023860
_0803599C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

