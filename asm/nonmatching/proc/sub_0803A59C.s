	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803A59C
sub_0803A59C: @ 0x0803A59C
	push {lr}
	ldr r0, _0803A5B0 @ =gUnknown_0849E240
	bl sub_0801537C
	ldr r0, _0803A5B4 @ =gUnknown_0849E280
	bl sub_0801537C
	pop {r0}
	bx r0
	.align 2, 0
_0803A5B0: .4byte gUnknown_0849E240
_0803A5B4: .4byte gUnknown_0849E280

