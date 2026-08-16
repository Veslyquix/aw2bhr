	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808006C
sub_0808006C: @ 0x0808006C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808008C @ =gUnknown_086167EC
	bl Proc_Find
	cmp r0, #0
	bne _08080086
	ldr r0, _08080090 @ =gUnknown_030033EC
	ldrh r0, [r0]
	str r0, [r4, #0x58]
	adds r0, r4, #0
	bl Proc_Break
_08080086:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808008C: .4byte gUnknown_086167EC
_08080090: .4byte gUnknown_030033EC

