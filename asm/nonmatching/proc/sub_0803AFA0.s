	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803AFA0
sub_0803AFA0: @ 0x0803AFA0
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl sub_0803ABD8
	ldr r2, _0803AFCC @ =gUnknown_080910D4
	movs r0, #0
	movs r1, #0
	bl sub_080119A0
	movs r4, #0
	ldr r7, _0803AFD0 @ =gUnknown_080910E0
	ldr r6, _0803AFD4 @ =gUnknown_080910E4
_0803AFB8:
	movs r1, #0x20
	ldrsh r0, [r5, r1]
	cmp r0, r4
	bne _0803AFD8
	bl sub_08012E4C
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	b _0803AFDA
	.align 2, 0
_0803AFCC: .4byte gUnknown_080910D4
_0803AFD0: .4byte gUnknown_080910E0
_0803AFD4: .4byte gUnknown_080910E4
_0803AFD8:
	movs r3, #0
_0803AFDA:
	lsls r1, r4, #0x13
	movs r2, #0x80
	lsls r2, r2, #0xc
	adds r1, r1, r2
	lsrs r1, r1, #0x10
	ldr r2, [r7]
	lsls r0, r4, #2
	adds r0, r0, r2
	ldr r2, [r0]
	adds r0, r3, #0
	bl sub_080119A0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0803AFB8
	movs r0, #0x20
	ldrsh r1, [r5, r0]
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #0xc
	adds r1, r1, r2
	lsrs r1, r1, #0x10
	ldr r2, _0803B024 @ =gUnknown_08091064
	movs r0, #0
	bl sub_080119A0
	movs r1, #0x20
	ldrsh r0, [r5, r1]
	cmp r0, #1
	beq _0803B042
	cmp r0, #1
	bgt _0803B028
	cmp r0, #0
	beq _0803B02E
	b _0803B08A
	.align 2, 0
_0803B024: .4byte gUnknown_08091064
_0803B028:
	cmp r0, #2
	beq _0803B064
	b _0803B08A
_0803B02E:
	ldr r0, [r6]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803B08A
	bl sub_0803AF84
	b _0803B0D2
_0803B042:
	ldr r0, [r6]
	ldr r3, [r0]
	ldrh r2, [r3]
	movs r1, #0xc0
	lsls r1, r1, #2
	adds r0, r1, #0
	ands r0, r2
	cmp r0, r1
	bne _0803B08A
	ldrh r1, [r3, #4]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0803B08A
	bl sub_0803AF78
	b _0803B0D2
_0803B064:
	ldr r0, [r6]
	ldr r3, [r0]
	ldrh r2, [r3]
	movs r1, #0xc0
	lsls r1, r1, #2
	adds r0, r1, #0
	ands r0, r2
	cmp r0, r1
	bne _0803B08A
	ldrh r1, [r3, #4]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0803B08A
	bl sub_0803AF90
	bl sub_08036CB4
	b _0803B0D2
_0803B08A:
	ldr r0, [r6]
	ldr r2, [r0]
	ldrh r1, [r2, #4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803B09E
	movs r0, #0
	str r0, [r5, #8]
	b _0803B0D2
_0803B09E:
	ldrh r1, [r2, #2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803B0B6
	ldrh r1, [r5, #0x20]
	movs r2, #0x20
	ldrsh r0, [r5, r2]
	cmp r0, #0
	ble _0803B0B6
	subs r0, r1, #1
	strh r0, [r5, #0x20]
_0803B0B6:
	ldr r0, [r6]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0803B0D2
	ldrh r1, [r5, #0x20]
	movs r2, #0x20
	ldrsh r0, [r5, r2]
	cmp r0, #1
	bgt _0803B0D2
	adds r0, r1, #1
	strh r0, [r5, #0x20]
_0803B0D2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

