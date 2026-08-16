	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080081E0
sub_080081E0: @ 0x080081E0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, _080083D4 @ =gUnknown_0808D7F8
	mov sb, r0
	cmp r6, #0
	ble _080082A0
	subs r5, r6, #1
	cmp r4, #0
	ble _0800822E
	subs r7, r4, #1
	adds r0, r7, #0
	adds r1, r5, #0
	bl IsTerrainLand
	cmp r0, #0
	beq _0800822E
	mov r1, sb
	ldr r0, [r1]
	ldr r1, [r0]
	lsls r2, r5, #1
	ldr r3, _080083D8 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r0, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r2, _080083DC @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r2, [r1]
	adds r0, r7, #0
	adds r1, r5, #0
	bl sub_08007F14
_0800822E:
	adds r0, r4, #0
	adds r1, r5, #0
	bl IsTerrainLand
	cmp r0, #0
	beq _0800825E
	mov r3, sb
	ldr r0, [r3]
	ldr r1, [r0]
	lsls r2, r5, #1
	ldr r3, _080083D8 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r2, _080083DC @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r2, [r1]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08007F14
_0800825E:
	mov r3, sb
	ldr r3, [r3]
	mov r8, r3
	ldr r0, [r3]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _080082A0
	adds r7, r4, #1
	adds r0, r7, #0
	adds r1, r5, #0
	bl IsTerrainLand
	cmp r0, #0
	beq _080082A0
	mov r0, r8
	ldr r1, [r0]
	lsls r2, r5, #1
	ldr r3, _080083D8 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r2, _080083DC @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r2, [r1]
	adds r0, r7, #0
	adds r1, r5, #0
	bl sub_08007F14
_080082A0:
	cmp r4, #0
	ble _080082D8
	subs r5, r4, #1
	adds r0, r5, #0
	adds r1, r6, #0
	bl IsTerrainLand
	cmp r0, #0
	beq _080082D8
	mov r3, sb
	ldr r0, [r3]
	ldr r1, [r0]
	lsls r2, r6, #1
	ldr r3, _080083D8 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r0, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r2, _080083DC @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r2, [r1]
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08007F14
_080082D8:
	mov r3, sb
	ldr r7, [r3]
	ldr r0, [r7]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _08008316
	adds r5, r4, #1
	adds r0, r5, #0
	adds r1, r6, #0
	bl IsTerrainLand
	cmp r0, #0
	beq _08008316
	ldr r1, [r7]
	lsls r2, r6, #1
	ldr r3, _080083D8 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r2, _080083DC @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r2, [r1]
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08007F14
_08008316:
	mov r3, sb
	ldr r7, [r3]
	ldr r0, [r7]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r6, r0
	bge _080083C8
	adds r5, r6, #1
	cmp r4, #0
	ble _0800835A
	subs r6, r4, #1
	adds r0, r6, #0
	adds r1, r5, #0
	bl IsTerrainLand
	cmp r0, #0
	beq _0800835A
	ldr r1, [r7]
	lsls r2, r5, #1
	ldr r3, _080083D8 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r0, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r2, _080083DC @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r2, [r1]
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_08007F14
_0800835A:
	adds r0, r4, #0
	adds r1, r5, #0
	bl IsTerrainLand
	cmp r0, #0
	beq _0800838A
	mov r3, sb
	ldr r0, [r3]
	ldr r1, [r0]
	lsls r2, r5, #1
	ldr r3, _080083D8 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r2, _080083DC @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r2, [r1]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08007F14
_0800838A:
	mov r3, sb
	ldr r7, [r3]
	ldr r0, [r7]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _080083C8
	adds r6, r4, #1
	adds r0, r6, #0
	adds r1, r5, #0
	bl IsTerrainLand
	cmp r0, #0
	beq _080083C8
	ldr r1, [r7]
	lsls r2, r5, #1
	ldr r3, _080083D8 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r2, _080083DC @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r2, [r1]
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_08007F14
_080083C8:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080083D4: .4byte gUnknown_0808D7F8
_080083D8: .4byte 0x0000417A
_080083DC: .4byte 0x00000A22

