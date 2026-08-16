	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080729AC
sub_080729AC: @ 0x080729AC
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, _080729C8 @ =gUnknown_08614014
	bl Proc_StartBlocking
	adds r4, r0, #0
	bl sub_08034F6C
	adds r4, #0x64
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080729C8: .4byte gUnknown_08614014

