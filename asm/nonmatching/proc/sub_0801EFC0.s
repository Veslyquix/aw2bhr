	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801EFC0
sub_0801EFC0: @ 0x0801EFC0
	push {lr}
	ldr r0, _0801EFD4 @ =gUnknown_03002520
	movs r1, #0xe0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #3
	bl sub_08011C90
	pop {r0}
	bx r0
	.align 2, 0
_0801EFD4: .4byte gUnknown_03002520

