	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034DB0
sub_08034DB0: @ 0x08034DB0
	push {lr}
	bl sub_0803B628
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08034DC2
	ldr r1, _08034DC8 @ =gUnknown_030032D8
	movs r0, #5
	strh r0, [r1]
_08034DC2:
	pop {r0}
	bx r0
	.align 2, 0
_08034DC8: .4byte gUnknown_030032D8

