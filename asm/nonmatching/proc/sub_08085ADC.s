	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08085ADC
sub_08085ADC: @ 0x08085ADC
	push {lr}
	ldr r0, _08085AF0 @ =gUnknown_08616B74
	bl Proc_Find
	cmp r0, #0
	beq _08085AEA
	movs r0, #1
_08085AEA:
	pop {r1}
	bx r1
	.align 2, 0
_08085AF0: .4byte gUnknown_08616B74

