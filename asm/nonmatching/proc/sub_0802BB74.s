	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802BB74
sub_0802BB74: @ 0x0802BB74
	push {lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x17
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r3, #0
	orrs r1, r2
	ldr r2, _0802BB94 @ =gUnknown_0849A3B8
	movs r3, #0x1c
	bl sub_0801BD00
	pop {r0}
	bx r0
	.align 2, 0
_0802BB94: .4byte gUnknown_0849A3B8

