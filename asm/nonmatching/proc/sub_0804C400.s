	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804C400
sub_0804C400: @ 0x0804C400
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r1, _0804C478 @ =gUnknown_08552148
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	bl sub_0804C340
	ldr r5, _0804C47C @ =gUnknown_085D6A48
	ldr r2, _0804C480 @ =gUnknown_03004580
	lsls r3, r4, #4
	adds r0, r2, #2
	adds r0, r3, r0
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrh r0, [r0]
	adds r2, #6
	adds r3, r3, r2
	ldrh r1, [r3]
	bl sub_08057D44
	adds r6, r0, #0
	movs r3, #0
	ldr r7, _0804C484 @ =gUnknown_02029A10
	movs r0, #0xb4
	adds r5, r4, #0
	muls r5, r0, r5
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r4, r0, #2
_0804C448:
	lsls r2, r3, #3
	adds r2, r2, r3
	lsls r2, r2, #2
	adds r2, r2, r5
	adds r2, r2, r7
	lsls r0, r3, #2
	adds r0, r0, r4
	adds r0, r6, r0
	ldrh r1, [r0]
	strh r1, [r2, #8]
	ldrh r1, [r0]
	strh r1, [r2, #4]
	ldrh r1, [r0, #2]
	strh r1, [r2, #0xa]
	ldrh r0, [r0, #2]
	strh r0, [r2, #6]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #4
	bls _0804C448
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C478: .4byte gUnknown_08552148
_0804C47C: .4byte gUnknown_085D6A48
_0804C480: .4byte gUnknown_03004580
_0804C484: .4byte gUnknown_02029A10

