	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08081334
sub_08081334: @ 0x08081334
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08081350 @ =gUnknown_08616A40
	bl Proc_Find
	cmp r0, #0
	bne _0808134A
	ldr r0, _08081354 @ =gUnknown_08616A08
	adds r1, r4, #0
	bl Proc_Start
_0808134A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081350: .4byte gUnknown_08616A40
_08081354: .4byte gUnknown_08616A08

