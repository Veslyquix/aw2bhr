	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B264
sub_0803B264: @ 0x0803B264
	push {r4, r5, lr}
	ldr r5, _0803B2B8 @ =gUnknown_03001FBC
	movs r1, #0
	ldrsh r0, [r5, r1]
	bl sub_08015900
	adds r1, r0, #0
	lsls r1, r1, #0x10
	movs r2, #0
	ldrsh r0, [r5, r2]
	movs r2, #0x80
	lsls r2, r2, #0xd
	adds r1, r1, r2
	asrs r1, r1, #0x10
	bl sub_080158D4
	movs r1, #0
	ldrsh r0, [r5, r1]
	bl sub_080157D0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x80
	beq _0803B2B0
	adds r4, r0, #0
	subs r4, #0x10
	movs r2, #0
	ldrsh r0, [r5, r2]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r1, r4, #0
	bl sub_080157A4
	movs r1, #0
	ldrsh r0, [r5, r1]
	adds r1, r4, #0
	bl sub_080157F4
_0803B2B0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803B2B8: .4byte gUnknown_03001FBC

