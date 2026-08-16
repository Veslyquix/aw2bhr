	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08049F08
sub_08049F08: @ 0x08049F08
	push {lr}
	ldr r2, _08049F1C @ =gUnknown_084C3240
	ldr r2, [r2]
	adds r2, #0x2e
	strb r0, [r2]
	ldr r0, _08049F20 @ =gUnknown_084C327C
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_08049F1C: .4byte gUnknown_084C3240
_08049F20: .4byte gUnknown_084C327C

