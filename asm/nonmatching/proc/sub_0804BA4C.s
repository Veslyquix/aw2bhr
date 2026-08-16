	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804BA4C
sub_0804BA4C: @ 0x0804BA4C
	movs r0, #0
_0804BA4E:
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x27
	bls _0804BA4E
	ldr r1, _0804BA60 @ =gUnknown_03002F18
	ldrh r0, [r1]
	strh r0, [r1]
	bx lr
	.align 2, 0
_0804BA60: .4byte gUnknown_03002F18

