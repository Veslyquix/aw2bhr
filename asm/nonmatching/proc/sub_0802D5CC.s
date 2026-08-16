	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802D5CC
sub_0802D5CC: @ 0x0802D5CC
	push {lr}
	ldr r2, _0802D5E4 @ =gUnknown_080D4188
	lsls r0, r0, #5
	adds r0, r0, r2
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x10
	movs r2, #0x20
	bl sub_08013618
	pop {r0}
	bx r0
	.align 2, 0
_0802D5E4: .4byte gUnknown_080D4188

