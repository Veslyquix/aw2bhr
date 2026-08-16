	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08044AA0
sub_08044AA0: @ 0x08044AA0
	push {lr}
	adds r1, r0, #0
	ldr r0, _08044AB4 @ =gUnknown_084A0858
	bl Proc_StartBlocking
	adds r0, #0x64
	movs r1, #0x28
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08044AB4: .4byte gUnknown_084A0858

