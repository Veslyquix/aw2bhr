	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080560A4
sub_080560A4: @ 0x080560A4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	movs r6, #0
	cmp r0, #0
	bne _080560C2
	b _08056320
_080560C2:
	ldr r2, _08056118 @ =gUnknown_085D6A48
	ldr r0, _0805611C @ =gUnknown_03004580
	lsls r1, r7, #4
	adds r0, #2
	adds r1, r1, r0
	ldrh r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #4]
	cmp r0, #1
	bne _08056144
	adds r3, r6, #0
	lsls r0, r7, #2
	ldr r1, _08056120 @ =gUnknown_085521B4
	mov sb, r1
	adds r0, r0, r7
	lsls r1, r0, #2
	movs r0, #0x6c
	adds r4, r7, #0
	muls r4, r0, r4
	ldr r5, _08056124 @ =gUnknown_0202980A
_080560F0:
	lsls r0, r3, #2
	adds r0, r0, r1
	add r0, sb
	ldrh r2, [r0]
	lsls r0, r6, #1
	adds r0, r0, r4
	adds r0, r0, r5
	strh r2, [r0]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, ip
	beq _08056128
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #4
	bls _080560F0
	b _0805623A
	.align 2, 0
_08056118: .4byte gUnknown_085D6A48
_0805611C: .4byte gUnknown_03004580
_08056120: .4byte gUnknown_085521B4
_08056124: .4byte gUnknown_0202980A
_08056128:
	mov r1, ip
	subs r1, #1
	lsls r1, r1, #1
	adds r1, r1, r4
	adds r1, r1, r5
	ldr r2, _08056140 @ =gUnknown_08552148
	lsls r0, r7, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	b _0805623A
	.align 2, 0
_08056140: .4byte gUnknown_08552148
_08056144:
	movs r3, #0
	lsls r2, r7, #2
	mov r8, r2
	adds r5, r2, r7
	movs r0, #0xb4
	adds r1, r7, #0
	muls r1, r0, r1
	mov sl, r1
	movs r0, #0x6c
	adds r2, r7, #0
	muls r2, r0, r2
	mov sb, r2
