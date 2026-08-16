	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08003C48
sub_08003C48: @ 0x08003C48
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	cmp r5, #0
	bge _08003C5E
	bl sub_08003B8C
	b _08003DA2
_08003C5E:
	bl sub_08025E74
	ldr r2, _08003CC8 @ =gUnknown_0808D78C
	ldr r0, [r2]
	ldr r1, [r0]
	movs r0, #0
	strb r0, [r1, #0x13]
	movs r4, #0
	ldr r0, _08003CCC @ =gUnknown_0808D790
	ldr r3, [r0]
	ldr r1, [r3]
	ldrh r1, [r1, #2]
	cmp r4, r1
	bge _08003C94
	adds r6, r3, #0
	ldr r3, _08003CD0 @ =0x0000417A
_08003C7E:
	ldr r2, [r6]
	lsls r0, r4, #1
	adds r1, r2, r3
	adds r1, r1, r0
	ldrh r0, [r2]
	muls r0, r4, r0
	strh r0, [r1]
	adds r4, #1
	ldrh r2, [r2, #2]
	cmp r4, r2
	blt _08003C7E
_08003C94:
	movs r7, #0
	ldr r1, _08003CCC @ =gUnknown_0808D790
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	cmp r7, r0
	bge _08003D90
	movs r0, #1
	mov sl, r0
_08003CA6:
	movs r4, #0
	ldr r2, [r1]
	ldr r0, [r2]
	adds r1, r7, #1
	mov sb, r1
	ldrh r0, [r0]
	cmp r4, r0
	bge _08003D82
	mov r8, r2
	lsls r6, r7, #1
_08003CBA:
	cmp r5, #3
	beq _08003D38
	cmp r5, #3
	bgt _08003CD4
	cmp r5, #1
	beq _08003D00
	b _08003D76
	.align 2, 0
_08003CC8: .4byte gUnknown_0808D78C
_08003CCC: .4byte gUnknown_0808D790
_08003CD0: .4byte 0x0000417A
_08003CD4:
	cmp r5, #4
	beq _08003D4C
	cmp r5, #7
	bne _08003D76
	mov r0, r8
	ldr r2, [r0]
	ldr r1, _08003CF8 @ =0x0000417A
	adds r3, r2, r1
	adds r3, r3, r6
	ldrh r0, [r3]
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r1, _08003CFC @ =0x00000A22
	adds r1, r1, r2
	mov ip, r1
	add ip, r0
	movs r0, #0x2a
	b _08003D66
	.align 2, 0
_08003CF8: .4byte 0x0000417A
_08003CFC: .4byte 0x00000A22
_08003D00:
	mov r0, r8
	ldr r2, [r0]
	ldr r1, _08003D2C @ =0x0000417A
	adds r3, r2, r1
	adds r3, r3, r6
	ldrh r0, [r3]
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r1, _08003D30 @ =0x00000A22
	adds r1, r1, r2
	mov ip, r1
	add r0, ip
	strh r5, [r0]
	ldrh r0, [r3]
	adds r0, r0, r4
	ldr r1, _08003D34 @ =0x00001432
	adds r2, r2, r1
	adds r2, r2, r0
	mov r0, sl
	strb r0, [r2]
	b _08003D76
	.align 2, 0
_08003D2C: .4byte 0x0000417A
_08003D30: .4byte 0x00000A22
_08003D34: .4byte 0x00001432
_08003D38:
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #3
	bl SetTerrainAt
	adds r0, r4, #0
	adds r1, r7, #0
	bl sub_0800B048
	b _08003D76
_08003D4C:
	mov r1, r8
	ldr r2, [r1]
	ldr r0, _08003DB0 @ =0x0000417A
	adds r3, r2, r0
	adds r3, r3, r6
	ldrh r0, [r3]
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r1, _08003DB4 @ =0x00000A22
	adds r1, r1, r2
	mov ip, r1
	add ip, r0
	movs r0, #0x87
_08003D66:
	mov r1, ip
	strh r0, [r1]
	ldrh r0, [r3]
	adds r0, r0, r4
	ldr r1, _08003DB8 @ =0x00001432
	adds r2, r2, r1
	adds r2, r2, r0
	strb r5, [r2]
_08003D76:
	adds r4, #1
	mov r1, r8
	ldr r0, [r1]
	ldrh r0, [r0]
	cmp r4, r0
	blt _08003CBA
_08003D82:
	mov r7, sb
	ldr r1, _08003DBC @ =gUnknown_0808D790
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	cmp r7, r0
	blt _08003CA6
_08003D90:
	bl sub_080219AC
	bl sub_0800C8D8
	bl sub_0800C874
	ldr r1, _08003DC0 @ =gUnknown_0200B0B0
	ldr r1, [r1]
	strb r0, [r1, #0x12]
_08003DA2:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003DB0: .4byte 0x0000417A
_08003DB4: .4byte 0x00000A22
_08003DB8: .4byte 0x00001432
_08003DBC: .4byte gUnknown_0808D790
_08003DC0: .4byte gUnknown_0200B0B0

