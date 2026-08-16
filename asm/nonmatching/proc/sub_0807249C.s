	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807249C
sub_0807249C: @ 0x0807249C
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _080724B4 @ =gUnknown_08613F0C
	adds r1, r2, #0
	bl Proc_StartBlocking
	str r4, [r0, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080724B4: .4byte gUnknown_08613F0C

