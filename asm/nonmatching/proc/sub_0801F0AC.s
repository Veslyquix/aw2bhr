	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801F0AC
sub_0801F0AC: @ 0x0801F0AC
	push {lr}
	ldr r0, _0801F0BC @ =gUnknown_03001FE0
	ldr r0, [r0]
	cmp r0, #0
	beq _0801F0C0
	bl sub_0801BC08
	b _0801F0C4
	.align 2, 0
_0801F0BC: .4byte gUnknown_03001FE0
_0801F0C0:
	bl sub_0801EFF4
_0801F0C4:
	pop {r0}
	bx r0

