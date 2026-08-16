	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808488C
sub_0808488C: @ 0x0808488C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08084858
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080848A8
	ldr r1, _080848A4 @ =gUnknown_0823DC38
	adds r0, r4, #6
	lsls r0, r0, #5
	adds r0, r0, r1
	b _080848AA
	.align 2, 0
_080848A4: .4byte gUnknown_0823DC38
_080848A8:
	ldr r0, _080848B0 @ =gUnknown_0812598C
_080848AA:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080848B0: .4byte gUnknown_0812598C

