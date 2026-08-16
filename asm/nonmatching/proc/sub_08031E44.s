	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08031E44
sub_08031E44: @ 0x08031E44
	push {lr}
	adds r1, r0, #0
	ldr r0, _08031E68 @ =gUnknown_0849B2A4
	bl Proc_Start
	adds r2, r0, #0
	adds r0, #0x68
	movs r1, #0x64
	strh r1, [r0]
	subs r0, #4
	strh r1, [r0]
	adds r1, r2, #0
	adds r1, #0x66
	movs r0, #0x48
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08031E68: .4byte gUnknown_0849B2A4

