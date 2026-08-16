	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807F414
sub_0807F414: @ 0x0807F414
	push {lr}
	adds r2, r0, #0
	ldr r0, _0807F430 @ =gUnknown_03001FFC
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	ldrh r0, [r0]
	cmp r0, #0xf
	bls _0807F42C
	adds r0, r2, #0
	bl Proc_Break
_0807F42C:
	pop {r0}
	bx r0
	.align 2, 0
_0807F430: .4byte gUnknown_03001FFC

