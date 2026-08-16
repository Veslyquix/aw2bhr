	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08065960
sub_08065960: @ 0x08065960
	ldr r0, _08065980 @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0806597C
	ldr r1, _08065984 @ =gUnknown_0300200C
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r1, _08065988 @ =gUnknown_03002000
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_0806597C:
	bx lr
	.align 2, 0
_08065980: .4byte gUnknown_03004008
_08065984: .4byte gUnknown_0300200C
_08065988: .4byte gUnknown_03002000

