	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080378A8
sub_080378A8: @ 0x080378A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	movs r0, #0
	mov r8, r0
	ldr r0, _08037938 @ =gUnknown_02027F74
	mov r1, r8
	strb r1, [r0, #3]
	strb r1, [r0, #2]
	strb r1, [r0]
	strb r1, [r0, #1]
	ldr r2, _0803793C @ =gUnknown_03003F68
	ldr r1, [r2]
	ldrb r6, [r1]
	ldrb r3, [r1, #1]
	str r3, [sp, #4]
	cmp r6, #0x20
	bls _080378D6
	movs r6, #0x20
_080378D6:
	ldr r7, [sp, #4]
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x20
	bls _080378E4
	movs r0, #0x20
	str r0, [sp, #4]
_080378E4:
	ldrb r0, [r1]
	subs r0, r0, r6
	lsrs r0, r0, #1
	mov r8, r0
	movs r1, #1
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080378F8
	adds r6, #1
_080378F8:
	ldr r0, [sp, #4]
	ands r0, r1
	cmp r0, #0
	beq _08037906
	ldr r1, [sp, #4]
	adds r1, #1
	str r1, [sp, #4]
_08037906:
	movs r3, #0
	mov ip, r3
	ldr r7, [sp, #4]
	cmp ip, r7
	bhs _080379FE
_08037910:
	movs r4, #0
	movs r0, #1
	add r0, ip
	mov sl, r0
	cmp r4, r6
	bhs _080379E8
	ldr r3, _08037938 @ =gUnknown_02027F74
	ldr r1, _08037940 @ =gUnknown_0849D474
	mov sb, r1
	ldr r2, _0803793C @ =gUnknown_03003F68
	ldr r5, [r2]
_08037926:
	ldrb r7, [r5]
	cmp r4, r7
	bhs _08037932
	ldrb r0, [r5, #1]
	cmp ip, r0
	blo _08037948
_08037932:
	ldr r2, _08037944 @ =gUnknown_0849D434
	b _080379B4
	.align 2, 0
_08037938: .4byte gUnknown_02027F74
_0803793C: .4byte gUnknown_03003F68
_08037940: .4byte gUnknown_0849D474
_08037944: .4byte gUnknown_0849D434
_08037948:
	mov r1, r8
	adds r0, r1, r4
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r1, [r0, #2]
	ldr r2, _08037970 @ =gUnknown_0849959C
	ldr r0, [r2]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsrs r2, r1, #5
	movs r0, #0x1f
	ands r0, r1
	cmp r0, #0xa
	beq _0803798C
	cmp r0, #0xa
	bhi _08037974
	cmp r0, #6
	beq _08037984
	b _0803799A
	.align 2, 0
_08037970: .4byte gUnknown_0849959C
_08037974:
	cmp r0, #0xb
	beq _08037994
	cmp r0, #0xe
	bne _0803799A
	ldrb r0, [r3, #1]
	adds r0, #1
	strb r0, [r3, #1]
	b _0803799A
_08037984:
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	b _0803799A
_0803798C:
	ldrb r0, [r3, #2]
	adds r0, #1
	strb r0, [r3, #2]
	b _0803799A
_08037994:
	ldrb r0, [r3, #3]
	adds r0, #1
	strb r0, [r3, #3]
_0803799A:
	movs r0, #0x1f
	ands r1, r0
	lsls r0, r1, #1
	ldr r7, _08037A10 @ =gUnknown_0849D3DC
	adds r0, r0, r7
	ldrh r0, [r0]
	adds r0, r0, r2
	lsls r0, r0, #1
	add r0, sb
	ldrh r0, [r0]
	lsls r0, r0, #1
	ldr r1, _08037A14 @ =gUnknown_080A0F38
	adds r2, r0, r1
_080379B4:
	lsls r0, r4, #1
	add r0, sb
	ldrh r1, [r0]
	lsls r1, r1, #1
	ldr r7, [sp]
	adds r1, r7, r1
	mov r7, ip
	lsls r0, r7, #1
	ldr r7, _08037A18 @ =gUnknown_0849D4F4
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r1, r1, r0
	ldrh r0, [r2]
	strh r0, [r1]
	ldrh r0, [r2, #4]
	strh r0, [r1, #4]
	ldrh r0, [r2, #8]
	strh r0, [r1, #8]
	ldrh r0, [r2, #0xc]
	strh r0, [r1, #0xc]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, r6
	blo _08037926
_080379E8:
	ldr r1, _08037A1C @ =gUnknown_03003F68
	ldr r0, [r1]
	ldrb r0, [r0]
	add r8, r0
	mov r2, sl
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	ldr r3, [sp, #4]
	cmp ip, r3
	blo _08037910
_080379FE:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037A10: .4byte gUnknown_0849D3DC
_08037A14: .4byte gUnknown_080A0F38
_08037A18: .4byte gUnknown_0849D4F4
_08037A1C: .4byte gUnknown_03003F68

