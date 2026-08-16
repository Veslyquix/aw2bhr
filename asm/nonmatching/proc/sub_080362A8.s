	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080362A8
sub_080362A8: @ 0x080362A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080362CC @ =gUnknown_0849A00C
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _080362C6
	adds r1, r4, #0
	adds r1, #0x35
	movs r0, #2
	strb r0, [r1]
_080362C6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080362CC: .4byte gUnknown_0849A00C

