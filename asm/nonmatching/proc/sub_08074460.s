	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08074460
sub_08074460: @ 0x08074460
	push {lr}
	bl sub_08074584
	cmp r0, #0
	beq _0807447E
	ldr r0, [r0]
	cmp r0, #0
	beq _0807447E
	movs r1, #0
	movs r2, #0
	bl sub_08074484
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _08074480
_0807447E:
	movs r0, #0
_08074480:
	pop {r1}
	bx r1

