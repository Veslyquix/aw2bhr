	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808AC44
sub_0808AC44: @ 0x0808AC44
	adds r2, r1, #0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bhi _0808AC78
	ldr r0, _0808AC68 @ =gUnknown_03000F70
	strb r1, [r0]
	ldr r1, _0808AC6C @ =gUnknown_03000F78
	ldrb r0, [r0]
	lsls r0, r0, #2
	ldr r3, _0808AC70 @ =0x04000100
	adds r0, r0, r3
	str r0, [r1]
	ldr r0, _0808AC74 @ =sub_0808AC20
	str r0, [r2]
	movs r0, #0
	b _0808AC7A
	.align 2, 0
_0808AC68: .4byte gUnknown_03000F70
_0808AC6C: .4byte gUnknown_03000F78
_0808AC70: .4byte 0x04000100
_0808AC74: .4byte sub_0808AC20
_0808AC78:
	movs r0, #1
_0808AC7A:
	bx lr

