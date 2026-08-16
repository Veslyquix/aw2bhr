	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801C7DC
sub_0801C7DC: @ 0x0801C7DC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r2, #0
	adds r7, r3, #0
	ldrh r2, [r0]
	lsrs r2, r2, #1
	lsls r2, r2, #1
	adds r6, r0, r2
	ldrh r2, [r0, #2]
	lsrs r2, r2, #1
	lsls r2, r2, #1
	adds r0, r0, r2
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	lsrs r1, r1, #1
	lsls r1, r1, #1
	adds r2, r0, r1
	adds r5, r2, #0
	movs r1, #0
	b _0801C80C
_0801C806:
	ldrh r0, [r2]
	adds r1, r1, r0
	adds r2, #4
_0801C80C:
	ldrh r0, [r2]
	cmp r0, #0
	bne _0801C806
	ldrh r0, [r2, #2]
	cmp r0, #1
	beq _0801C836
	cmp r0, #1
	bgt _0801C820
	cmp r0, #0
	beq _0801C82C
_0801C820:
	adds r0, r4, #0
	bl DivRem
	adds r4, r0, #0
_0801C828:
	movs r1, #1
	b _0801C83A
_0801C82C:
	cmp r4, r1
	ble _0801C828
	adds r4, r1, #0
	movs r1, #0
	b _0801C83A
_0801C836:
	movs r0, #0
	b _0801C86E
_0801C83A:
	adds r2, r5, #0
	ldrh r0, [r2]
	lsls r5, r1, #0x18
	b _0801C846
_0801C842:
	adds r2, #4
	ldrh r0, [r2]
_0801C846:
	cmp r0, #0
	beq _0801C850
	subs r4, r4, r0
	cmp r4, #0
	bgt _0801C842
_0801C850:
	ldrh r0, [r2, #2]
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r3, [r0]
	lsrs r3, r3, #1
	lsls r3, r3, #1
	adds r3, r6, r3
	ldr r0, [sp, #0x1c]
	str r0, [sp]
	ldr r0, [sp, #0x20]
	adds r1, r7, #0
	ldr r2, [sp, #0x18]
	bl PutSpriteExt
	lsrs r0, r5, #0x18
_0801C86E:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	.align 2, 0
