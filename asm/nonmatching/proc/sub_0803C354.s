	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803C354
sub_0803C354: @ 0x0803C354
	push {lr}
	bl sub_0803CA70
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803C366
	movs r0, #1
	rsbs r0, r0, #0
	b _0803C378
_0803C366:
	movs r0, #5
	bl sub_0803CA9C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803C376
	movs r0, #1
	b _0803C378
_0803C376:
	movs r0, #0
_0803C378:
	pop {r1}
	bx r1

