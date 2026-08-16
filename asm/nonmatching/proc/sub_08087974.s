	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08087974
sub_08087974: @ 0x08087974
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r4, _0808798C @ =gUnknown_08616DB4
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	beq _08087990
	bl sub_080879A0
	b _0808799A
	.align 2, 0
_0808798C: .4byte gUnknown_08616DB4
_08087990:
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	str r6, [r0, #0x54]
_0808799A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

