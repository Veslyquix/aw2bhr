	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080743E8
sub_080743E8: @ 0x080743E8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08074584
	cmp r0, #0
	beq _08074408
	ldr r0, [r0, #0xc]
	cmp r0, #0
	beq _08074408
	adds r1, r4, #0
	movs r2, #0
	bl sub_08074484
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0807440A
_08074408:
	movs r0, #0
_0807440A:
	pop {r4}
	pop {r1}
	bx r1

