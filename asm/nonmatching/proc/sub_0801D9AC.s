	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801D9AC
sub_0801D9AC: @ 0x0801D9AC
	push {r4, lr}
	adds r3, r1, #0
	adds r4, r2, #0
	ldr r2, _0801D9E0 @ =gUnknown_0200E438
	movs r1, #0x4c
	muls r0, r1, r0
	adds r2, r0, r2
	ldr r1, [r2, #0x14]
	ldr r0, [r2, #0xc]
	adds r0, r1, r0
	cmp r0, #0
	bge _0801D9C6
	adds r0, #0xff
_0801D9C6:
	asrs r0, r0, #8
	strh r0, [r3]
	ldr r1, [r2, #0x18]
	ldr r0, [r2, #0x10]
	adds r0, r1, r0
	cmp r0, #0
	bge _0801D9D6
	adds r0, #0xff
_0801D9D6:
	asrs r0, r0, #8
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801D9E0: .4byte gUnknown_0200E438

