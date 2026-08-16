	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08042F5C
sub_08042F5C: @ 0x08042F5C
	push {lr}
	ldr r1, _08042F78 @ =gUnknown_08499598
	ldr r2, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r1, #0x1d]
	ldrb r1, [r1, #0x1e]
	bl sub_08042F34
	pop {r1}
	bx r1
	.align 2, 0
_08042F78: .4byte gUnknown_08499598

