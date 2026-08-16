	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08044BA0
sub_08044BA0: @ 0x08044BA0
	cmp r0, #0xe
	bgt _08044BAC
	cmp r0, #0xa
	blt _08044BAC
	movs r0, #1
	b _08044BAE
_08044BAC:
	movs r0, #0
_08044BAE:
	bx lr

