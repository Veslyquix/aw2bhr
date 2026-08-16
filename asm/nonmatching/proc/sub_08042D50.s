	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08042D50
sub_08042D50: @ 0x08042D50
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r0, r6, #0
	bl sub_080433C8
	adds r4, r0, #0
	ldr r0, _08042D80 @ =gUnknown_08499598
	ldr r0, [r0]
	lsls r1, r5, #4
	subs r1, r1, r5
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #0x1d]
	ldrb r1, [r1, #0x1e]
	adds r2, r6, #0
	bl sub_08043200
	adds r4, r4, r0
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08042D80: .4byte gUnknown_08499598

