	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034598
sub_08034598: @ 0x08034598
	push {lr}
	bl sub_08023824
	bl sub_08023518
	movs r0, #4
	bl sub_08023908
	ldr r0, _080345C4 @ =gUnknown_03002EE0
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080345BA
	bl sub_0802FA64
_080345BA:
	movs r0, #3
	bl sub_0802776C
	pop {r0}
	bx r0
	.align 2, 0
_080345C4: .4byte gUnknown_03002EE0

