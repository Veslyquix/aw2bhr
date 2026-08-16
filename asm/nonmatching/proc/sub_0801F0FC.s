	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801F0FC
sub_0801F0FC: @ 0x0801F0FC
	push {lr}
	ldr r0, _0801F110 @ =gUnknown_03001FE0
	ldr r0, [r0]
	cmp r0, #0
	bne _0801F10A
	bl sub_0801555C
_0801F10A:
	pop {r0}
	bx r0
	.align 2, 0
_0801F110: .4byte gUnknown_03001FE0

