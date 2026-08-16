	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808AD6C
sub_0808AD6C: @ 0x0808AD6C
	adds r2, r0, #0
	ldr r1, _0808AD84 @ =gUnknown_03000F6C
	adds r0, r2, #1
	str r0, [r1]
	ldr r3, _0808AD88 @ =sub_0808AD68
	movs r0, #1
	eors r3, r0
	ldr r0, _0808AD8C @ =sub_0808AD6C
	ldr r1, _0808AD88 @ =sub_0808AD68
	subs r0, r0, r1
	lsls r0, r0, #0xf
	b _0808AD9C
	.align 2, 0
_0808AD84: .4byte gUnknown_03000F6C
_0808AD88: .4byte sub_0808AD68
_0808AD8C: .4byte sub_0808AD6C
_0808AD90:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r0, r1, #1
	lsls r0, r0, #0x10
_0808AD9C:
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _0808AD90
	bx lr

