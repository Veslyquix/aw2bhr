	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801F0C8
sub_0801F0C8: @ 0x0801F0C8
	push {lr}
	ldr r0, _0801F0DC @ =gUnknown_03001FE0
	ldr r0, [r0]
	cmp r0, #0
	bne _0801F0D6
	bl sub_0801EFA8
_0801F0D6:
	pop {r0}
	bx r0
	.align 2, 0
_0801F0DC: .4byte gUnknown_03001FE0

