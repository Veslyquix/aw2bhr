	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801903C
sub_0801903C: @ 0x0801903C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl sub_0803B5E8
	ldr r0, _08019068 @ =gUnknown_0200C528
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
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08019068: .4byte gUnknown_0200C528

