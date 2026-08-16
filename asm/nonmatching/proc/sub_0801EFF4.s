	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801EFF4
sub_0801EFF4: @ 0x0801EFF4
	push {lr}
	ldr r0, _0801F008 @ =gUnknown_03002520
	movs r1, #0xe0
	lsls r1, r1, #0x13
	movs r2, #0x80
	bl sub_08011C90
	pop {r0}
	bx r0
	.align 2, 0
_0801F008: .4byte gUnknown_03002520

