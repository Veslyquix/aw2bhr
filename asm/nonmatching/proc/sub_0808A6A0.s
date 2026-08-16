	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808A6A0
sub_0808A6A0: @ 0x0808A6A0
	push {lr}
	sub sp, #8
	ldr r0, _0808A6C8 @ =gUnknown_08499578
	ldr r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0x41
	str r0, [sp, #4]
	movs r0, #6
	movs r1, #5
	movs r3, #0
	bl sub_08014740
	adds r0, #0x3a
	movs r1, #6
	strb r1, [r0]
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_0808A6C8: .4byte gUnknown_08499578

