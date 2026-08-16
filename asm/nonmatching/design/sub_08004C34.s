	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08004C34
sub_08004C34: @ 0x08004C34
	push {lr}
	bl sub_0801A614
	bl sub_0801A168
	bl sub_08024268
	ldr r0, _08004C58 @ =gUnknown_08487C04
	movs r1, #2
	movs r2, #3
	movs r3, #0
	bl sub_0801A148
	bl sub_08004C10
	pop {r0}
	bx r0
	.align 2, 0
_08004C58: .4byte gUnknown_08487C04

