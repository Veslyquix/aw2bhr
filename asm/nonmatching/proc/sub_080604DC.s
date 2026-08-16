	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080604DC
sub_080604DC: @ 0x080604DC
	push {lr}
	bl sub_08023348
	ldr r0, _080604F0 @ =gUnknown_0848925C
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080604F0: .4byte gUnknown_0848925C

