	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806E698
sub_0806E698: @ 0x0806E698
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806E6B0 @ =gUnknown_08582B74
	adds r1, r4, #0
	bl Proc_StartBlocking
	ldr r1, [r4, #0x5c]
	str r1, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806E6B0: .4byte gUnknown_08582B74

