	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803EF44
sub_0803EF44: @ 0x0803EF44
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _0803EF6C @ =gUnknown_0849F7F0
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0802909C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803EF6C: .4byte gUnknown_0849F7F0

