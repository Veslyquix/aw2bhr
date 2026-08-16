	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08029570
sub_08029570: @ 0x08029570
	push {r4, r5, r6, r7, lr}
	ldr r2, _080295D8 @ =gUnknown_03001470
	ldr r3, _080295DC @ =gUnknown_03001FBC
	movs r0, #0
	ldrsh r1, [r3, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r2
	ldrh r0, [r0, #0x20]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r4, r2, #0
	ldr r6, _080295E0 @ =gUnknown_0849A06C
_0802958C:
	movs r2, #0
	ldrsh r1, [r3, r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r4
	ldrh r1, [r0, #0x20]
	subs r1, #1
	movs r2, #3
	ands r1, r2
	strh r1, [r0, #0x20]
	movs r7, #0
	ldrsh r1, [r3, r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r4
	movs r2, #0x1e
	ldrsh r1, [r0, r2]
	movs r7, #0x20
	ldrsh r2, [r0, r7]
	lsls r0, r2, #2
	adds r0, r0, r2
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ands r1, r0
	cmp r1, #0
	beq _0802958C
	cmp r5, r2
	beq _080295D2
	movs r0, #0x6a
	bl sub_0803B4DC
_080295D2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080295D8: .4byte gUnknown_03001470
_080295DC: .4byte gUnknown_03001FBC
_080295E0: .4byte gUnknown_0849A06C

