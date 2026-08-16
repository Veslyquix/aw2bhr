	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080466A4
sub_080466A4: @ 0x080466A4
	ldr r2, _080466D0 @ =gUnknown_084C1430
	ldr r0, [r2]
	adds r1, r0, #0
	adds r1, #0x58
	ldrb r0, [r1]
	cmp r0, #0x37
	bls _080466B6
	movs r0, #0
	strb r0, [r1]
_080466B6:
	ldr r0, [r2]
	adds r2, r0, #0
	adds r2, #0x58
	ldrb r3, [r2]
	adds r1, r0, #0
	adds r1, #0x59
	ldrb r0, [r1]
	cmp r0, #0
	bne _080466D4
	adds r0, r3, #1
	strb r0, [r2]
	b _080466D8
	.align 2, 0
_080466D0: .4byte gUnknown_084C1430
_080466D4:
	subs r0, #1
	strb r0, [r1]
_080466D8:
	bx lr
	.align 2, 0

