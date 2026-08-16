	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080456B8
sub_080456B8: @ 0x080456B8
	push {r4, r5, lr}
	adds r1, r0, #0
	ldr r3, _080456C0 @ =gUnknown_020288B4
	b _080456F2
	.align 2, 0
_080456C0: .4byte gUnknown_020288B4
_080456C4:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _080456D8
	movs r0, #0x7f
	ands r0, r2
	strb r0, [r3]
	adds r1, #1
	adds r3, #1
	b _080456F2
_080456D8:
	movs r0, #0
	adds r2, r1, #1
	ldrb r4, [r1]
	cmp r0, r4
	bge _080456F0
	movs r4, #0
_080456E4:
	strb r4, [r3]
	adds r3, #1
	adds r0, #1
	ldrb r5, [r1]
	cmp r0, r5
	blt _080456E4
_080456F0:
	adds r1, r2, #0
_080456F2:
	ldrb r2, [r1]
	adds r0, r2, #0
	cmp r0, #0xff
	bne _080456C4
	pop {r4, r5}
	pop {r0}
	bx r0

