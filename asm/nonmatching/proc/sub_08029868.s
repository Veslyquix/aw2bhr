	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08029868
sub_08029868: @ 0x08029868
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bgt _0802987C
	cmp r0, #1
	blt _0802987C
	movs r0, #0x50
	bl sub_0803B4DC
_0802987C:
	pop {r0}
	bx r0

