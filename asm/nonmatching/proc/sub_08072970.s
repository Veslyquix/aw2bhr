	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072970
sub_08072970: @ 0x08072970
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08072988 @ =gUnknown_08613F34
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	str r5, [r0, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08072988: .4byte gUnknown_08613F34

