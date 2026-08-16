	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803F510
sub_0803F510: @ 0x0803F510
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _0803F53C @ =gUnknown_0849F940
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	adds r4, #1
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r5, #1
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0802909C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803F53C: .4byte gUnknown_0849F940

