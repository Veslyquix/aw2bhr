	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08062330
sub_08062330: @ 0x08062330
	push {r4, r5, r6, lr}
	ldr r0, _080623B0 @ =gUnknown_030033EC
	ldrh r1, [r0]
	ldr r0, _080623B4 @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r1, r0, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	movs r2, #0x7f
	adds r3, r2, #0
	ands r3, r1
	adds r0, #0x2e
	ldrb r0, [r0]
	ands r2, r0
	ldr r0, _080623B8 @ =gUnknown_03003F20
	ldr r1, [r0]
	ldr r4, _080623BC @ =gUnknown_084995A0
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080623A4
	adds r6, r3, #0
	adds r5, r2, #0
	movs r2, #0
_08062368:
	ldr r0, [r4]
	adds r3, r2, r0
	ldrb r0, [r3]
	cmp r0, #0x13
	beq _08062398
	ldrb r0, [r3, #1]
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, r2, r0
	ldrb r0, [r0, #2]
	strb r0, [r1, #1]
	ldrb r0, [r1]
	subs r3, r0, r6
	cmp r3, #0
	bge _08062388
	rsbs r3, r3, #0
_08062388:
	ldrb r0, [r1, #1]
	subs r0, r0, r5
	cmp r0, #0
	bge _08062392
	rsbs r0, r0, #0
_08062392:
	adds r0, r3, r0
	strh r0, [r1, #2]
	adds r1, #4
_08062398:
	adds r2, #8
	ldr r0, [r4]
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _08062368
_080623A4:
	ldr r0, _080623C0 @ =0x0000FFFF
	strh r0, [r1, #2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080623B0: .4byte gUnknown_030033EC
_080623B4: .4byte gUnknown_08499598
_080623B8: .4byte gUnknown_03003F20
_080623BC: .4byte gUnknown_084995A0
_080623C0: .4byte 0x0000FFFF

