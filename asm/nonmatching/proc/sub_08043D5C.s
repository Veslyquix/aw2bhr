	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08043D5C
sub_08043D5C: @ 0x08043D5C
	push {lr}
	bl sub_08043D00
	ldr r1, _08043D6C @ =gUnknown_020288B0
	movs r0, #0
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08043D6C: .4byte gUnknown_020288B0

