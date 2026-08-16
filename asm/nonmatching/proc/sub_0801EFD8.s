	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801EFD8
sub_0801EFD8: @ 0x0801EFD8
	push {lr}
	ldr r0, _0801EFEC @ =gUnknown_030025A0
	ldr r1, _0801EFF0 @ =0x07000080
	movs r2, #0xe0
	lsls r2, r2, #2
	bl sub_08011C90
	pop {r0}
	bx r0
	.align 2, 0
_0801EFEC: .4byte gUnknown_030025A0
_0801EFF0: .4byte 0x07000080

