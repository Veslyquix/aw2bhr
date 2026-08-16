	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08054500
sub_08054500: @ 0x08054500
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r7, r5, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r6, r1, #0
	ldr r2, _08054584 @ =gUnknown_02029A10
	lsls r0, r6, #3
	adds r0, r0, r6
	lsls r0, r0, #2
	movs r1, #0xb4
	muls r1, r5, r1
	adds r0, r0, r1
	adds r4, r0, r2
	movs r0, #0x18
	ldrsh r1, [r4, r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0805457C
	adds r0, r1, #0
	bl sub_080153F0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805457C
	ldr r1, _08054588 @ =gUnknown_020298E0
	lsls r0, r5, #3
	adds r0, r0, r5
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrh r1, [r0, #0x16]
	adds r1, #1
	strh r1, [r0, #0x16]
	ldr r1, _0805458C @ =gUnknown_08553838
	ldrb r0, [r4]
	lsls r0, r0, #1
	ldrb r2, [r4, #1]
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #1
	bne _08054574
	ldr r0, _08054590 @ =gUnknown_03004580
	lsls r1, r5, #4
	adds r0, #0xa
	adds r1, r1, r0
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	ldr r1, _08054594 @ =gUnknown_03004548
	lsls r0, r5, #1
	adds r0, r0, r1
	strh r2, [r0]
	ldrb r0, [r4, #1]
	strb r0, [r4]
_08054574:
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_08050F24
_0805457C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08054584: .4byte gUnknown_02029A10
_08054588: .4byte gUnknown_020298E0
_0805458C: .4byte gUnknown_08553838
_08054590: .4byte gUnknown_03004580
_08054594: .4byte gUnknown_03004548

