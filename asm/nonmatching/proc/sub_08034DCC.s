	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034DCC
sub_08034DCC: @ 0x08034DCC
	push {lr}
	ldr r0, _08034DEC @ =gUnknown_03004080
	ldrh r0, [r0]
	cmp r0, #1
	beq _08034DDE
	ldr r0, _08034DF0 @ =gUnknown_030033EC
	ldrb r0, [r0]
	bl sub_08043DAC
_08034DDE:
	bl sub_08074460
	ldr r1, _08034DF4 @ =gUnknown_030032D8
	movs r0, #6
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08034DEC: .4byte gUnknown_03004080
_08034DF0: .4byte gUnknown_030033EC
_08034DF4: .4byte gUnknown_030032D8

