	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034208
sub_08034208: @ 0x08034208
	push {lr}
	adds r1, r0, #0
	ldr r2, _08034228 @ =gUnknown_0849BC44
	ldr r0, _0803422C @ =gUnknown_0849B060
	ldr r0, [r0]
	ldrb r0, [r0, #0xd]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	bl Proc_StartBlocking
	bl sub_0803BD54
	pop {r0}
	bx r0
	.align 2, 0
_08034228: .4byte gUnknown_0849BC44
_0803422C: .4byte gUnknown_0849B060

