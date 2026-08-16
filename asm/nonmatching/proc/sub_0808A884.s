	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808A884
sub_0808A884: @ 0x0808A884
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08019260
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808A89A
	ldr r0, _0808A8B8 @ =gUnknown_08617094
	adds r1, r4, #0
	bl Proc_Start
_0808A89A:
	ldr r0, _0808A8BC @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0808A8B0
	ldr r0, _0808A8B8 @ =gUnknown_08617094
	adds r1, r4, #0
	bl Proc_Start
_0808A8B0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A8B8: .4byte gUnknown_08617094
_0808A8BC: .4byte gpKeySt

