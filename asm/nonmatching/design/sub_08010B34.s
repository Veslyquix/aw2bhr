	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08010B34
sub_08010B34: @ 0x08010B34
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r3, _08010C48 @ =gUnknown_0808D8A4
	ldr r0, [r3]
	ldr r1, [r0]
	lsls r2, r5, #1
	ldr r6, _08010C4C @ =0x0000417A
	adds r0, r1, r6
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r2, _08010C50 @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r1, [r1]
	ldr r6, _08010C54 @ =0xFFFFFEBE
	adds r0, r1, r6
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _08010BAE
	movs r0, #0xa0
	lsls r0, r0, #1
	cmp r1, r0
	beq _08010BAE
	adds r0, #1
	cmp r1, r0
	beq _08010BAE
	adds r0, #0x1f
	cmp r1, r0
	beq _08010BAE
	adds r0, #1
	cmp r1, r0
	beq _08010BAE
	adds r0, #1
	cmp r1, r0
	beq _08010BAE
	adds r0, #1
	cmp r1, r0
	beq _08010BAE
	subs r0, #0x41
	cmp r1, r0
	beq _08010BAE
	adds r0, #1
	cmp r1, r0
	beq _08010BAE
	subs r0, #2
	cmp r1, r0
	beq _08010BAE
	subs r0, #1
	cmp r1, r0
	beq _08010BAE
	subs r0, #0x1d
	cmp r1, r0
	beq _08010BAE
	subs r0, #1
	cmp r1, r0
	beq _08010BAE
	b _08010D1E
_08010BAE:
	ldr r0, [r3]
	ldr r1, [r0]
	lsls r2, r5, #1
	ldr r3, _08010C4C @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r6, _08010C50 @ =0x00000A22
	adds r1, r1, r6
	adds r1, r1, r0
	ldr r2, _08010C58 @ =0xFFFFFE9E
	adds r0, r2, #0
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _08010C0A
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800F8D4
	cmp r0, #0
	beq _08010BE4
	b _08010D1E
_08010BE4:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800C608
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xf
	bl SetTerrainAt
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl sub_0800FD44
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl MakeTileSimple
_08010C0A:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl sub_0800F564
	cmp r0, #2
	bne _08010C60
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl sub_0800F564
	cmp r0, #2
	beq _08010D1E
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	bl sub_0800F564
	cmp r0, #2
	beq _08010D1E
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	bl sub_0800F564
	cmp r0, #2
	beq _08010D1E
	ldr r0, _08010C5C @ =0x00000121
	b _08010D22
	.align 2, 0
_08010C48: .4byte gUnknown_0808D8A4
_08010C4C: .4byte 0x0000417A
_08010C50: .4byte 0x00000A22
_08010C54: .4byte 0xFFFFFEBE
_08010C58: .4byte 0xFFFFFE9E
_08010C5C: .4byte 0x00000121
_08010C60:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl sub_0800F564
	cmp r0, #2
	bne _08010C9E
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl sub_0800F564
	cmp r0, #2
	beq _08010D1E
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	bl sub_0800F564
	cmp r0, #2
	beq _08010D1E
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	bl sub_0800F564
	cmp r0, #2
	beq _08010D1E
	movs r0, #0x90
	lsls r0, r0, #1
	b _08010D22
_08010C9E:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	bl sub_0800F564
	cmp r0, #2
	bne _08010CE0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl sub_0800F564
	cmp r0, #2
	beq _08010D1E
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl sub_0800F564
	cmp r0, #2
	beq _08010D1E
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	bl sub_0800F564
	cmp r0, #2
	beq _08010D1E
	ldr r0, _08010CDC @ =0x00000103
	b _08010D22
	.align 2, 0
_08010CDC: .4byte 0x00000103
_08010CE0:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	bl sub_0800F564
	cmp r0, #2
	bne _08010D1E
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl sub_0800F564
	cmp r0, #2
	beq _08010D1E
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl sub_0800F564
	cmp r0, #2
	beq _08010D1E
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	bl sub_0800F564
	cmp r0, #2
	beq _08010D1E
	movs r0, #0x81
	lsls r0, r0, #1
	b _08010D22
_08010D1E:
	movs r0, #1
	rsbs r0, r0, #0
_08010D22:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

