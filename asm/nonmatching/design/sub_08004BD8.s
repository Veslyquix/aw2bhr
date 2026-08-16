	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08004BD8
sub_08004BD8: @ 0x08004BD8
	push {lr}
	bl sub_0801A168
	movs r0, #9
	bl sub_0800056C
	ldr r0, _08004BF8 @ =gUnknown_0200B0B0
	ldr r0, [r0]
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r1
	cmp r0, #0
	beq _08004C00
	ldr r0, _08004BFC @ =gUnknown_08487B64
	b _08004C02
	.align 2, 0
_08004BF8: .4byte gUnknown_0200B0B0
_08004BFC: .4byte gUnknown_08487B64
_08004C00:
	ldr r0, _08004C0C @ =gUnknown_08487AC4
_08004C02:
	bl sub_080193B0
	pop {r0}
	bx r0
	.align 2, 0
_08004C0C: .4byte gUnknown_08487AC4

