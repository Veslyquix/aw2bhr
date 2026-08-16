	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08060A7C
sub_08060A7C: @ 0x08060A7C
	push {r4, lr}
	ldr r4, _08060AA8 @ =gUnknown_030046C0
	ldrb r0, [r4, #6]
	cmp r0, #0
	bne _08060AA2
	movs r0, #0x18
	bl sub_08057FA8
	ldr r1, _08060AAC @ =gUnknown_030045D8
	ldr r1, [r1]
	cmp r1, r0
	ble _08060AA2
	movs r0, #6
	bl sub_08060ED4
	cmp r0, #0
	beq _08060AA2
	movs r0, #0x18
	strb r0, [r4, #6]
_08060AA2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060AA8: .4byte gUnknown_030046C0
_08060AAC: .4byte gUnknown_030045D8

