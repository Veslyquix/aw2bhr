	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803D978
sub_0803D978: @ 0x0803D978
	push {lr}
	ldr r0, _0803D98C @ =gUnknown_084C3138
	bl Proc_Find
	cmp r0, #0
	bne _0803D988
	bl sub_0803B7B4
_0803D988:
	pop {r0}
	bx r0
	.align 2, 0
_0803D98C: .4byte gUnknown_084C3138

