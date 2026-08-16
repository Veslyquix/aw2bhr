	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C820
sub_0802C820: @ 0x0802C820
	push {lr}
	ldr r0, _0802C838 @ =gUnknown_030033EC
	ldrh r0, [r0]
	bl sub_080442AC
	ldr r1, _0802C83C @ =gUnknown_03003FC0
	ldrb r1, [r1, #7]
	ands r1, r0
	cmp r1, #0
	bne _0802C840
	movs r0, #1
	b _0802C842
	.align 2, 0
_0802C838: .4byte gUnknown_030033EC
_0802C83C: .4byte gUnknown_03003FC0
_0802C840:
	movs r0, #0
_0802C842:
	pop {r1}
	bx r1
	.align 2, 0

