	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800A798
sub_0800A798: @ 0x0800A798
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r6, r1, #0
	bl IsTerrainWater
	cmp r0, #0
	bne _0800A7B0
	movs r0, #1
	rsbs r0, r0, #0
	b _0800A870
_0800A7B0:
	movs r5, #0
	ldr r0, _0800A87C @ =gUnknown_0808D848
	mov r8, r0
	cmp r6, #0
	ble _0800A7F0
	subs r7, r6, #1
	cmp r4, #0
	ble _0800A7CA
	subs r0, r4, #1
	adds r1, r7, #0
	bl IsTerrainLand
	lsls r5, r0, #8
_0800A7CA:
	adds r0, r4, #0
	adds r1, r7, #0
	bl IsTerrainLand
	lsls r0, r0, #7
	orrs r5, r0
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _0800A7F0
	adds r0, r4, #1
	adds r1, r7, #0
	bl IsTerrainLand
	lsls r0, r0, #6
	orrs r5, r0
_0800A7F0:
	cmp r4, #0
	ble _0800A800
	subs r0, r4, #1
	adds r1, r6, #0
	bl IsTerrainLand
	lsls r0, r0, #5
	orrs r5, r0
_0800A800:
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_080094EC
	cmp r0, #0
	bne _0800A810
	movs r0, #0x10
	orrs r5, r0
_0800A810:
	mov r2, r8
	ldr r7, [r2]
	ldr r0, [r7]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _0800A82A
	adds r0, r4, #1
	adds r1, r6, #0
	bl IsTerrainLand
	lsls r0, r0, #3
	orrs r5, r0
_0800A82A:
	ldr r0, [r7]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r6, r0
	bge _0800A866
	adds r6, #1
	cmp r4, #0
	ble _0800A846
	subs r0, r4, #1
	adds r1, r6, #0
	bl IsTerrainLand
	lsls r0, r0, #2
	orrs r5, r0
_0800A846:
	adds r0, r4, #0
	adds r1, r6, #0
	bl IsTerrainLand
	lsls r0, r0, #1
	orrs r5, r0
	ldr r0, [r7]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _0800A866
	adds r0, r4, #1
	adds r1, r6, #0
	bl IsTerrainLand
	orrs r5, r0
_0800A866:
	ldr r0, _0800A880 @ =gUnknown_08486BC4
	lsls r1, r5, #1
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
_0800A870:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800A87C: .4byte gUnknown_0808D848
_0800A880: .4byte gUnknown_08486BC4

