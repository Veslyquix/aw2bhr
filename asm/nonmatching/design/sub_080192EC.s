	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080192EC
sub_080192EC: @ 0x080192EC
	push {lr}
	ldr r2, _08019308 @ =gUnknown_0200C528
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	adds r0, r1, #0
	bl sub_080192C4
	pop {r0}
	bx r0
	.align 2, 0
_08019308: .4byte gUnknown_0200C528

