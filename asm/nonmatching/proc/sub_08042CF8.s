	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08042CF8
sub_08042CF8: @ 0x08042CF8
	push {lr}
	adds r2, r1, #0
	ldr r1, _08042D18 @ =gUnknown_08499598
	ldr r3, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r1, #0x1d]
	ldrb r1, [r1, #0x1e]
	bl sub_08043120
	adds r0, #0x64
	pop {r1}
	bx r1
	.align 2, 0
_08042D18: .4byte gUnknown_08499598

