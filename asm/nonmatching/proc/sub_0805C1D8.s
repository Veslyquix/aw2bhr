	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805C1D8
sub_0805C1D8: @ 0x0805C1D8
	adds r2, r0, #0
	ldr r0, _0805C1F0 @ =gUnknown_0816D9D4
	ldr r3, [r0]
	ldr r1, [r3]
	cmp r1, #0x10
	bls _0805C1F4
	cmp r2, #2
	bne _0805C1F4
	movs r0, #1
	str r0, [r3]
	b _0805C206
	.align 2, 0
_0805C1F0: .4byte gUnknown_0816D9D4
_0805C1F4:
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #1
	bhi _0805C204
	cmp r2, #1
	bne _0805C204
	movs r0, #1
	b _0805C206
_0805C204:
	movs r0, #0
_0805C206:
	bx lr

