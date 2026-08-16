	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808AC20
sub_0808AC20: @ 0x0808AC20
	ldr r1, _0808AC3C @ =gUnknown_03000F72
	ldrh r0, [r1]
	cmp r0, #0
	beq _0808AC3A
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0808AC3A
	ldr r1, _0808AC40 @ =gUnknown_03000F74
	movs r0, #1
	strb r0, [r1]
_0808AC3A:
	bx lr
	.align 2, 0
_0808AC3C: .4byte gUnknown_03000F72
_0808AC40: .4byte gUnknown_03000F74

