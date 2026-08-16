	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08035020
sub_08035020: @ 0x08035020
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r4, #0
	movs r1, #0x48
	bl sub_0803F5E4
	ldr r0, _08035048 @ =gUnknown_0849BD20
	lsls r4, r4, #3
	adds r4, r4, r0
	ldr r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	bl sub_08013618
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08035048: .4byte gUnknown_0849BD20

