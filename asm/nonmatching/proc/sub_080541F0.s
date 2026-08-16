	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080541F0
sub_080541F0: @ 0x080541F0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldr r6, _08054268 @ =gUnknown_085D6C88
	ldr r2, _0805426C @ =gUnknown_03004580
	lsls r3, r5, #4
	adds r0, r2, #2
	adds r0, r3, r0
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r2, #6
	adds r3, r3, r2
	ldrh r1, [r3]
	lsls r2, r0, #3
	cmp r1, #2
	bne _0805421A
	adds r2, #2
_0805421A:
	adds r0, r6, #0
	adds r0, #8
	adds r0, r2, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl sub_0803B48C
	ldr r2, _08054270 @ =gUnknown_02029A10
	lsls r0, r4, #3
	adds r0, r0, r4
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
	beq _08054262
	adds r0, r1, #0
	bl sub_080153F0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08054262
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	ldr r1, _08054274 @ =gUnknown_02029BA8
	lsls r2, r5, #5
	adds r1, #0xc
	adds r2, r2, r1
	ldr r1, [r2]
	bl sub_080156E8
_08054262:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08054268: .4byte gUnknown_085D6C88
_0805426C: .4byte gUnknown_03004580
_08054270: .4byte gUnknown_02029A10
_08054274: .4byte gUnknown_02029BA8

