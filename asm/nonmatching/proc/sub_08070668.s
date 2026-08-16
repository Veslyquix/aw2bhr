	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08070668
sub_08070668: @ 0x08070668
	push {r4, r5, r6, r7, lr}
	ldrb r5, [r0, #8]
	ldr r4, [r0, #0x2c]
	cmp r5, #0
	ble _080706AA
	movs r7, #0x80
_08070674:
	ldrb r1, [r4]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080706A2
	movs r6, #0x40
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080706A2
	adds r0, r4, #0
	bl sub_080707E0
	strb r7, [r4]
	movs r0, #2
	strb r0, [r4, #0xf]
	strb r6, [r4, #0x13]
	movs r0, #0x16
	strb r0, [r4, #0x19]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
_080706A2:
	subs r5, #1
	adds r4, #0x50
	cmp r5, #0
	bgt _08070674
_080706AA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

