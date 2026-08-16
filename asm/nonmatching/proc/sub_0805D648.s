	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805D648
sub_0805D648: @ 0x0805D648
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r4, [sp, #0x38]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #4]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #8]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #0xc]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #0x10]
	movs r0, #0
	mov sl, r0
	ldr r1, _0805D6BC @ =gUnknown_0816DA44
	ldr r0, [r1]
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0x18
	beq _0805D686
	b _0805D7AE
_0805D686:
	cmp r2, #2
	beq _0805D68C
	b _0805D7AE
_0805D68C:
	movs r0, #0xff
	bl sub_0801F838
	ldr r0, [sp]
	ldr r1, [sp, #4]
	movs r2, #9
	movs r3, #0
	bl sub_0801F9C0
	movs r3, #0
	ldr r1, _0805D6C0 @ =gUnknown_0816DA48
	ldr r0, [r1]
	ldr r0, [r0]
	mov r8, r1
	ldrh r0, [r0, #2]
	cmp sl, r0
	bge _0805D76A
_0805D6AE:
	movs r7, #0
	adds r2, r1, #0
	ldr r0, [r2]
	ldr r0, [r0]
	adds r1, r3, #1
	mov sb, r1
	b _0805D756
	.align 2, 0
_0805D6BC: .4byte gUnknown_0816DA44
_0805D6C0: .4byte gUnknown_0816DA48
_0805D6C4:
	ldr r1, _0805D784 @ =gUnknown_03003340
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _0805D74E
	ldr r5, [r2]
	ldr r1, [r5]
	lsls r4, r3, #1
	ldr r6, _0805D788 @ =0x0000417A
	adds r0, r1, r6
	adds r0, r0, r4
	ldrh r0, [r0]
	adds r0, r0, r7
	adds r1, #0x12
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0805D74E
	ldr r0, _0805D78C @ =gUnknown_03003F38
	ldrb r0, [r0]
	ldrb r1, [r1]
	str r3, [sp, #0x14]
	bl sub_08026F9C
	lsls r0, r0, #0x18
	ldr r3, [sp, #0x14]
	cmp r0, #0
	bne _0805D74E
	ldr r1, [r5]
	adds r0, r1, r6
	adds r0, r0, r4
	ldrh r0, [r0]
	adds r0, r0, r7
	adds r1, #0x12
	adds r1, r1, r0
	ldrb r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r2, _0805D790 @ =gUnknown_08499594
	ldr r1, [r2]
	adds r1, r1, r0
	ldr r0, _0805D794 @ =gUnknown_03003FC0
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	bne _0805D74A
	ldrb r1, [r1]
	adds r0, r1, #0
	subs r0, #0xa
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _0805D74E
	adds r0, r1, #0
	cmp r0, #0x11
	beq _0805D74E
	cmp r0, #0x15
	beq _0805D74E
	cmp r0, #0x16
	beq _0805D74E
	cmp r0, #0x18
	beq _0805D74E
_0805D74A:
	movs r0, #1
	add sl, r0
_0805D74E:
	adds r7, #1
	mov r2, r8
	ldr r0, [r2]
	ldr r0, [r0]
_0805D756:
	ldrh r0, [r0]
	cmp r7, r0
	blt _0805D6C4
	mov r3, sb
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	cmp r3, r0
	blt _0805D6AE
_0805D76A:
	mov r1, sl
	cmp r1, #0
	beq _0805D79C
	ldr r0, _0805D798 @ =gUnknown_030040D8
	ldr r0, [r0]
	ldrb r1, [r0, #1]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _0805D7AA
	movs r2, #0xb
	str r2, [sp, #8]
	b _0805D7AE
	.align 2, 0
_0805D784: .4byte gUnknown_03003340
_0805D788: .4byte 0x0000417A
_0805D78C: .4byte gUnknown_03003F38
_0805D790: .4byte gUnknown_08499594
_0805D794: .4byte gUnknown_03003FC0
_0805D798: .4byte gUnknown_030040D8
_0805D79C:
	ldr r0, _0805D7F4 @ =gUnknown_030040D8
	ldr r0, [r0]
	ldrb r1, [r0, #1]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805D7AE
_0805D7AA:
	movs r0, #0xc
	str r0, [sp, #8]
_0805D7AE:
	ldr r6, _0805D7F4 @ =gUnknown_030040D8
	ldr r0, [r6]
	bl sub_080202A4
	ldr r1, [sp]
	lsls r4, r1, #0x10
	asrs r4, r4, #0x10
	ldr r2, [sp, #4]
	lsls r0, r2, #0x10
	asrs r7, r0, #0x10
	ldr r5, _0805D7F8 @ =gUnknown_03003110
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl sub_0802042C
	ldr r1, _0805D7FC @ =gUnknown_030046CC
	adds r0, r5, #0
	bl sub_08034400
	ldr r6, [r6]
	ldrb r0, [r6, #2]
	cmp r0, r4
	bne _0805D804
	ldrb r0, [r6, #3]
	cmp r0, r7
	bne _0805D804
	ldr r0, [sp, #8]
	cmp r0, #2
	bne _0805D804
	ldr r0, _0805D800 @ =gUnknown_03004680
	movs r1, #1
	bl sub_08071910
	.align 2, 0
_0805D7F4: .4byte gUnknown_030040D8
_0805D7F8: .4byte gUnknown_03003110
_0805D7FC: .4byte gUnknown_030046CC
_0805D800: .4byte gUnknown_03004680
_0805D804:
	ldr r2, _0805D868 @ =gUnknown_030046C0
	ldr r0, _0805D86C @ =gUnknown_03003F38
	ldrb r0, [r0]
	strb r0, [r2, #1]
	ldr r0, _0805D870 @ =gUnknown_03001FD4
	ldr r0, [r0]
	str r0, [r2, #8]
	ldr r1, _0805D874 @ =gUnknown_03003F24
	ldrh r0, [r1]
	strb r0, [r2, #4]
	ldrh r0, [r1, #2]
	strb r0, [r2, #5]
	mov r1, sp
	ldrb r1, [r1]
	strb r1, [r2, #2]
	mov r0, sp
	ldrb r0, [r0, #4]
	strb r0, [r2, #3]
	mov r1, sp
	ldrb r1, [r1, #8]
	strb r1, [r2]
	mov r0, sp
	ldrb r0, [r0, #0xc]
	strb r0, [r2, #6]
	mov r1, sp
	ldrb r1, [r1, #0x10]
	strb r1, [r2, #7]
	ldr r0, _0805D878 @ =gUnknown_030040D8
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	ldr r1, _0805D87C @ =gUnknown_03004074
	ldrb r1, [r1]
	subs r0, r0, r1
	strb r0, [r2, #0x12]
	movs r0, #1
	strb r0, [r2, #0x13]
	ldr r0, _0805D880 @ =gUnknown_03003FC0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805D85E
	bl sub_0805D5EC
_0805D85E:
	ldr r0, _0805D884 @ =gUnknown_03004680
	movs r1, #1
	bl sub_08071910
	.align 2, 0
_0805D868: .4byte gUnknown_030046C0
_0805D86C: .4byte gUnknown_03003F38
_0805D870: .4byte gUnknown_03001FD4
_0805D874: .4byte gUnknown_03003F24
_0805D878: .4byte gUnknown_030040D8
_0805D87C: .4byte gUnknown_03004074
_0805D880: .4byte gUnknown_03003FC0
_0805D884: .4byte gUnknown_03004680

