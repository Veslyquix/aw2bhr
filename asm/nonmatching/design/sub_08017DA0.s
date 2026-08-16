	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08017DA0
sub_08017DA0: @ 0x08017DA0
	push {r4, lr}
	ldr r2, _08017DC8 @ =gUnknown_0200C528
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r2, #4
	adds r4, r1, r2
	ldr r0, [r4]
	ldr r0, [r0, #4]
	bl Proc_Find
	cmp r0, #0
	bne _08017DCC
	ldr r0, [r4]
	adds r0, #0x10
	str r0, [r4]
	movs r0, #1
	b _08017DCE
	.align 2, 0
_08017DC8: .4byte gUnknown_0200C528
_08017DCC:
	movs r0, #0
_08017DCE:
	pop {r4}
	pop {r1}
	bx r1

