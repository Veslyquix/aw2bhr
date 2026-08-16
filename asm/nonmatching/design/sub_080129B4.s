	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080129B4
sub_080129B4: @ 0x080129B4
	ldr r1, _080129CC @ =gUnknown_03002B2C
	ldrh r2, [r1]
	movs r0, #1
	subs r0, r0, r2
	strh r0, [r1]
	ldr r2, _080129D0 @ =0x04000050
	ldrh r0, [r1]
	lsls r0, r0, #6
	movs r1, #0x8f
	orrs r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_080129CC: .4byte gUnknown_03002B2C
_080129D0: .4byte 0x04000050

