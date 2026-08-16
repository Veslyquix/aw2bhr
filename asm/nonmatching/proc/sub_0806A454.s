	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806A454
sub_0806A454: @ 0x0806A454
	push {lr}
	bl sub_0803B588
	ldr r0, _0806A46C @ =gUnknown_0202F204
	movs r1, #0
	strb r1, [r0]
	ldr r0, _0806A470 @ =gUnknown_08581500
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0806A46C: .4byte gUnknown_0202F204
_0806A470: .4byte gUnknown_08581500

