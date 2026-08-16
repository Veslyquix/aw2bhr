	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08071C84
sub_08071C84: @ 0x08071C84
	push {lr}
	adds r1, r0, #0
	ldr r0, _08071C9C @ =gUnknown_08613F54
	ldr r2, _08071CA0 @ =gUnknown_030020C0
	lsls r1, r1, #5
	adds r1, r1, r2
	movs r2, #0x10
	bl CpuSet
	pop {r0}
	bx r0
	.align 2, 0
_08071C9C: .4byte gUnknown_08613F54
_08071CA0: .4byte gUnknown_030020C0

