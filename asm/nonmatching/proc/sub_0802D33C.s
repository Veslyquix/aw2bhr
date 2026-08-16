	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802D33C
sub_0802D33C: @ 0x0802D33C
	push {lr}
	ldr r0, _0802D350 @ =gUnknown_0848A42C
	bl sub_080637AC
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0xf
	bhi _0802D354
	movs r0, #1
	b _0802D356
	.align 2, 0
_0802D350: .4byte gUnknown_0848A42C
_0802D354:
	movs r0, #0x10
_0802D356:
	pop {r1}
	bx r1
	.align 2, 0

