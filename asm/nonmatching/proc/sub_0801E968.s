	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801E968
sub_0801E968: @ 0x0801E968
	push {r4, r5, lr}
	ldr r5, _0801E99C @ =gUnknown_03000550
	ldr r2, _0801E9A0 @ =gUnknown_0200E438
	ldr r3, _0801E9A4 @ =gUnknown_03001470
	ldr r4, _0801E9A8 @ =gUnknown_0300054E
	movs r0, #0
	ldrsh r1, [r4, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r3
	ldrh r1, [r0, #0x26]
	movs r0, #0x4c
	muls r0, r1, r0
	adds r2, #0x44
	adds r0, r0, r2
	ldr r2, [r0]
	str r2, [r5]
	movs r1, #0
	ldrsh r0, [r4, r1]
	ldr r1, _0801E9AC @ =gUnknown_03000548
	bl _call_via_r2
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801E99C: .4byte gUnknown_03000550
_0801E9A0: .4byte gUnknown_0200E438
_0801E9A4: .4byte gUnknown_03001470
_0801E9A8: .4byte gUnknown_0300054E
_0801E9AC: .4byte gUnknown_03000548

