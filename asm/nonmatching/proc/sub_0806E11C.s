	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806E11C
sub_0806E11C: @ 0x0806E11C
	push {lr}
	ldr r0, _0806E130 @ =gUnknown_0202F2C8
	ldrb r0, [r0]
	cmp r0, #0
	beq _0806E134
	movs r0, #0x66
	bl sub_0803B4DC
	b _0806E13A
	.align 2, 0
_0806E130: .4byte gUnknown_0202F2C8
_0806E134:
	movs r0, #0x71
	bl sub_0803B4DC
_0806E13A:
	bl sub_0806D34C
	bl sub_0806D620
	bl sub_0806D840
	pop {r0}
	bx r0
	.align 2, 0

