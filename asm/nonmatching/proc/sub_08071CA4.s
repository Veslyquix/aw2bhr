	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08071CA4
sub_08071CA4: @ 0x08071CA4
	push {lr}
	adds r1, r0, #0
	ldr r0, _08071CBC @ =gUnknown_08613F74
	ldr r2, _08071CC0 @ =gPal
	lsls r1, r1, #5
	adds r1, r1, r2
	movs r2, #0x10
	bl CpuSet
	pop {r0}
	bx r0
	.align 2, 0
_08071CBC: .4byte gUnknown_08613F74
_08071CC0: .4byte gPal

