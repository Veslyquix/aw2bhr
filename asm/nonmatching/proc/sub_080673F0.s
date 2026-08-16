	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080673F0
sub_080673F0: @ 0x080673F0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _0806740C @ =gUnknown_08580EC4
	bl Proc_Start
	str r4, [r0, #0x2c]
	movs r1, #0
	str r1, [r0, #0x38]
	str r5, [r0, #0x3c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806740C: .4byte gUnknown_08580EC4

