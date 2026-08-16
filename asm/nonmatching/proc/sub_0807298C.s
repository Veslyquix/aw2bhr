	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807298C
sub_0807298C: @ 0x0807298C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _080729A8 @ =gUnknown_08613F44
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x34]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080729A8: .4byte gUnknown_08613F44

