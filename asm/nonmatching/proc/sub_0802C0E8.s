	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C0E8
sub_0802C0E8: @ 0x0802C0E8
	push {lr}
	ldr r0, _0802C0FC @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	cmp r0, #2
	beq _0802C10A
	cmp r0, #2
	bgt _0802C100
	cmp r0, #1
	beq _0802C106
	b _0802C114
	.align 2, 0
_0802C0FC: .4byte gUnknown_03003FC0
_0802C100:
	cmp r0, #3
	beq _0802C110
	b _0802C114
_0802C106:
	bl sub_08016ED8
_0802C10A:
	bl sub_0803B828
	b _0802C114
_0802C110:
	bl sub_0803B828
_0802C114:
	pop {r0}
	bx r0

