	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08042DFC
sub_08042DFC: @ 0x08042DFC
	push {lr}
	ldr r1, _08042E14 @ =gUnknown_08499598
	ldr r2, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r1, #0x1d]
	bl sub_08042E18
	pop {r1}
	bx r1
	.align 2, 0
_08042E14: .4byte gUnknown_08499598

