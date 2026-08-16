	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807A970
sub_0807A970: @ 0x0807A970
	push {lr}
	ldr r0, _0807A980 @ =gUnknown_08615CB0
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0807A980: .4byte gUnknown_08615CB0

