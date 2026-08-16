	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C7B4
sub_0802C7B4: @ 0x0802C7B4
	push {lr}
	bl sub_0801A168
	ldr r1, _0802C7D4 @ =gUnknown_085C77A0
	ldr r0, _0802C7D8 @ =gUnknown_03003FC0
	ldrb r2, [r0, #2]
	movs r0, #0x5c
	muls r0, r2, r0
	adds r1, #8
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_080193B0
	pop {r0}
	bx r0
	.align 2, 0
_0802C7D4: .4byte gUnknown_085C77A0
_0802C7D8: .4byte gUnknown_03003FC0

