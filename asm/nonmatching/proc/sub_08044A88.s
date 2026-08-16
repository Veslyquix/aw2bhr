	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08044A88
sub_08044A88: @ 0x08044A88
	push {lr}
	adds r1, r0, #0
	ldr r0, _08044A9C @ =gUnknown_084A0858
	bl Proc_StartBlocking
	adds r0, #0x64
	movs r1, #0x50
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08044A9C: .4byte gUnknown_084A0858

