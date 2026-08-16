	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801DA14
sub_0801DA14: @ 0x0801DA14
	push {r4, lr}
	adds r3, r1, #0
	adds r4, r2, #0
	ldr r2, _0801DA40 @ =gUnknown_0200E438
	movs r1, #0x4c
	muls r0, r1, r0
	adds r1, r0, r2
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bge _0801DA2A
	adds r0, #0xff
_0801DA2A:
	asrs r0, r0, #8
	strh r0, [r3]
	ldr r0, [r1, #0x10]
	cmp r0, #0
	bge _0801DA36
	adds r0, #0xff
_0801DA36:
	asrs r0, r0, #8
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801DA40: .4byte gUnknown_0200E438

