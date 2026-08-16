	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078480
sub_08078480: @ 0x08078480
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08078494 @ =gUnknown_0861598C
	bl Proc_StartBlocking
	str r4, [r0, #0x54]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078494: .4byte gUnknown_0861598C

