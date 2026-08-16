	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08026F04
sub_08026F04: @ 0x08026F04
	push {lr}
	ldr r0, _08026F20 @ =gUnknown_030033EC
	ldrh r0, [r0]
	ldr r1, _08026F24 @ =gUnknown_08499598
	ldr r2, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1, #8]
	bl sub_08025B58
	pop {r0}
	bx r0
	.align 2, 0
_08026F20: .4byte gUnknown_030033EC
_08026F24: .4byte gUnknown_08499598

