	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08011704
sub_08011704: @ 0x08011704
	push {r4, lr}
	adds r4, r1, #0
	adds r3, r2, #0
	lsls r4, r4, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x17
	movs r1, #0xff
	lsls r1, r1, #0x10
	ands r1, r4
	lsrs r1, r1, #0x10
	ldr r2, _08011728 @ =gUnknown_0848930C
	bl sub_0801BD00
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011728: .4byte gUnknown_0848930C

