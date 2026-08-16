	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080702C0
sub_080702C0: @ 0x080702C0
	push {r4, r5}
	ldr r2, [r1, #0x40]
	ldrb r3, [r2]
	cmp r3, #0x80
	bhs _080702D2
	strb r3, [r1, #5]
	adds r2, #1
	str r2, [r1, #0x40]
	b _080702D4
_080702D2:
	ldrb r3, [r1, #5]
_080702D4:
	ldr r1, [r1, #0x20]
	cmp r1, #0
	beq _080702FC
	movs r4, #0x83
	movs r5, #0x40
_080702DE:
	ldrb r2, [r1]
	tst r2, r4
	beq _080702F6
	tst r2, r5
	bne _080702F6
	ldrb r0, [r1, #0x11]
	cmp r0, r3
	bne _080702F6
	movs r0, #0x40
	orrs r2, r0
	strb r2, [r1]
	b _080702FC
_080702F6:
	ldr r1, [r1, #0x34]
	cmp r1, #0
	bne _080702DE
_080702FC:
	pop {r4, r5}
	bx lr

