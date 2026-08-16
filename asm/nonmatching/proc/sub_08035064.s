	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08035064
sub_08035064: @ 0x08035064
	push {lr}
	ldr r1, _0803507C @ =gUnknown_0849BD20
	movs r2, #0x20
	ldrsh r0, [r0, r2]
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #4
	ldrsh r0, [r0, r1]
	bl sub_0803B4DC
	pop {r0}
	bx r0
	.align 2, 0
_0803507C: .4byte gUnknown_0849BD20

