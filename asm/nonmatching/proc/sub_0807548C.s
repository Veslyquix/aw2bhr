	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807548C
sub_0807548C: @ 0x0807548C
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	lsls r0, r0, #0x10
	ldr r2, _08075514 @ =0xFFF00000
	adds r0, r0, r2
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	adds r1, r1, r2
	lsrs r5, r1, #0x10
	cmp r6, #2
	beq _080754A6
	ldr r4, _08075518 @ =0x0000FFE2
	ldr r5, _0807551C @ =0x0000FFC0
_080754A6:
	ldr r0, _08075520 @ =gUnknown_086143B8
	adds r1, r3, #0
	bl Proc_Start
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	rsbs r1, r1, #0
	movs r4, #0
	strh r1, [r0, #0x2e]
	strh r1, [r0, #0x2a]
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	rsbs r1, r1, #0
	strh r1, [r0, #0x30]
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x34]
	strh r4, [r0, #0x32]
	str r6, [r0, #0x38]
	str r4, [r0, #0x3c]
	ldrh r1, [r0, #0x2e]
	ldrh r2, [r0, #0x30]
	movs r0, #1
	bl sub_08072C40
	ldr r2, _08075524 @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08075528 @ =gUnknown_03002020
	movs r0, #0xc
	strh r0, [r1]
	ldr r1, _0807552C @ =gUnknown_03002B28
	movs r0, #0x10
	strh r0, [r1]
	ldr r0, _08075530 @ =gUnknown_03001FFC
	strh r4, [r0]
	ldrh r1, [r2]
	ldr r0, _08075534 @ =0x0000FFE0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _08075538 @ =0x0000E0FF
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
_08075514: .4byte 0xFFF00000
_08075518: .4byte 0x0000FFE2
_0807551C: .4byte 0x0000FFC0
_08075520: .4byte gUnknown_086143B8
_08075524: .4byte gUnknown_030030E0
_08075528: .4byte gUnknown_03002020
_0807552C: .4byte gUnknown_03002B28
_08075530: .4byte gUnknown_03001FFC
_08075534: .4byte 0x0000FFE0
_08075538: .4byte 0x0000E0FF

