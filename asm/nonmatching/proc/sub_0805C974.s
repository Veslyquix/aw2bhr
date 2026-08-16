	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805C974
sub_0805C974: @ 0x0805C974
	ldr r0, _0805C980 @ =gUnknown_030040DC
	ldrb r0, [r0]
	cmp r0, #1
	beq _0805C984
	movs r0, #0
	b _0805C986
	.align 2, 0
_0805C980: .4byte gUnknown_030040DC
_0805C984:
	movs r0, #1
_0805C986:
	bx lr

