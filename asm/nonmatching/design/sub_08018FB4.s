	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08018FB4
sub_08018FB4: @ 0x08018FB4
	push {r4, lr}
	ldr r1, _08018FE0 @ =gUnknown_0200C528
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r1, #4
	adds r4, r4, r1
	ldr r0, [r4]
	ldrb r0, [r0, #8]
	movs r1, #0x80
	bl sub_08019940
	ldr r0, [r4]
	adds r0, #0x10
	str r0, [r4]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08018FE0: .4byte gUnknown_0200C528

