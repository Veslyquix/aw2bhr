	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801C4D4
sub_0801C4D4: @ 0x0801C4D4
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	cmp r2, #0
	beq _0801C516
	ldr r3, [r2]
	cmp r3, #0
	beq _0801C516
	adds r0, #0x20
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801C506
	ldrh r0, [r3, #2]
	lsrs r0, r0, #1
	lsls r0, r0, #1
	adds r0, r3, r0
	lsls r1, r4, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	lsrs r1, r1, #1
	lsls r1, r1, #1
	adds r0, r0, r1
	b _0801C50C
_0801C506:
	lsls r0, r4, #2
	adds r0, r0, r3
	ldr r0, [r0, #4]
_0801C50C:
	str r0, [r2, #8]
	str r0, [r2, #0xc]
	adds r0, r2, #0
	bl sub_0801C67C
_0801C516:
	pop {r4}
	pop {r0}
	bx r0

