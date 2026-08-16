	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808AD24
sub_0808AD24: @ 0x0808AD24
	ldr r3, _0808AD54 @ =0x04000208
	movs r1, #0
	strh r1, [r3]
	ldr r2, _0808AD58 @ =gUnknown_03000F78
	ldr r0, [r2]
	strh r1, [r0]
	adds r0, #2
	str r0, [r2]
	strh r1, [r0]
	subs r0, #2
	str r0, [r2]
	ldr r2, _0808AD5C @ =0x04000200
	ldr r0, _0808AD60 @ =gUnknown_03000F70
	ldrb r0, [r0]
	movs r1, #8
	lsls r1, r0
	ldrh r0, [r2]
	bics r0, r1
	strh r0, [r2]
	ldr r0, _0808AD64 @ =gUnknown_03000F7C
	ldrh r0, [r0]
	strh r0, [r3]
	bx lr
	.align 2, 0
_0808AD54: .4byte 0x04000208
_0808AD58: .4byte gUnknown_03000F78
_0808AD5C: .4byte 0x04000200
_0808AD60: .4byte gUnknown_03000F70
_0808AD64: .4byte gUnknown_03000F7C

