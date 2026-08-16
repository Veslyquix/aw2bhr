	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806C76C
sub_0806C76C: @ 0x0806C76C
	push {lr}
	adds r2, r0, #0
	ldr r0, _0806C788 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0806C784
	adds r0, r2, #0
	bl Proc_Break
_0806C784:
	pop {r0}
	bx r0
	.align 2, 0
_0806C788: .4byte gpKeySt

