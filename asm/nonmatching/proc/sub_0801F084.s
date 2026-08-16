	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801F084
sub_0801F084: @ 0x0801F084
	push {lr}
	ldr r0, _0801F0A0 @ =gUnknown_03001FE0
	ldr r0, [r0]
	cmp r0, #0
	beq _0801F0A4
	movs r0, #0
	bl sub_0801BF2C
	movs r0, #5
	bl sub_0801BF2C
	bl sub_0801BE78
	b _0801F0A8
	.align 2, 0
_0801F0A0: .4byte gUnknown_03001FE0
_0801F0A4:
	bl sub_0801EE10
_0801F0A8:
	pop {r0}
	bx r0

