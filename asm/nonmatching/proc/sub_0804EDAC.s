	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804EDAC
sub_0804EDAC: @ 0x0804EDAC
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldr r1, _0804EDFC @ =gUnknown_03001470
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #5
	adds r1, #0x28
	adds r2, r0, r1
	ldr r0, [r2]
	adds r0, #1
	str r0, [r2]
	cmp r0, #0x90
	bne _0804EDD4
	movs r0, #0
	str r0, [r2]
_0804EDD4:
	ldr r0, _0804EE00 @ =gUnknown_085523E0
	ldr r2, [r2]
	lsls r2, r2, #1
	adds r2, r2, r0
	ldr r3, _0804EE04 @ =gUnknown_02029A10
	lsls r1, r4, #3
	adds r1, r1, r4
	lsls r1, r1, #2
	movs r0, #0xb4
	muls r0, r5, r0
	adds r1, r1, r0
	adds r1, r1, r3
	movs r3, #0
	ldrsh r0, [r2, r3]
	ldrh r2, [r1, #0xa]
	adds r0, r0, r2
	strh r0, [r1, #0xa]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804EDFC: .4byte gUnknown_03001470
_0804EE00: .4byte gUnknown_085523E0
_0804EE04: .4byte gUnknown_02029A10

