	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803647C
sub_0803647C: @ 0x0803647C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08036024
	adds r4, #0x35
	movs r1, #0
	movs r0, #1
	strb r0, [r4]
	ldr r0, _08036498 @ =gUnknown_030040E4
	strh r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08036498: .4byte gUnknown_030040E4

