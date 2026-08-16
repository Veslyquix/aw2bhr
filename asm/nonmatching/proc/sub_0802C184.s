	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C184
sub_0802C184: @ 0x0802C184
	push {lr}
	ldr r0, _0802C1A8 @ =gUnknown_030033EC
	ldrh r0, [r0]
	bl sub_0802C154
	ldr r0, _0802C1AC @ =gUnknown_03003FC0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802C1A4
	movs r0, #0x13
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_08034534
_0802C1A4:
	pop {r0}
	bx r0
	.align 2, 0
_0802C1A8: .4byte gUnknown_030033EC
_0802C1AC: .4byte gUnknown_03003FC0

