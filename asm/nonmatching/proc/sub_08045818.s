	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045818
sub_08045818: @ 0x08045818
	push {lr}
	movs r0, #4
	bl sub_0803E388
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804582A
	movs r0, #0
	b _0804582C
_0804582A:
	movs r0, #1
_0804582C:
	pop {r1}
	bx r1

