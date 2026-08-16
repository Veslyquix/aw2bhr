	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803866C
sub_0803866C: @ 0x0803866C
	push {lr}
	ldr r0, _08038684 @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	cmp r0, #1
	bne _08038688
	movs r0, #0x60
	bl sub_0803CBD8
	cmp r0, #0
	beq _08038688
	movs r0, #1
	b _0803868A
	.align 2, 0
_08038684: .4byte gUnknown_03003FC0
_08038688:
	movs r0, #0
_0803868A:
	pop {r1}
	bx r1
	.align 2, 0

