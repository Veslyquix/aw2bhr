	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080180A8
sub_080180A8: @ 0x080180A8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0xe]
	subs r0, #1
	strh r0, [r4, #0xe]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_08018018
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080180C6
	strh r0, [r4, #0xe]
	str r0, [r4, #8]
_080180C6:
	pop {r4}
	pop {r0}
	bx r0

