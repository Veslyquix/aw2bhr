	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08052358
sub_08052358: @ 0x08052358
	push {r4, r5, r6, lr}
	ldr r4, _080523D8 @ =gUnknown_03001470
	ldr r2, _080523DC @ =gUnknown_03001FBC
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r3, r4, #0
	adds r3, #0x28
	adds r1, r1, r3
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	movs r0, #0
	ldrsh r6, [r2, r0]
	lsls r1, r6, #1
	adds r1, r1, r6
	lsls r1, r1, #5
	adds r0, r4, #0
	adds r0, #0x30
	adds r0, r1, r0
	ldrh r0, [r0]
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0x34
	adds r0, r1, r0
	ldrh r2, [r0]
	adds r1, r1, r3
	ldr r0, [r1]
	lsls r0, r0, #0x12
	lsrs r4, r0, #0x10
	cmp r5, #0
	bne _080523A2
	rsbs r0, r4, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_080523A2:
	ldr r1, _080523E0 @ =gUnknown_02029A10
	lsls r3, r2, #3
	adds r3, r3, r2
	lsls r3, r3, #2
	movs r0, #0xb4
	muls r0, r5, r0
	adds r3, r3, r0
	adds r3, r3, r1
	ldr r0, _080523E4 @ =gUnknown_08552D80
	lsls r1, r5, #1
	adds r0, #0x56
	adds r1, r1, r0
	ldrh r2, [r1]
	ldrh r1, [r3, #8]
	adds r2, r2, r1
	adds r2, r4, r2
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #0xa
	ldrsh r3, [r3, r0]
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08050528
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080523D8: .4byte gUnknown_03001470
_080523DC: .4byte gUnknown_03001FBC
_080523E0: .4byte gUnknown_02029A10
_080523E4: .4byte gUnknown_08552D80

