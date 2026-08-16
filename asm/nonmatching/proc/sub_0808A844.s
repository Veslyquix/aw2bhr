	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808A844
sub_0808A844: @ 0x0808A844
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808A87C @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808A876
	bl sub_08013C00
	bl sub_08013AEC
	adds r0, r4, #0
	bl sub_08014BC0
	ldr r0, _0808A880 @ =gUnknown_084A0D58
	bl sub_080193B0
	movs r0, #0
	bl sub_0801A5B0
	adds r0, r4, #0
	bl Proc_Break
_0808A876:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A87C: .4byte gpKeySt
_0808A880: .4byte gUnknown_084A0D58

