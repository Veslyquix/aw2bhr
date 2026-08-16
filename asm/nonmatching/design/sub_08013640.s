	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08013640
sub_08013640: @ 0x08013640
	push {r4, lr}
	adds r4, r1, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r3, _0801365C @ =gUnknown_030020C0
	ldr r1, _08013660 @ =0x0000FFFE
	ands r1, r4
	adds r1, r1, r3
	bl sub_08011C58
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801365C: .4byte gUnknown_030020C0
_08013660: .4byte 0x0000FFFE

