	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08017E80
sub_08017E80: @ 0x08017E80
	ldr r1, _08017E88 @ =gUnknown_03001404
	movs r0, #0
	strh r0, [r1]
	bx lr
	.align 2, 0
_08017E88: .4byte gUnknown_03001404

