	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800BF78
sub_0800BF78: @ 0x0800BF78
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r6, r1, #0
	bl sub_0800BC98
	cmp r0, #0
	bne _0800BF90
	movs r0, #0
	b _0800C106
_0800BF90:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800C840
	cmp r0, #0
	beq _0800BFA4
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800C608
_0800BFA4:
	ldr r0, _0800C114 @ =gUnknown_0200B0B0
	ldr r3, [r0]
	ldr r4, _0800C118 @ =gUnknown_0808D86C
	ldr r0, [r4]
	mov sb, r0
	ldr r1, [r0]
	lsls r2, r6, #1
	ldr r7, _0800C11C @ =0x0000417A
	adds r0, r1, r7
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r2, _0800C120 @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r3, #0x20]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x13
	bl SetTerrainAt
	movs r2, #0xb4
	lsls r2, r2, #1
	adds r0, r5, #0
	adds r1, r6, #0
	bl MakeTileSimple
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800EC20
	mov r8, r4
	cmp r6, #0
	ble _0800C016
	subs r4, r6, #1
	cmp r5, #0
	ble _0800BFFA
	subs r0, r5, #1
	adds r1, r4, #0
	bl sub_0800C124
_0800BFFA:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0800C124
	mov r7, sb
	ldr r0, [r7]
	ldrh r0, [r0]
	subs r0, #1
	cmp r5, r0
	bge _0800C016
	adds r0, r5, #1
	adds r1, r4, #0
	bl sub_0800C124
_0800C016:
	cmp r5, #0
	ble _0800C022
	subs r0, r5, #1
	adds r1, r6, #0
	bl sub_0800C124
_0800C022:
	mov r0, r8
	ldr r7, [r0]
	ldr r0, [r7]
	ldrh r0, [r0]
	subs r0, #1
	cmp r5, r0
	bge _0800C038
	adds r0, r5, #1
	adds r1, r6, #0
	bl sub_0800C124
_0800C038:
	ldr r0, [r7]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r6, r0
	bge _0800C06A
	adds r4, r6, #1
	cmp r5, #0
	ble _0800C050
	subs r0, r5, #1
	adds r1, r4, #0
	bl sub_0800C124
_0800C050:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0800C124
	ldr r0, [r7]
	ldrh r0, [r0]
	subs r0, #1
	cmp r5, r0
	bge _0800C06A
	adds r0, r5, #1
	adds r1, r4, #0
	bl sub_0800C124
_0800C06A:
	cmp r6, #0
	ble _0800C09A
	subs r4, r6, #1
	cmp r5, #0
	ble _0800C07C
	subs r0, r5, #1
	adds r1, r4, #0
	bl sub_0800C22C
_0800C07C:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0800C22C
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0]
	subs r0, #1
	cmp r5, r0
	bge _0800C09A
	adds r0, r5, #1
	adds r1, r4, #0
	bl sub_0800C22C
_0800C09A:
	cmp r5, #0
	ble _0800C0A6
	subs r0, r5, #1
	adds r1, r6, #0
	bl sub_0800C22C
_0800C0A6:
	mov r2, r8
	ldr r7, [r2]
	ldr r0, [r7]
	ldrh r0, [r0]
	subs r0, #1
	cmp r5, r0
	bge _0800C0BC
	adds r0, r5, #1
	adds r1, r6, #0
	bl sub_0800C22C
_0800C0BC:
	ldr r0, [r7]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r6, r0
	bge _0800C0EE
	adds r4, r6, #1
	cmp r5, #0
	ble _0800C0D4
	subs r0, r5, #1
	adds r1, r4, #0
	bl sub_0800C22C
_0800C0D4:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0800C22C
	ldr r0, [r7]
	ldrh r0, [r0]
	subs r0, #1
	cmp r5, r0
	bge _0800C0EE
	adds r0, r5, #1
	adds r1, r4, #0
	bl sub_0800C22C
_0800C0EE:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x13
	bl SetTerrainAt
	movs r2, #0xb4
	lsls r2, r2, #1
	adds r0, r5, #0
	adds r1, r6, #0
	bl MakeTileSimple
	movs r0, #1
_0800C106:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800C114: .4byte gUnknown_0200B0B0
_0800C118: .4byte gUnknown_0808D86C
_0800C11C: .4byte 0x0000417A
_0800C120: .4byte 0x00000A22

