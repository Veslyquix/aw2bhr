	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080199D0
sub_080199D0: @ 0x080199D0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080199DC @ =gUnknown_03002EE4
	strh r0, [r1]
	bx lr
	.align 2, 0
_080199DC: .4byte gUnknown_03002EE4

