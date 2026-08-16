	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C848
sub_0802C848: @ 0x0802C848
	push {lr}
	ldr r0, _0802C860 @ =gUnknown_030033EC
	ldrh r0, [r0]
	bl sub_08044280
	ldr r1, _0802C864 @ =gUnknown_03003FC0
	ldrb r1, [r1, #7]
	ands r1, r0
	cmp r1, #0
	bne _0802C868
	movs r0, #1
	b _0802C86A
	.align 2, 0
_0802C860: .4byte gUnknown_030033EC
_0802C864: .4byte gUnknown_03003FC0
_0802C868:
	movs r0, #0
_0802C86A:
	pop {r1}
	bx r1
	.align 2, 0

