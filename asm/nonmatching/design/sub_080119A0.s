	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080119A0
sub_080119A0: @ 0x080119A0
	push {r4, r5, r6, lr}
	adds r4, r2, #0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	b _080119C8
_080119AE:
	ldrb r2, [r4]
	adds r4, #1
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0801172C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080119C8
	adds r0, r5, #0
	adds r0, #8
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_080119C8:
	ldrb r0, [r4]
	cmp r0, #0
	bne _080119AE
	pop {r4, r5, r6}
	pop {r0}
	bx r0

