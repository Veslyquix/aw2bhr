	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08011BC4
sub_08011BC4: @ 0x08011BC4
	ldr r0, _08011BD0 @ =gUnknown_03002F30
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bx lr
	.align 2, 0
_08011BD0: .4byte gUnknown_03002F30

