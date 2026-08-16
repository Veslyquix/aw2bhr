	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08014CA4
sub_08014CA4: @ 0x08014CA4
	push {r4, lr}
	adds r3, r0, #0
	adds r2, r3, #0
	adds r2, #0x40
	ldrb r0, [r2]
	adds r0, r0, r1
	strb r0, [r2]
	movs r4, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bls _08014CD8
	adds r1, r3, #0
	adds r1, #0x32
_08014CC0:
	ldrb r0, [r2]
	subs r0, #8
	strb r0, [r2]
	ldrh r0, [r3, #0x34]
	adds r0, #2
	strh r0, [r3, #0x34]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r0, [r2]
	cmp r0, #7
	bhi _08014CC0
_08014CD8:
	adds r0, r3, #0
	adds r0, #0x40
	ldrb r0, [r0]
	cmp r0, #0
	beq _08014CE4
	movs r4, #1
_08014CE4:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1

