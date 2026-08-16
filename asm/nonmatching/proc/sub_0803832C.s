	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803832C
sub_0803832C: @ 0x0803832C
	push {r4, lr}
	ldr r4, _08038348 @ =gUnknown_03003FC0
	ldrb r0, [r4, #2]
	movs r1, #1
	bl sub_0803CA28
	ldrb r0, [r4, #1]
	cmp r0, #2
	beq _08038358
	cmp r0, #2
	bgt _0803834C
	cmp r0, #1
	beq _08038352
	b _08038362
	.align 2, 0
_08038348: .4byte gUnknown_03003FC0
_0803834C:
	cmp r0, #3
	beq _0803835E
	b _08038362
_08038352:
	bl sub_08038484
	b _08038362
_08038358:
	bl sub_08038548
	b _08038362
_0803835E:
	bl sub_08038568
_08038362:
	pop {r4}
	pop {r0}
	bx r0

