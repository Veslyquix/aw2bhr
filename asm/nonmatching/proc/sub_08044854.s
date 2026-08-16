	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08044854
sub_08044854: @ 0x08044854
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	cmp r4, #0
	blt _080448DE
	cmp r1, #0
	blt _080448DE
	ldr r0, _080448BC @ =gUnknown_08499590
	ldr r3, [r0]
	ldrh r0, [r3]
	cmp r4, r0
	bge _080448DE
	ldrh r6, [r3, #2]
	cmp r1, r6
	bge _080448DE
	ldr r2, _080448C0 @ =gUnknown_08499594
	lsls r1, r1, #1
	ldr r6, _080448C4 @ =0x0000417A
	adds r0, r3, r6
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, r1, r4
	ldr r4, _080448C8 @ =0x0000051A
	adds r0, r3, r4
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r4, r1, r0
	ldrb r0, [r4]
	cmp r0, #0
	beq _080448DE
	ldrb r1, [r4, #1]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _080448DE
	ldrb r2, [r4, #4]
	lsls r3, r2, #0x19
	lsrs r1, r3, #0x19
	adds r0, r5, #1
	cmp r1, r0
	bge _080448CC
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #4]
	b _080448DE
	.align 2, 0
_080448BC: .4byte gUnknown_08499590
_080448C0: .4byte gUnknown_08499594
_080448C4: .4byte 0x0000417A
_080448C8: .4byte 0x0000051A
_080448CC:
	lsrs r0, r3, #0x19
	subs r0, r0, r5
	movs r1, #0x7f
	ands r0, r1
	movs r1, #0x80
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, #4]
_080448DE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

