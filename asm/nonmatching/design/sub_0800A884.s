	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800A884
sub_0800A884: @ 0x0800A884
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r7, r1, #0
	movs r5, #0
	ldr r0, _0800A954 @ =gUnknown_0808D84C
	mov r8, r0
	cmp r7, #0
	ble _0800A8CE
	subs r6, r7, #1
	cmp r4, #0
	ble _0800A8A8
	subs r0, r4, #1
	adds r1, r6, #0
	bl IsTerrainLand
	lsls r5, r0, #8
_0800A8A8:
	adds r0, r4, #0
	adds r1, r6, #0
	bl IsTerrainLand
	lsls r0, r0, #7
	orrs r5, r0
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _0800A8CE
	adds r0, r4, #1
	adds r1, r6, #0
	bl IsTerrainLand
	lsls r0, r0, #6
	orrs r5, r0
_0800A8CE:
	cmp r4, #0
	ble _0800A8DE
	subs r0, r4, #1
	adds r1, r7, #0
	bl IsTerrainLand
	lsls r0, r0, #5
	orrs r5, r0
_0800A8DE:
	movs r0, #0x10
	orrs r5, r0
	mov r2, r8
	ldr r2, [r2]
	mov r8, r2
	ldr r0, [r2]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _0800A8FE
	adds r0, r4, #1
	adds r1, r7, #0
	bl IsTerrainLand
	lsls r0, r0, #3
	orrs r5, r0
_0800A8FE:
	mov r1, r8
	ldr r0, [r1]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r7, r0
	bge _0800A93E
	adds r6, r7, #1
	cmp r4, #0
	ble _0800A91C
	subs r0, r4, #1
	adds r1, r6, #0
	bl IsTerrainLand
	lsls r0, r0, #2
	orrs r5, r0
_0800A91C:
	adds r0, r4, #0
	adds r1, r6, #0
	bl IsTerrainLand
	lsls r0, r0, #1
	orrs r5, r0
	mov r2, r8
	ldr r0, [r2]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _0800A93E
	adds r0, r4, #1
	adds r1, r6, #0
	bl IsTerrainLand
	orrs r5, r0
_0800A93E:
	ldr r0, _0800A958 @ =gUnknown_084867C4
	lsls r1, r5, #1
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800A954: .4byte gUnknown_0808D84C
_0800A958: .4byte gUnknown_084867C4

