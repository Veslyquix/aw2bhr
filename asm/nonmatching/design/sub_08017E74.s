	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08017E74
sub_08017E74: @ 0x08017E74
	ldr r1, _08017E7C @ =gUnknown_03001404
	movs r0, #1
	strh r0, [r1]
	bx lr
	.align 2, 0
_08017E7C: .4byte gUnknown_03001404

