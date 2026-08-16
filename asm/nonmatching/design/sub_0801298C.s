	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801298C
sub_0801298C: @ 0x0801298C
	ldr r1, _080129A8 @ =gUnknown_03002B2C
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080129AC @ =0x04000050
	movs r2, #0
	movs r0, #0x8f
	strh r0, [r1]
	ldr r0, _080129B0 @ =0x04000052
	strh r2, [r0]
	adds r1, #4
	movs r0, #8
	strh r0, [r1]
	bx lr
	.align 2, 0
_080129A8: .4byte gUnknown_03002B2C
_080129AC: .4byte 0x04000050
_080129B0: .4byte 0x04000052

