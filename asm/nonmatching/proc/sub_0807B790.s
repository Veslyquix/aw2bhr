	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807B790
sub_0807B790: @ 0x0807B790
	push {lr}
	ldr r0, _0807B7A0 @ =gUnknown_08615FB4
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0807B7A0: .4byte gUnknown_08615FB4

