	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807813C
sub_0807813C: @ 0x0807813C
	push {lr}
	ldr r0, _0807814C @ =gUnknown_0861485C
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0807814C: .4byte gUnknown_0861485C

