	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801F050
sub_0801F050: @ 0x0801F050
	push {lr}
	ldr r0, _0801F060 @ =gUnknown_03001FE0
	ldr r0, [r0]
	cmp r0, #0
	beq _0801F064
	bl sub_0801BCA8
	b _0801F068
	.align 2, 0
_0801F060: .4byte gUnknown_03001FE0
_0801F064:
	bl sub_0801E0F0
_0801F068:
	pop {r0}
	bx r0

