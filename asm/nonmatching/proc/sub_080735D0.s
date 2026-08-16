	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080735D0
sub_080735D0: @ 0x080735D0
	push {lr}
	ldr r0, _080735E4 @ =gUnknown_08614134
	bl Proc_EndEach
	ldr r0, _080735E8 @ =sub_080735B0
	bl sub_08011AAC
	pop {r0}
	bx r0
	.align 2, 0
_080735E4: .4byte gUnknown_08614134
_080735E8: .4byte sub_080735B0

