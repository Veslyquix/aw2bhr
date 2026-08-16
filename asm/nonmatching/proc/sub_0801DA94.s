	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801DA94
sub_0801DA94: @ 0x0801DA94
	movs r1, #0
	ldr r3, _0801DAAC @ =gUnknown_03001430
	movs r2, #0
_0801DA9A:
	lsls r0, r1, #1
	adds r0, r0, r3
	strh r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0x1f
	bls _0801DA9A
	bx lr
	.align 2, 0
_0801DAAC: .4byte gUnknown_03001430

