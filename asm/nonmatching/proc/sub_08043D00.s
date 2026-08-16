	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08043D00
sub_08043D00: @ 0x08043D00
	push {r4, r5, r6, lr}
	bl sub_08043CA0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	ldr r6, _08043D58 @ =gUnknown_08091380
	cmp r0, #5
	bhi _08043D48
	adds r5, r6, #0
_08043D1A:
	movs r2, #0
	cmp r2, r3
	bhs _08043D36
	ldr r4, [r5]
_08043D22:
	adds r1, r3, r2
	adds r1, r1, r4
	adds r0, r2, r4
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, r3
	blo _08043D22
_08043D36:
	adds r0, r3, r2
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	cmp r0, #5
	bls _08043D1A
_08043D48:
	ldr r0, [r6]
	adds r0, r3, r0
	movs r1, #0xff
	strb r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08043D58: .4byte gUnknown_08091380

