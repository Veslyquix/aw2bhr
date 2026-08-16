	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806F6D8
sub_0806F6D8: @ 0x0806F6D8
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x64
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0x2f
	ble _0806F704
	ldr r1, [r4, #0x58]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0806F6FC
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	bl sub_0803B524
_0806F6FC:
	adds r0, r4, #0
	bl Proc_Break
	b _0806F708
_0806F704:
	adds r0, r2, #1
	strh r0, [r1]
_0806F708:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

