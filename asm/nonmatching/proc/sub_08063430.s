	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08063430
sub_08063430: @ 0x08063430
	push {lr}
	adds r1, r0, #0
	ldrb r0, [r1, #0x18]
	cmp r0, #0
	beq _08063442
	adds r0, r1, #0
	bl sub_08062FB8
	b _0806344E
_08063442:
	adds r2, r1, #0
	adds r2, #0x4a
	strb r0, [r2]
	strb r0, [r1, #0x1e]
	movs r0, #1
	strb r0, [r1, #0x18]
_0806344E:
	pop {r0}
	bx r0
	.align 2, 0

