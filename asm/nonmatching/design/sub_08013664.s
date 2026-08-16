	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08013664
sub_08013664: @ 0x08013664
	push {r4, lr}
	adds r4, r1, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r3, _08013684 @ =gPal
	ldr r1, _08013688 @ =0x0000FFFE
	ands r1, r4
	adds r1, r1, r3
	bl sub_08011C58
	bl sub_080135A4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013684: .4byte gPal
_08013688: .4byte 0x0000FFFE

