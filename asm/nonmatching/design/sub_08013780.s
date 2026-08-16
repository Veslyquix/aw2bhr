	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08013780
sub_08013780: @ 0x08013780
	push {r4, lr}
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsrs r3, r0, #0x10
	adds r0, r3, r1
	cmp r3, r0
	bge _080137A2
	ldr r4, _080137A8 @ =gUnknown_0200B5F4
	adds r1, r0, #0
_08013798:
	adds r0, r3, r4
	strb r2, [r0]
	adds r3, #1
	cmp r3, r1
	blt _08013798
_080137A2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080137A8: .4byte gUnknown_0200B5F4

