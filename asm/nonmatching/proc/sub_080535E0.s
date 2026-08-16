	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080535E0
sub_080535E0: @ 0x080535E0
	push {lr}
	ldr r0, _080535FC @ =gUnknown_03004504
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08053600
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08053604
	bl sub_08057BDC
	b _08053604
	.align 2, 0
_080535FC: .4byte gUnknown_03004504
_08053600:
	bl sub_08057BDC
_08053604:
	movs r0, #0
	bl sub_0804B330
	movs r0, #1
	bl sub_0804B330
	pop {r0}
	bx r0

