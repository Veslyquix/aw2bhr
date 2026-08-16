	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080346FC
sub_080346FC: @ 0x080346FC
	push {r4, r5, r6, r7, lr}
	bl sub_08034780
	ldr r0, _0803472C @ =gUnknown_08090D8C
	ldr r3, [r0]
	ldrb r1, [r3, #1]
	adds r7, r0, #0
	cmp r1, #1
	beq _08034730
	cmp r1, #2
	bne _08034776
	adds r2, r3, #0
	adds r2, #0x39
	movs r0, #1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x3a
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	b _08034776
	.align 2, 0
_0803472C: .4byte gUnknown_08090D8C
_08034730:
	movs r2, #0
	ldr r6, _08034750 @ =gUnknown_085C77E0
	adds r4, r3, #0
	adds r4, #0x38
	movs r5, #0x5c
_0803473A:
	ldrb r0, [r3, #2]
	muls r0, r5, r0
	adds r0, r2, r0
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #5
	bne _08034754
	adds r2, #1
	adds r1, r2, r4
	movs r0, #2
	b _0803475A
	.align 2, 0
_08034750: .4byte gUnknown_085C77E0
_08034754:
	adds r2, #1
	adds r1, r2, r4
	movs r0, #1
_0803475A:
	strb r0, [r1]
	cmp r2, #3
	ble _0803473A
	ldr r2, _0803477C @ =gUnknown_085C77A0
	ldr r3, [r7]
	ldrb r1, [r3, #2]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #0x17]
	cmp r0, #0
	beq _08034776
	movs r0, #1
	strb r0, [r3, #0xd]
_08034776:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803477C: .4byte gUnknown_085C77A0

