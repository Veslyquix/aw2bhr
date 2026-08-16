	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807BE44
sub_0807BE44: @ 0x0807BE44
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0807C034
	adds r0, r4, #0
	adds r0, #0x66
	movs r1, #0
	ldrsh r2, [r0, r1]
	subs r0, #0x1a
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	cmp r2, r0
	blt _0807BE6A
	adds r0, r4, #0
	bl Proc_Break
_0807BE6A:
	pop {r4}
	pop {r0}
	bx r0

