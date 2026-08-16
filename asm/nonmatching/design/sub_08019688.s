	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08019688
sub_08019688: @ 0x08019688
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r1, #0
	cmp r1, r2
	bhs _080196B8
_0801969E:
	ldrb r0, [r4]
	adds r1, #1
	cmp r0, r5
	beq _080196AE
_080196A6:
	adds r4, r4, r3
	ldrb r0, [r4]
	cmp r0, r5
	bne _080196A6
_080196AE:
	adds r4, #1
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	cmp r1, r2
	blo _0801969E
_080196B8:
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1

