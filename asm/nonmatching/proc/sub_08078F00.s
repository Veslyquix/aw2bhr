	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078F00
sub_08078F00: @ 0x08078F00
	push {lr}
	adds r2, r0, #0
	ldr r0, _08078F1C @ =gUnknown_03001FFC
	ldrh r1, [r0]
	adds r1, #2
	strh r1, [r0]
	ldrh r0, [r0]
	cmp r0, #0xf
	bls _08078F18
	adds r0, r2, #0
	bl Proc_Break
_08078F18:
	pop {r0}
	bx r0
	.align 2, 0
_08078F1C: .4byte gUnknown_03001FFC

