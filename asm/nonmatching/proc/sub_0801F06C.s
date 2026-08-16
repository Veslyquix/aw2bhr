	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801F06C
sub_0801F06C: @ 0x0801F06C
	push {lr}
	ldr r0, _0801F080 @ =gUnknown_03001FE0
	ldr r0, [r0]
	cmp r0, #0
	bne _0801F07A
	bl sub_08015550
_0801F07A:
	pop {r0}
	bx r0
	.align 2, 0
_0801F080: .4byte gUnknown_03001FE0

