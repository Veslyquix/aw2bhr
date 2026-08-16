	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801B768
sub_0801B768: @ 0x0801B768
	ldr r2, _0801B77C @ =gUnknown_03002B80
	adds r0, #1
	movs r3, #0xd6
	lsls r3, r3, #2
	adds r1, r2, r3
	strh r0, [r1]
	movs r0, #1
	strb r0, [r2]
	bx lr
	.align 2, 0
_0801B77C: .4byte gUnknown_03002B80

