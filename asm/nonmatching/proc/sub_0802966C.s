	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802966C
sub_0802966C: @ 0x0802966C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r7, _08029724 @ =gUnknown_03002EE0
	ldr r0, [r7]
	ldrh r1, [r0, #2]
	movs r0, #0x50
	ands r0, r1
	cmp r0, #0
	beq _0802968A
	bl sub_080294FC
_0802968A:
	ldr r0, [r7]
	ldrh r1, [r0, #2]
	movs r0, #0xa0
	ands r0, r1
	cmp r0, #0
	beq _0802969A
	bl sub_08029570
_0802969A:
	ldr r6, _08029728 @ =gUnknown_030033E4
	ldr r0, _0802972C @ =gUnknown_03003100
	mov r8, r0
	ldr r3, _08029730 @ =gUnknown_0849A06C
	ldr r5, _08029734 @ =gUnknown_03001470
	ldr r4, _08029738 @ =gUnknown_03001FBC
	movs r2, #0
	ldrsh r1, [r4, r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r5
	movs r2, #0x20
	ldrsh r1, [r0, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, #1
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, r8
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r6]
	movs r2, #0
	ldrsh r1, [r4, r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r5
	movs r2, #0x20
	ldrsh r1, [r0, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, #2
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, r8
	ldrh r1, [r1, #2]
	adds r0, r0, r1
	strh r0, [r6, #2]
	movs r0, #1
	str r3, [sp, #4]
	bl sub_08023274
	ldr r0, [r7]
	ldrh r1, [r0, #4]
	movs r0, #2
	ands r0, r1
	ldr r3, [sp, #4]
	cmp r0, #0
	beq _08029740
	movs r2, #0
	ldrsh r0, [r4, r2]
	bl sub_08015328
	bl sub_08034F8C
	bl sub_0802D558
	ldr r1, _0802973C @ =gUnknown_03003F24
	ldrh r0, [r1]
	strh r0, [r6]
	ldrh r0, [r1, #2]
	strh r0, [r6, #2]
	b _08029840
	.align 2, 0
_08029724: .4byte gUnknown_03002EE0
_08029728: .4byte gUnknown_030033E4
_0802972C: .4byte gUnknown_03003100
_08029730: .4byte gUnknown_0849A06C
_08029734: .4byte gUnknown_03001470
_08029738: .4byte gUnknown_03001FBC
_0802973C: .4byte gUnknown_03003F24
_08029740:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08029840
	ldr r2, _08029850 @ =gUnknown_03003F40
	movs r6, #0
	ldrsh r1, [r4, r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r5
	movs r1, #0x20
	ldrsh r0, [r0, r1]
	str r0, [r2]
	ldr r2, _08029854 @ =gUnknown_030040D8
	ldr r1, [r2]
	movs r6, #0
	ldrsh r0, [r4, r6]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #5
	adds r2, r2, r5
	movs r6, #0x22
	ldrsh r0, [r2, r6]
	adds r1, #7
	adds r1, r1, r0
	ldrb r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r6, _08029858 @ =gUnknown_08499594
	ldr r1, [r6]
	adds r7, r1, r0
	ldr r0, _0802985C @ =gUnknown_030033E8
	mov sl, r0
	ldr r1, _08029860 @ =gUnknown_03000558
	mov sb, r1
	ldrb r1, [r1]
	add r1, sl
	ldrh r0, [r2, #0x20]
	adds r0, #1
	strb r0, [r1]
	ldr r6, _08029864 @ =gUnknown_03003110
	movs r2, #0
	ldrsh r1, [r4, r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r5
	movs r2, #0x20
	ldrsh r1, [r0, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, #3
	adds r0, r0, r3
	ldrb r0, [r0]
	strb r0, [r6]
	movs r0, #0
	ldrsh r1, [r4, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r5
	movs r2, #0x20
	ldrsh r1, [r0, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, #4
	adds r0, r0, r3
	ldrb r0, [r0]
	strb r0, [r6, #1]
	mov r3, r8
	movs r1, #0
	ldrsh r0, [r3, r1]
	movs r2, #2
	ldrsh r1, [r3, r2]
	movs r3, #1
	rsbs r3, r3, #0
	adds r2, r6, #0
	bl sub_0802E7C8
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #1
	bne _08029802
	movs r3, #0
	ldrsh r1, [r4, r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r5
	strh r2, [r0, #0x24]
	mov r5, sb
	ldrb r0, [r5]
	add r0, sl
	movs r1, #5
	strb r1, [r0]
_08029802:
	mov r1, r8
	ldrh r0, [r1]
	ldrh r1, [r1, #2]
	ldr r2, _08029854 @ =gUnknown_030040D8
	ldr r3, [r2]
	ldr r5, _08029858 @ =gUnknown_08499594
	ldr r2, [r5]
	subs r3, r3, r2
	lsls r2, r3, #2
	adds r2, r2, r3
	lsls r3, r2, #4
	adds r2, r2, r3
	lsls r3, r2, #8
	adds r2, r2, r3
	lsls r3, r2, #0x10
	adds r2, r2, r3
	rsbs r2, r2, #0
	asrs r2, r2, #2
	movs r3, #0xc0
	ands r2, r3
	lsrs r2, r2, #6
	ldrb r3, [r7]
	str r6, [sp]
	bl sub_080357E0
	ldrb r0, [r4]
	bl sub_08015C30
	ldrb r0, [r7]
	bl sub_08029868
_08029840:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08029850: .4byte gUnknown_03003F40
_08029854: .4byte gUnknown_030040D8
_08029858: .4byte gUnknown_08499594
_0802985C: .4byte gUnknown_030033E8
_08029860: .4byte gUnknown_03000558
_08029864: .4byte gUnknown_03003110

