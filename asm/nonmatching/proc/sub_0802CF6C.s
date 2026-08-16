	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802CF6C
sub_0802CF6C: @ 0x0802CF6C
	push {lr}
	bl sub_0801A168
	bl sub_08042B9C
	ldr r1, _0802CF90 @ =gUnknown_03003FC0
	adds r0, r1, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802CF8C
	adds r0, r1, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	bl sub_080344F0
_0802CF8C:
	pop {r0}
	bx r0
	.align 2, 0
_0802CF90: .4byte gUnknown_03003FC0

