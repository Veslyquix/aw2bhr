	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804440C
sub_0804440C: @ 0x0804440C
	adds r2, r0, #0
	ldrb r1, [r2, #1]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _08044436
	ldrb r0, [r2]
	cmp r0, #1
	beq _08044436
	cmp r0, #2
	beq _08044436
	cmp r0, #0xa
	beq _08044436
	cmp r0, #0xb
	beq _08044436
	cmp r0, #0xf
	beq _08044436
	cmp r0, #0x15
	beq _08044436
	movs r0, #1
	b _08044438
_08044436:
	movs r0, #0
_08044438:
	bx lr
	.align 2, 0

