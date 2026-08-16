	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08084544
sub_08084544: @ 0x08084544
	adds r2, r0, #0
	adds r2, #0x48
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08084562
	ldr r1, _08084574 @ =gUnknown_0300200C
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r1, _08084578 @ =gUnknown_03002000
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_08084562:
	ldr r0, _0808457C @ =gUnknown_03001FF8
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	bx lr
	.align 2, 0
_08084574: .4byte gUnknown_0300200C
_08084578: .4byte gUnknown_03002000
_0808457C: .4byte gUnknown_03001FF8

