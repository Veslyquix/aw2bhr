	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08073918
sub_08073918: @ 0x08073918
	push {lr}
	ldr r0, _0807392C @ =gUnknown_086141B4
	bl Proc_Find
	cmp r0, #0
	beq _08073926
	movs r0, #1
_08073926:
	pop {r1}
	bx r1
	.align 2, 0
_0807392C: .4byte gUnknown_086141B4

