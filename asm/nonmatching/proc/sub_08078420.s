	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078420
sub_08078420: @ 0x08078420
	push {lr}
	sub sp, #4
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r3, _0807843C @ =gUnknown_084BA480
	str r0, [sp]
	adds r0, r1, #0
	movs r1, #0x70
	movs r2, #3
	bl sub_080785CC
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0807843C: .4byte gUnknown_084BA480

