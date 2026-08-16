	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802A4DC
sub_0802A4DC: @ 0x0802A4DC
	push {lr}
	ldr r0, _0802A500 @ =gUnknown_030033EC
	ldrh r2, [r0]
	ldr r0, _0802A504 @ =gUnknown_08499598
	ldr r0, [r0]
	lsls r1, r2, #4
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	adds r1, #0x30
	ldrb r1, [r1]
	bl sub_08029088
	pop {r0}
	bx r0
	.align 2, 0
_0802A500: .4byte gUnknown_030033EC
_0802A504: .4byte gUnknown_08499598

