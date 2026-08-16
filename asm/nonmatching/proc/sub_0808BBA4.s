	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808BBA4
sub_0808BBA4: @ 0x0808BBA4
	push {lr}
	ldr r1, _0808BBB8 @ =gUnknown_03000F80
	ldr r0, [r1]
	cmp r0, #0
	bne _0808BBB6
	movs r0, #1
	str r0, [r1]
	bl sub_0808BB58
_0808BBB6:
	pop {pc}
	.align 2, 0
_0808BBB8: .4byte gUnknown_03000F80

	.align 2, 0
