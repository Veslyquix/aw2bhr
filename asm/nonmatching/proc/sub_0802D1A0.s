	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802D1A0
sub_0802D1A0: @ 0x0802D1A0
	push {lr}
	ldr r1, _0802D1BC @ =gUnknown_03000558
	movs r0, #1
	strb r0, [r1]
	movs r0, #1
	bl sub_08029948
	bl sub_0801A168
	bl sub_08034F7C
	pop {r0}
	bx r0
	.align 2, 0
_0802D1BC: .4byte gUnknown_03000558

