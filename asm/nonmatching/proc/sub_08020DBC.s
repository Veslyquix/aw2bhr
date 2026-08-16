	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08020DBC
sub_08020DBC: @ 0x08020DBC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	movs r6, #0
	ldr r0, _08020EB4 @ =gUnknown_03003FC0
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _08020ECC
	ldr r7, _08020EB8 @ =gUnknown_08499590
	ldr r1, [r7]
	lsls r0, r4, #1
	mov r8, r0
	ldr r2, _08020EBC @ =0x0000417A
	mov sb, r2
	adds r0, r1, r2
	add r0, r8
	ldrh r0, [r0]
	adds r2, r0, r5
	ldr r3, _08020EC0 @ =0x00001E42
	adds r0, r1, r3
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _08020EB0
	ldr r3, _08020EC4 @ =0x00001432
	adds r0, r1, r3
	adds r0, r0, r2
	ldrb r0, [r0]
	movs r1, #0x1f
	ands r1, r0
	cmp r1, #4
	beq _08020E10
	cmp r1, #0x13
	bne _08020ECC
_08020E10:
	mov r0, ip
	bl sub_08043050
	movs r1, #8
	ands r1, r0
	cmp r1, #0
	bne _08020ECC
	cmp r5, #0
	beq _08020E2E
	subs r0, r5, #1
	adds r1, r4, #0
	bl sub_08025744
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_08020E2E:
	cmp r4, #0
	beq _08020E44
	subs r1, r4, #1
	adds r0, r5, #0
	bl sub_08025744
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_08020E44:
	ldr r0, [r7]
	ldrh r0, [r0]
	subs r0, #1
	cmp r5, r0
	bge _08020E60
	adds r0, r5, #1
	adds r1, r4, #0
	bl sub_08025744
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_08020E60:
	ldr r0, [r7]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r4, r0
	bge _08020E7C
	adds r1, r4, #1
	adds r0, r5, #0
	bl sub_08025744
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_08020E7C:
	cmp r6, #0
	bne _08020ECC
	ldr r1, [r7]
	mov r2, sb
	adds r0, r1, r2
	add r0, r8
	ldrh r0, [r0]
	adds r0, r0, r5
	adds r1, #0x12
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _08020EB0
	ldr r2, _08020EC8 @ =gUnknown_08499594
	ldrb r0, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	subs r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bls _08020ECC
_08020EB0:
	movs r0, #0
	b _08020ECE
	.align 2, 0
_08020EB4: .4byte gUnknown_03003FC0
_08020EB8: .4byte gUnknown_08499590
_08020EBC: .4byte 0x0000417A
_08020EC0: .4byte 0x00001E42
_08020EC4: .4byte 0x00001432
_08020EC8: .4byte gUnknown_08499594
_08020ECC:
	movs r0, #1
_08020ECE:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

