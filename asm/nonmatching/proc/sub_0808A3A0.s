	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808A3A0
sub_0808A3A0: @ 0x0808A3A0
	adds r2, r0, #0
	adds r2, #0x48
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0808A3BE
	ldr r1, _0808A3D0 @ =gUnknown_0300200C
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r1, _0808A3D4 @ =gUnknown_03002000
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_0808A3BE:
	ldr r0, _0808A3D8 @ =gUnknown_03001FF8
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	bx lr
	.align 2, 0
_0808A3D0: .4byte gUnknown_0300200C
_0808A3D4: .4byte gUnknown_03002000
_0808A3D8: .4byte gUnknown_03001FF8

