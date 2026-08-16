	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08066078
sub_08066078: @ 0x08066078
	push {r4, lr}
	ldr r0, _080660B8 @ =gUnknown_08580934
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r1, #0x44
	adds r1, r1, r0
	ldr r4, [r1]
	movs r1, #0x28
	ldrsh r0, [r4, r1]
	adds r0, #9
	movs r2, #0x2a
	ldrsh r1, [r4, r2]
	adds r1, #8
	bl sub_08064474
	movs r1, #0x28
	ldrsh r0, [r4, r1]
	adds r0, #9
	movs r2, #0x2a
	ldrsh r1, [r4, r2]
	adds r1, #0x28
	bl sub_08064500
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080660B8: .4byte gUnknown_08580934

