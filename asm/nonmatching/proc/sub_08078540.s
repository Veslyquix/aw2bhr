	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078540
sub_08078540: @ 0x08078540
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08078554 @ =gUnknown_08615AAC
	bl Proc_StartBlocking
	str r4, [r0, #0x54]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078554: .4byte gUnknown_08615AAC

