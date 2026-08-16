	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801DAE8
sub_0801DAE8: @ 0x0801DAE8
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0801DAFE
	ldr r0, _0801DB00 @ =gUnknown_03001430
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r0, #0
	strh r0, [r1]
_0801DAFE:
	bx lr
	.align 2, 0
_0801DB00: .4byte gUnknown_03001430

