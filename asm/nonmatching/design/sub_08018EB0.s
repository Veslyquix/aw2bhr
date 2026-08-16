	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08018EB0
sub_08018EB0: @ 0x08018EB0
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	bl sub_0802C550
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08018ED6
	ldr r2, _08018EE0 @ =gUnknown_0200C528
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r2, #4
	adds r1, r1, r2
	ldr r0, [r1]
	adds r0, #0x10
	str r0, [r1]
_08018ED6:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08018EE0: .4byte gUnknown_0200C528

