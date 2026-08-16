	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802759C
sub_0802759C: @ 0x0802759C
	push {lr}
	ldr r0, _080275B0 @ =gUnknown_08499CFC
	bl Proc_Find
	cmp r0, #0
	beq _080275AA
	movs r0, #1
_080275AA:
	pop {r1}
	bx r1
	.align 2, 0
_080275B0: .4byte gUnknown_08499CFC

