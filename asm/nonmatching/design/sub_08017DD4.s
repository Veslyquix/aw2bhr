	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08017DD4
sub_08017DD4: @ 0x08017DD4
	push {r4, lr}
	ldr r1, _08017E08 @ =gUnknown_0200C528
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r1, #4
	adds r4, r4, r1
	ldr r2, [r4]
	movs r1, #8
	ldrsh r0, [r2, r1]
	movs r3, #0xa
	ldrsh r1, [r2, r3]
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	bl sub_08025C98
	ldr r0, [r4]
	adds r0, #0x10
	str r0, [r4]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08017E08: .4byte gUnknown_0200C528

