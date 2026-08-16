	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08022580
sub_08022580: @ 0x08022580
	push {r4, r5, r6, r7, lr}
	movs r5, #0
	ldr r7, _080225C8 @ =gUnknown_080909A4
_08022586:
	movs r4, #0
	adds r6, r5, #1
_0802258A:
	ldr r0, [r7]
	ldr r1, [r0]
	ldrh r0, [r1, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	adds r0, r4, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	adds r1, r5, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_08022428
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0xf
	bls _0802258A
	lsls r0, r6, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0xf
	bls _08022586
	bl sub_08013AFC
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080225C8: .4byte gUnknown_080909A4

