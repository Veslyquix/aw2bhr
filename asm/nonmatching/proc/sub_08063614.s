	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08063614
sub_08063614: @ 0x08063614
	mov r2, pc
	lsrs r2, r2, #0x18
	movs r1, #0xc
	cmp r2, #2
	beq _08063626
	movs r1, #0xd
	cmp r2, #8
	beq _08063626
	movs r1, #4
_08063626:
	subs r0, r0, r1
	bgt _08063626
	bx lr

