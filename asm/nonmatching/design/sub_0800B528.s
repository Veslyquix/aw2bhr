	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800B528
sub_0800B528: @ 0x0800B528
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r7, _0800B55C @ =gUnknown_08499590
	ldr r1, [r7]
	lsls r2, r5, #1
	ldr r3, _0800B560 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r4
	ldr r2, _0800B564 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0x13
	beq _0800B556
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080094EC
	cmp r0, #0
	beq _0800B568
_0800B556:
	movs r0, #1
	rsbs r0, r0, #0
	b _0800B5B8
	.align 2, 0
_0800B55C: .4byte gUnknown_08499590
_0800B560: .4byte 0x0000417A
_0800B564: .4byte 0x00001432
_0800B568:
	movs r6, #0
	cmp r5, #1
	ble _0800B578
	subs r1, r5, #1
	adds r0, r4, #0
	bl IsTerrainLand
	adds r6, r0, #0
_0800B578:
	ldr r0, [r7]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r5, r0
	bge _0800B58C
	adds r1, r5, #1
	adds r0, r4, #0
	bl IsTerrainLand
	adds r6, r6, r0
_0800B58C:
	cmp r4, #0
	ble _0800B59A
	subs r0, r4, #1
	adds r1, r5, #0
	bl IsTerrainLand
	adds r6, r6, r0
_0800B59A:
	ldr r0, [r7]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _0800B5AE
	adds r0, r4, #1
	adds r1, r5, #0
	bl IsTerrainLand
	adds r6, r6, r0
_0800B5AE:
	cmp r6, #4
	bne _0800B5B6
	movs r6, #1
	rsbs r6, r6, #0
_0800B5B6:
	adds r0, r6, #0
_0800B5B8:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

