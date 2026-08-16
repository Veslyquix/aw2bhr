	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080227A8
sub_080227A8: @ 0x080227A8
	push {r4, r5, r6, r7, lr}
	movs r5, #0
	ldr r7, _080227F0 @ =gUnknown_080909B0
_080227AE:
	movs r4, #0
	adds r6, r5, #1
_080227B2:
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
	bl sub_08022618
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0xf
	bls _080227B2
	lsls r0, r6, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0xf
	bls _080227AE
	bl sub_08013B0C
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080227F0: .4byte gUnknown_080909B0

