	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08053670
sub_08053670: @ 0x08053670
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r2, _080536CC @ =gUnknown_03004508
	ldr r6, _080536D0 @ =gUnknown_02029808
	movs r0, #0x6c
	adds r4, r5, #0
	muls r4, r0, r4
	adds r7, r4, r6
	ldrh r0, [r7]
	lsls r0, r0, #1
	adds r0, r0, r4
	adds r1, r6, #0
	adds r1, #0x1a
	adds r0, r0, r1
	ldrh r1, [r2]
	ldrh r0, [r0]
	cmp r1, r0
	bne _080536C4
	adds r0, r5, #0
	bl sub_08057BCC
	ldrh r1, [r7]
	lsls r1, r1, #1
	adds r1, r1, r4
	adds r0, r6, #2
	adds r0, r1, r0
	ldrh r3, [r0]
	adds r0, r6, #0
	adds r0, #0xe
	adds r1, r1, r0
	ldrh r2, [r1]
	ldr r0, _080536D4 @ =gUnknown_0300454C
	strh r3, [r0]
	strh r2, [r0, #2]
	adds r0, r3, r2
	cmp r0, #0xfe
	bgt _080536C4
	adds r0, r5, #0
	adds r1, r3, #0
	bl sub_080536D8
_080536C4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080536CC: .4byte gUnknown_03004508
_080536D0: .4byte gUnknown_02029808
_080536D4: .4byte gUnknown_0300454C

