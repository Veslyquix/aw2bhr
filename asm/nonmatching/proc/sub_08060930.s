	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08060930
sub_08060930: @ 0x08060930
	push {r4, lr}
	ldr r0, _08060964 @ =gUnknown_030046C0
	ldrb r0, [r0, #6]
	cmp r0, #0
	bne _0806095C
	ldr r4, _08060968 @ =gUnknown_030046B8
	ldrb r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0806094A
	bl sub_0806096C
_0806094A:
	bl sub_080609B8
	ldrb r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0806095C
	bl sub_08060A20
_0806095C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060964: .4byte gUnknown_030046C0
_08060968: .4byte gUnknown_030046B8

