	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804018C
sub_0804018C: @ 0x0804018C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080401A0 @ =gUnknown_0849FB44
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080401A0: .4byte gUnknown_0849FB44

