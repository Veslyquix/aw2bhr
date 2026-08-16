	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802925C
sub_0802925C: @ 0x0802925C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	ldr r4, _080292B8 @ =gUnknown_08090B60
	ldr r0, [r4]
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r3, r0, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	mov r8, r4
	cmp r3, r0
	beq _0802927C
	b _08029396
_0802927C:
	ldr r1, _080292BC @ =gUnknown_08090B64
	ldr r0, [r1]
	ldr r4, [r0]
	ldrh r2, [r4, #4]
	movs r0, #2
	ands r0, r2
	adds r7, r1, #0
	cmp r0, #0
	beq _080292CC
	ldr r4, _080292C0 @ =gUnknown_030033E4
	ldr r1, _080292C4 @ =gUnknown_03003100
	ldrh r0, [r1]
	strh r0, [r4]
	ldrh r0, [r1, #2]
	strh r0, [r4, #2]
	ldr r0, _080292C8 @ =gUnknown_03003F40
	str r3, [r0]
	adds r0, r5, #0
	bl Proc_End
	bl sub_08028EE4
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	bl sub_08029088
	b _08029396
	.align 2, 0
_080292B8: .4byte gUnknown_08090B60
_080292BC: .4byte gUnknown_08090B64
_080292C0: .4byte gUnknown_030033E4
_080292C4: .4byte gUnknown_03003100
_080292C8: .4byte gUnknown_03003F40
_080292CC:
	movs r3, #1
	ands r3, r2
	cmp r3, #0
	beq _080292F0
	ldr r0, _080292EC @ =gUnknown_03003F40
	adds r1, r5, #0
	adds r1, #0x64
	movs r3, #0
	ldrsh r1, [r1, r3]
	str r1, [r0]
	adds r0, r5, #0
	bl Proc_End
	bl sub_08028EE4
	b _08029396
	.align 2, 0
_080292EC: .4byte gUnknown_03003F40
_080292F0:
	adds r2, r5, #0
	adds r2, #0x64
	ldrh r6, [r2]
	ldrh r1, [r4, #2]
	movs r0, #0x90
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	beq _08029318
	adds r0, r6, #1
	strh r0, [r4]
	adds r1, r5, #0
	adds r1, #0x66
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0
	ldrsh r1, [r1, r2]
	cmp r0, r1
	bne _08029318
	strh r3, [r4]
_08029318:
	ldr r0, [r7]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x60
	ands r0, r1
	cmp r0, #0
	beq _0802933C
	movs r3, #0
	ldrsh r0, [r4, r3]
	cmp r0, #0
	bgt _08029336
	adds r0, r5, #0
	adds r0, #0x66
	ldrh r0, [r0]
	strh r0, [r4]
_08029336:
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
_0802933C:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	movs r2, #0
	ldrsh r1, [r4, r2]
	cmp r0, r1
	beq _0802934E
	movs r0, #0x77
	bl sub_0803B4DC
_0802934E:
	movs r3, #0
	ldrsh r0, [r4, r3]
	bl sub_080413A4
	ldr r2, _08029388 @ =gUnknown_030033E4
	ldrh r1, [r0, #4]
	strh r1, [r2]
	ldrh r1, [r0, #6]
	strh r1, [r2, #2]
	movs r1, #4
	ldrsh r2, [r0, r1]
	movs r3, #6
	ldrsh r1, [r0, r3]
	adds r0, r2, #0
	bl sub_08029088
	mov r1, r8
	ldr r0, [r1]
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0802938C
	bl sub_0802DCA4
	b _08029396
	.align 2, 0
_08029388: .4byte gUnknown_030033E4
_0802938C:
	movs r0, #2
	bl sub_08023274
	bl sub_0802A7C4
_08029396:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