_0805615C:
	lsls r0, r3, #2
	lsls r4, r5, #2
	adds r0, r0, r4
	ldr r1, _08056218 @ =gUnknown_0855218C
	adds r0, r0, r1
	ldrh r2, [r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	add r0, sl
	ldr r1, _0805621C @ =gUnknown_02029A10
	adds r0, r0, r1
	ldrb r1, [r0, #1]
	ldrb r0, [r0]
	cmp r1, r0
	beq _08056196
	lsls r0, r6, #1
	add r0, sb
	ldr r1, _08056220 @ =gUnknown_0202980A
	adds r0, r0, r1
	strh r2, [r0]
	adds r0, r2, r5
	ldr r2, _08056224 @ =gUnknown_02029C14
	adds r0, r0, r2
	movs r1, #2
	strb r1, [r0]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_08056196:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #4
	bls _0805615C
	cmp ip, r6
	bls _0805623A
	movs r5, #0
	mov r3, r8
	adds r3, r3, r7
	mov sl, r3
	mov r8, r4
	movs r0, #0xb4
	adds r1, r7, #0
	muls r1, r0, r1
	mov sb, r1
_080561B6:
	lsls r0, r5, #2
	add r0, r8
	ldr r2, _08056218 @ =gUnknown_0855218C
	adds r0, r0, r2
	ldrh r2, [r0]
	mov r3, sl
	adds r0, r2, r3
	ldr r1, _08056224 @ =gUnknown_02029C14
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805622C
	lsls r1, r2, #3
	adds r1, r1, r2
	lsls r1, r1, #2
	add r1, sb
	ldr r3, _0805621C @ =gUnknown_02029A10
	adds r1, r1, r3
	lsls r0, r2, #2
	add r0, r8
	ldr r3, _08056228 @ =gUnknown_08554A00
	adds r0, r0, r3
	str r0, [sp, #4]
	movs r3, #0xc8
	lsls r3, r3, #1
	adds r3, r0, r3
	ldrh r0, [r3]
	strh r0, [r1, #8]
	movs r0, #0xc9
	lsls r0, r0, #1
	ldr r3, [sp, #4]
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1, #0xa]
	movs r0, #1
	strb r0, [r4]
	lsls r1, r6, #1
	movs r0, #0x6c
	muls r0, r7, r0
	adds r1, r1, r0
	ldr r3, _08056220 @ =gUnknown_0202980A
	adds r1, r1, r3
	strh r2, [r1]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, ip
	beq _08056288
	b _08056230
	.align 2, 0
_08056218: .4byte gUnknown_0855218C
_0805621C: .4byte gUnknown_02029A10
_08056220: .4byte gUnknown_0202980A
_08056224: .4byte gUnknown_02029C14
_08056228: .4byte gUnknown_08554A00
_0805622C:
	movs r0, #0
	strb r0, [r4]
_08056230:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #4
	bls _080561B6
_0805623A:
	cmp r6, ip
	bls _08056288
	movs r1, #0
	mov r0, ip
	subs r5, r6, r0
	cmp r1, ip
	bhs _08056264
	movs r0, #0x6c
	adds r2, r7, #0
	muls r2, r0, r2
	ldr r4, _08056280 @ =gUnknown_02029816
	movs r3, #1
_08056252:
	lsls r0, r1, #1
	adds r0, r0, r2
	adds r0, r0, r4
	strh r3, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, ip
	blo _08056252
_08056264:
	subs r1, #1
	lsls r1, r1, #0x10
	ldr r2, _08056284 @ =gUnknown_02029808
	lsrs r1, r1, #0xf
	movs r0, #0x6c
	muls r0, r7, r0
	adds r1, r1, r0
	adds r2, #0xe
	adds r1, r1, r2
	ldrh r0, [r1]
	adds r0, r0, r5
	strh r0, [r1]
	b _080562AA
	.align 2, 0
_08056280: .4byte gUnknown_02029816
_08056284: .4byte gUnknown_02029808
_08056288:
	movs r1, #0
	cmp r1, ip
	bhs _080562AA
	movs r0, #0x6c
	adds r2, r7, #0
	muls r2, r0, r2
	ldr r4, _08056330 @ =gUnknown_02029816
	movs r3, #1
_08056298:
	lsls r0, r1, #1
	adds r0, r0, r2
	adds r0, r0, r4
	strh r3, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, ip
	blo _08056298
_080562AA:
	ldr r0, _08056334 @ =gUnknown_08551E64
	ldr r3, _08056338 @ =gUnknown_030045A0
	ldr r2, _0805633C @ =gUnknown_0300450C
	ldrh r1, [r2]
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r1, [r1]
	mov sb, r1
	movs r5, #0
	cmp r5, ip
	bhs _0805631A
	movs r0, #0x6c
	adds r1, r7, #0
	muls r1, r0, r1
	mov r8, r1
	lsls r6, r7, #1
	mov sl, r2
	movs r1, #1
	adds r0, r7, #0
	eors r0, r1
	lsls r0, r0, #1
	adds r4, r0, r3
_080562DC:
	lsls r3, r5, #1
	add r3, r8
	ldr r2, _08056340 @ =gUnknown_02029822
	adds r3, r3, r2
	mov r1, sl
	ldrh r0, [r1]
	adds r0, r6, r0
	lsls r0, r0, #1
	ldr r2, _08056344 @ =gUnknown_08551E7C
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	adds r1, r1, r5
	lsls r1, r1, #1
	add r1, sb
	ldrh r2, [r4]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #1
	ldr r2, _08056348 @ =gUnknown_08551D2A
	adds r0, r0, r2
	ldrh r0, [r0]
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r3]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, ip
	blo _080562DC
_0805631A:
	adds r0, r7, #0
	bl sub_08056638
_08056320:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056330: .4byte gUnknown_02029816
_08056334: .4byte gUnknown_08551E64
_08056338: .4byte gUnknown_030045A0
_0805633C: .4byte gUnknown_0300450C
_08056340: .4byte gUnknown_02029822
_08056344: .4byte gUnknown_08551E7C
_08056348: .4byte gUnknown_08551D2A

