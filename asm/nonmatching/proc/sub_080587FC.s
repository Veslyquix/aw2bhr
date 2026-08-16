	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080587FC
sub_080587FC: @ 0x080587FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp, #8]
	ldr r0, _080588C4 @ =gUnknown_0816D940
	ldr r1, [r0]
	ldr r5, [r1]
	movs r1, #0
	mov sb, r1
	ldr r2, _080588C8 @ =gUnknown_08499590
	ldr r1, [r2]
	ldrh r1, [r1, #2]
	cmp sb, r1
	blt _08058820
	b _08058A04
_08058820:
	mov sl, r2
_08058822:
	movs r7, #0
	mov r2, sl
	ldr r0, [r2]
	mov r3, sb
	adds r3, #1
	str r3, [sp, #0xc]
	ldrh r0, [r0]
	cmp r7, r0
	blt _08058836
	b _080589F4
_08058836:
	mov r8, sp
_08058838:
	ldr r1, _080588CC @ =gUnknown_03003340
	mov r2, sb
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08058850
	b _080589E6
_08058850:
	ldr r0, _080588D0 @ =gUnknown_03003FC0
	ldrb r0, [r0, #2]
	bl sub_08035000
	adds r0, #0x28
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	mov r3, sb
	lsls r2, r3, #1
	cmp r0, #0
	bne _0805890C
	ldr r1, _080588D4 @ =gUnknown_020288B4
	mov r3, sl
	ldr r0, [r3]
	ldr r3, _080588D8 @ =0x0000417A
	adds r0, r0, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r7
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805890C
	lsls r0, r7, #0x10
	mov r2, sb
	lsls r1, r2, #0x10
	lsrs r0, r0, #0x10
	orrs r0, r1
	str r0, [sp]
	ldr r0, _080588DC @ =gUnknown_03003F38
	ldrb r0, [r0]
	mov r4, sp
	movs r1, #0
	mov r2, sp
	bl sub_080251BC
	ldr r0, _080588E0 @ =gUnknown_030013D0
	movs r3, #0x18
	ldrsh r0, [r0, r3]
	cmp r0, #0
	bne _080588A6
	b _080589E6
_080588A6:
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _080588E4
	adds r0, r7, #0
	mov r1, sb
	mov r2, sp
	bl sub_08058C54
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080588C2
	b _080589E6
_080588C2:
	b _080588F2
	.align 2, 0
_080588C4: .4byte gUnknown_0816D940
_080588C8: .4byte gUnknown_08499590
_080588CC: .4byte gUnknown_03003340
_080588D0: .4byte gUnknown_03003FC0
_080588D4: .4byte gUnknown_020288B4
_080588D8: .4byte 0x0000417A
_080588DC: .4byte gUnknown_03003F38
_080588E0: .4byte gUnknown_030013D0
_080588E4:
	ldr r0, _08058908 @ =gUnknown_030040D8
	ldr r1, [r0]
	ldrb r0, [r1, #2]
	mov r2, r8
	strh r0, [r2]
	ldrb r0, [r1, #3]
	strh r0, [r4, #2]
_080588F2:
	lsls r0, r7, #8
	mov r3, sb
	orrs r0, r3
	strh r0, [r5]
	mov r1, r8
	ldrh r0, [r1]
	strh r0, [r5, #4]
	ldrh r0, [r1, #2]
	strh r0, [r5, #6]
	movs r0, #1
	b _080589E2
	.align 2, 0
_08058908: .4byte gUnknown_030040D8
_0805890C:
	mov r3, sl
	ldr r0, [r3]
	ldr r3, _08058988 @ =0x0000417A
	adds r1, r0, r3
	adds r1, r1, r2
	ldrh r1, [r1]
	adds r1, r1, r7
	adds r0, #0x12
	adds r0, r0, r1
	ldrb r4, [r0]
	cmp r4, #0
	beq _080589E6
	ldr r0, _0805898C @ =gUnknown_03003F38
	ldrb r0, [r0]
	adds r1, r4, #0
	bl sub_08026F9C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r6, _08058990 @ =gUnknown_0816D944
	cmp r0, #1
	beq _080589E6
	ldr r1, _08058994 @ =gUnknown_08499594
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0x18
	bne _08058956
	adds r0, r4, #0
	bl sub_080257C0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080589E6
_08058956:
	ldr r0, _08058998 @ =gUnknown_030033EC
	ldrb r0, [r0]
	lsls r1, r7, #0x18
	lsrs r1, r1, #0x18
	mov r3, sb
	lsls r2, r3, #0x18
	lsrs r2, r2, #0x18
	bl sub_08020DBC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080589E6
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0805899C
	adds r0, r4, #0
	mov r1, sp
	bl sub_08058BB4
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080589E6
	b _080589AA
	.align 2, 0
_08058988: .4byte 0x0000417A
_0805898C: .4byte gUnknown_03003F38
_08058990: .4byte gUnknown_0816D944
_08058994: .4byte gUnknown_08499594
_08058998: .4byte gUnknown_030033EC
_0805899C:
	ldr r0, _08058A20 @ =gUnknown_030040D8
	ldr r1, [r0]
	ldrb r0, [r1, #2]
	mov r2, r8
	strh r0, [r2]
	ldrb r0, [r1, #3]
	strh r0, [r2, #2]
_080589AA:
	ldr r0, [r6]
	ldrb r0, [r0]
	mov r6, sp
	adds r1, r4, #0
	mov r2, sp
	bl sub_080251BC
	ldr r0, _08058A24 @ =gUnknown_030013D0
	movs r3, #0x18
	ldrsh r0, [r0, r3]
	cmp r0, #0
	beq _080589E6
	add r0, sp, #4
	bl sub_08058A2C
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _080589D4
	movs r0, #0
	str r0, [sp, #4]
_080589D4:
	strh r4, [r5]
	mov r1, r8
	ldrh r0, [r1]
	strh r0, [r5, #4]
	ldrh r0, [r6, #2]
	strh r0, [r5, #6]
	ldr r0, [sp, #4]
_080589E2:
	strh r0, [r5, #2]
	adds r5, #8
_080589E6:
	adds r7, #1
	mov r2, sl
	ldr r0, [r2]
	ldrh r0, [r0]
	cmp r7, r0
	bge _080589F4
	b _08058838
_080589F4:
	ldr r3, [sp, #0xc]
	mov sb, r3
	mov r1, sl
	ldr r0, [r1]
	ldrh r0, [r0, #2]
	cmp sb, r0
	bge _08058A04
	b _08058822
_08058A04:
	movs r0, #0
	strh r0, [r5]
	ldr r0, _08058A28 @ =gUnknown_03003338
	ldr r0, [r0]
	subs r0, r5, r0
	asrs r0, r0, #3
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08058A20: .4byte gUnknown_030040D8
_08058A24: .4byte gUnknown_030013D0
_08058A28: .4byte gUnknown_03003338

