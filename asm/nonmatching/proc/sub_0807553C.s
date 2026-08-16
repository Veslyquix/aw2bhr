	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807553C
sub_0807553C: @ 0x0807553C
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	lsls r0, r0, #0x10
	ldr r2, _080755B8 @ =0xFFF00000
	adds r0, r0, r2
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	adds r1, r1, r2
	lsrs r5, r1, #0x10
	cmp r6, #1
	beq _08075556
	ldr r4, _080755BC @ =0x0000FFE2
	ldr r5, _080755C0 @ =0x0000FFC0
_08075556:
	ldr r0, _080755C4 @ =gUnknown_086143B8
	bl Proc_Find
	ldrh r1, [r0, #0x2a]
	movs r3, #0
	strh r1, [r0, #0x2e]
	ldrh r1, [r0, #0x2c]
	strh r1, [r0, #0x30]
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	rsbs r1, r1, #0
	strh r1, [r0, #0x32]
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	rsbs r1, r1, #0
	strh r1, [r0, #0x34]
	str r6, [r0, #0x38]
	str r3, [r0, #0x3c]
	ldr r2, _080755C8 @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080755CC @ =gUnknown_03002020
	movs r0, #0xc
	strh r0, [r1]
	ldr r1, _080755D0 @ =gUnknown_03002B28
	movs r0, #0x10
	strh r0, [r1]
	ldr r0, _080755D4 @ =gUnknown_03001FFC
	strh r3, [r0]
	ldrh r1, [r2]
	ldr r0, _080755D8 @ =0x0000FFE0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _080755DC @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xc0
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080755B8: .4byte 0xFFF00000
_080755BC: .4byte 0x0000FFE2
_080755C0: .4byte 0x0000FFC0
_080755C4: .4byte gUnknown_086143B8
_080755C8: .4byte gUnknown_030030E0
_080755CC: .4byte gUnknown_03002020
_080755D0: .4byte gUnknown_03002B28
_080755D4: .4byte gUnknown_03001FFC
_080755D8: .4byte 0x0000FFE0
_080755DC: .4byte 0x0000E0FF

