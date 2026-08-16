	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801F0E0
sub_0801F0E0: @ 0x0801F0E0
	push {lr}
	ldr r0, _0801F0F0 @ =gUnknown_03001FE0
	ldr r0, [r0]
	cmp r0, #0
	beq _0801F0F4
	bl sub_0801BBC4
	b _0801F0F8
	.align 2, 0
_0801F0F0: .4byte gUnknown_03001FE0
_0801F0F4:
	bl sub_0801EFD8
_0801F0F8:
	pop {r0}
	bx r0

