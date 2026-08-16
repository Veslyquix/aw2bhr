	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080742FC
sub_080742FC: @ 0x080742FC
	push {lr}
	bl sub_08074584
	cmp r0, #0
	beq _0807431A
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _0807431A
	movs r1, #0
	movs r2, #0
	bl sub_08074484
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0807431C
_0807431A:
	movs r0, #0
_0807431C:
	pop {r1}
	bx r1

