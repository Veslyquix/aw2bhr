	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08018800
sub_08018800: @ 0x08018800
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r1, _08018830 @ =gUnknown_03003FC0
	movs r0, #0
	strb r0, [r1, #5]
	bl sub_0802DCA4
	ldr r0, _08018834 @ =gUnknown_0200C528
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	adds r0, #0x10
	str r0, [r1]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08018830: .4byte gUnknown_03003FC0
_08018834: .4byte gUnknown_0200C528

