	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080083E0
sub_080083E0: @ 0x080083E0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, _080085D4 @ =gUnknown_0808D7FC
	mov sb, r0
	cmp r6, #0
	ble _080084A0
	subs r5, r6, #1
	cmp r4, #0
	ble _0800842E
	subs r7, r4, #1
	adds r0, r7, #0
	adds r1, r5, #0
	bl IsTerrainLand
	cmp r0, #0
	beq _0800842E
	mov r1, sb
	ldr r0, [r1]
	ldr r1, [r0]
	lsls r2, r5, #1
	ldr r3, _080085D8 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r0, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r2, _080085DC @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r2, [r1]
	adds r0, r7, #0
	adds r1, r5, #0
	bl sub_08007F14
_0800842E:
	adds r0, r4, #0
	adds r1, r5, #0
	bl IsTerrainLand
	cmp r0, #0
	beq _0800845E
	mov r3, sb
	ldr r0, [r3]
	ldr r1, [r0]
	lsls r2, r5, #1
	ldr r3, _080085D8 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r2, _080085DC @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r2, [r1]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08007F14
_0800845E:
	mov r3, sb
	ldr r3, [r3]
	mov r8, r3
	ldr r0, [r3]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _080084A0
	adds r7, r4, #1
	adds r0, r7, #0
	adds r1, r5, #0
	bl IsTerrainLand
	cmp r0, #0
	beq _080084A0
	mov r0, r8
	ldr r1, [r0]
	lsls r2, r5, #1
	ldr r3, _080085D8 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r2, _080085DC @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r2, [r1]
	adds r0, r7, #0
	adds r1, r5, #0
	bl sub_08007F14
_080084A0:
	cmp r4, #0
	ble _080084D8
	subs r5, r4, #1
	adds r0, r5, #0
	adds r1, r6, #0
	bl IsTerrainLand
	cmp r0, #0
	beq _080084D8
	mov r3, sb
	ldr r0, [r3]
	ldr r1, [r0]
	lsls r2, r6, #1
	ldr r3, _080085D8 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r0, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r2, _080085DC @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r2, [r1]
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08007F14
_080084D8:
	mov r3, sb
	ldr r7, [r3]
	ldr r0, [r7]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _08008516
	adds r5, r4, #1
	adds r0, r5, #0
	adds r1, r6, #0
	bl IsTerrainLand
	cmp r0, #0
	beq _08008516
	ldr r1, [r7]
	lsls r2, r6, #1
	ldr r3, _080085D8 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r2, _080085DC @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r2, [r1]
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08007F14
_08008516:
	mov r3, sb
	ldr r7, [r3]
	ldr r0, [r7]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r6, r0
	bge _080085C8
	adds r5, r6, #1
	cmp r4, #0
	ble _0800855A
	subs r6, r4, #1
	adds r0, r6, #0
	adds r1, r5, #0
	bl IsTerrainLand
	cmp r0, #0
	beq _0800855A
	ldr r1, [r7]
	lsls r2, r5, #1
	ldr r3, _080085D8 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r0, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r2, _080085DC @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r2, [r1]
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_08007F14
_0800855A:
	adds r0, r4, #0
	adds r1, r5, #0
	bl IsTerrainLand
	cmp r0, #0
	beq _0800858A
	mov r3, sb
	ldr r0, [r3]
	ldr r1, [r0]
	lsls r2, r5, #1
	ldr r3, _080085D8 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r2, _080085DC @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r2, [r1]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08007F14
_0800858A:
	mov r3, sb
	ldr r7, [r3]
	ldr r0, [r7]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _080085C8
	adds r6, r4, #1
	adds r0, r6, #0
	adds r1, r5, #0
	bl IsTerrainLand
	cmp r0, #0
	beq _080085C8
	ldr r1, [r7]
	lsls r2, r5, #1
	ldr r3, _080085D8 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r2, _080085DC @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r2, [r1]
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_08007F14
_080085C8:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080085D4: .4byte gUnknown_0808D7FC
_080085D8: .4byte 0x0000417A
_080085DC: .4byte 0x00000A22

