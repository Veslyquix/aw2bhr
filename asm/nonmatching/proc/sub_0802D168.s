	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802D168
sub_0802D168: @ 0x0802D168
	push {lr}
	ldr r0, _0802D17C @ =gUnknown_030033E8
	ldrb r1, [r0]
	cmp r1, #0
	beq _0802D184
	ldr r1, _0802D180 @ =gUnknown_03000558
	movs r0, #1
	strb r0, [r1]
	b _0802D188
	.align 2, 0
_0802D17C: .4byte gUnknown_030033E8
_0802D180: .4byte gUnknown_03000558
_0802D184:
	ldr r0, _0802D19C @ =gUnknown_03000558
	strb r1, [r0]
_0802D188:
	movs r0, #0
	bl sub_08029948
	bl sub_0801A168
	bl sub_08034F7C
	pop {r0}
	bx r0
	.align 2, 0
_0802D19C: .4byte gUnknown_03000558

