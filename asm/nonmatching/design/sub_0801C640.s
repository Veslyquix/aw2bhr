	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801C640
sub_0801C640: @ 0x0801C640
	adds r3, r0, #0
	adds r2, r1, #0
	str r2, [r3]
	adds r0, #0x20
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801C66E
	ldrh r0, [r2]
	lsrs r0, r0, #1
	lsls r0, r0, #1
	adds r0, r2, r0
	str r0, [r3, #4]
	ldrh r0, [r2, #2]
	lsrs r0, r0, #1
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r1, [r0]
	lsrs r1, r1, #1
	lsls r1, r1, #1
	adds r0, r0, r1
	b _0801C674
_0801C66E:
	ldr r0, [r2]
	str r0, [r3, #4]
	ldr r0, [r2, #4]
_0801C674:
	str r0, [r3, #8]
	str r0, [r3, #0xc]
	bx lr
	.align 2, 0

