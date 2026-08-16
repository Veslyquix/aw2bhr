	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08025580
sub_08025580: @ 0x08025580
	push {r4, r5, lr}
	ldr r4, _08025594 @ =gUnknown_030032C0
	ldrh r5, [r4]
	bl sub_080254AC
	strh r5, [r4]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08025594: .4byte gUnknown_030032C0

