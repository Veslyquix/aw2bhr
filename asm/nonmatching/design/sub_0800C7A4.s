	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800C7A4
sub_0800C7A4: @ 0x0800C7A4
	cmp r0, #0x48
	beq _0800C7C0
	cmp r0, #0x48
	bgt _0800C7B2
	cmp r0, #0x28
	beq _0800C7BC
	b _0800C7E2
_0800C7B2:
	cmp r0, #0x68
	beq _0800C7C4
	cmp r0, #0x88
	beq _0800C7C8
	b _0800C7E2
_0800C7BC:
	movs r3, #0
	b _0800C7CA
_0800C7C0:
	movs r3, #1
	b _0800C7CA
_0800C7C4:
	movs r3, #2
	b _0800C7CA
_0800C7C8:
	movs r3, #3
_0800C7CA:
	ldr r2, _0800C7E4 @ =gUnknown_0200B0B0
	ldr r0, [r2]
	adds r0, #0x17
	adds r0, r0, r3
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x1b
	adds r0, r0, r3
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r0]
_0800C7E2:
	bx lr
	.align 2, 0
_0800C7E4: .4byte gUnknown_0200B0B0

