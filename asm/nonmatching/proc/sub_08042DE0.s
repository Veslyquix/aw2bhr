	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08042DE0
sub_08042DE0: @ 0x08042DE0
	push {lr}
	ldr r1, _08042DF8 @ =gUnknown_08499598
	ldr r2, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r1, #0x1d]
	bl sub_08042DCC
	pop {r1}
	bx r1
	.align 2, 0
_08042DF8: .4byte gUnknown_08499598

