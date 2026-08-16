	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C660
sub_0802C660: @ 0x0802C660
	ldr r2, _0802C678 @ =gUnknown_085C77A0
	ldr r0, _0802C67C @ =gUnknown_03003FC0
	ldrb r1, [r0, #2]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrh r0, [r0, #0x1a]
	cmp r0, #0
	beq _0802C680
	movs r0, #0
	b _0802C682
	.align 2, 0
_0802C678: .4byte gUnknown_085C77A0
_0802C67C: .4byte gUnknown_03003FC0
_0802C680:
	movs r0, #1
_0802C682:
	bx lr

