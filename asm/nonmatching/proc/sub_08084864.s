	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08084864
sub_08084864: @ 0x08084864
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08084858
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08084880
	ldr r1, _0808487C @ =gUnknown_0823DC38
	lsls r0, r4, #5
	adds r0, r0, r1
	b _08084882
	.align 2, 0
_0808487C: .4byte gUnknown_0823DC38
_08084880:
	ldr r0, _08084888 @ =gUnknown_0812596C
_08084882:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08084888: .4byte gUnknown_0812596C

