	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080040C8
sub_080040C8: @ 0x080040C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	movs r0, #7
	mov ip, r0
	movs r6, #0
	ldr r0, _08004340 @ =gUnknown_0808D798
	ldr r2, [r0]
	ldr r1, [r2]
	ldrh r1, [r1, #2]
	cmp r6, r1
	bge _0800413C
	mov sb, r2
_080040E8:
	movs r4, #0
	mov r1, sb
	ldr r0, [r1]
	adds r2, r6, #1
	mov sl, r2
	ldrh r0, [r0]
	cmp r4, r0
	bge _08004130
	ldr r5, _08004344 @ =gUnknown_08499590
	lsls r6, r6, #1
	ldr r3, _08004348 @ =0x0000417A
	mov r8, r3
	ldr r7, _0800434C @ =0x00000A22
_08004102:
	ldr r2, [r5]
	mov r0, r8
	adds r3, r2, r0
	adds r3, r3, r6
	ldrh r0, [r3]
	adds r0, r0, r4
	lsls r0, r0, #1
	adds r1, r2, r7
	adds r1, r1, r0
	movs r0, #0x2a
	strh r0, [r1]
	ldrh r0, [r3]
	adds r0, r0, r4
	ldr r1, _08004350 @ =0x00001432
	adds r2, r2, r1
	adds r2, r2, r0
	mov r3, ip
	strb r3, [r2]
	adds r4, #1
	ldr r0, [r5]
	ldrh r0, [r0]
	cmp r4, r0
	blt _08004102
_08004130:
	mov r6, sl
	mov r1, sb
	ldr r0, [r1]
	ldrh r0, [r0, #2]
	cmp r6, r0
	blt _080040E8
_0800413C:
	movs r0, #0xc
	movs r1, #8
	bl sub_08003B6C
	mov r8, r0
	mov r7, r8
	cmp r7, #0
	ble _0800418A
_0800414C:
	movs r0, #0x1c
	movs r1, #2
	bl sub_08003B6C
	adds r6, r0, #0
	movs r0, #0x12
	movs r1, #2
	bl sub_08003B6C
	adds r5, r0, #0
	movs r0, #0xa
	movs r1, #2
	bl sub_08003B6C
	adds r4, r0, #0
	movs r0, #0xc
	subs r0, r0, r4
	movs r1, #2
	bl sub_08003B6C
	adds r3, r0, #0
	movs r0, #1
	str r0, [sp]
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_0800401C
	subs r7, #1
	cmp r7, #0
	bgt _0800414C
_0800418A:
	movs r0, #0xc
	movs r1, #8
	bl sub_08003B6C
	mov r8, r0
	mov r7, r8
	cmp r7, #0
	ble _080041D8
_0800419A:
	movs r0, #0x1c
	movs r1, #2
	bl sub_08003B6C
	adds r6, r0, #0
	movs r0, #0x12
	movs r1, #2
	bl sub_08003B6C
	adds r5, r0, #0
	movs r0, #0xa
	movs r1, #4
	bl sub_08003B6C
	adds r4, r0, #0
	movs r0, #0xe
	subs r0, r0, r4
	movs r1, #4
	bl sub_08003B6C
	adds r3, r0, #0
	movs r0, #1
	str r0, [sp]
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_0800401C
	subs r7, #1
	cmp r7, #0
	bgt _0800419A
_080041D8:
	movs r0, #0x32
	movs r1, #0x28
	bl sub_08003B6C
	mov r8, r0
	movs r4, #0
	movs r7, #0x64
_080041E6:
	movs r0, #0x1a
	movs r1, #4
	bl sub_08003B6C
	adds r6, r0, #0
	movs r0, #0x10
	movs r1, #4
	bl sub_08003B6C
	adds r5, r0, #0
	ldr r0, _08004344 @ =gUnknown_08499590
	ldr r1, [r0]
	lsls r2, r5, #1
	ldr r3, _08004348 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r6
	ldr r2, _08004350 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #1
	bne _0800422C
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #3
	bl SetTerrainAt
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #0x20
	bl sub_08007F14
	adds r4, #1
_0800422C:
	cmp r4, r8
	bgt _08004236
	subs r7, #1
	cmp r7, #0
	bgt _080041E6
_08004236:
	movs r0, #6
	movs r1, #3
	bl sub_08003B6C
	mov r8, r0
	mov r7, r8
	mov r3, r8
	cmp r3, #0
	ble _08004286
_08004248:
	movs r0, #0x1c
	movs r1, #2
	bl sub_08003B6C
	adds r6, r0, #0
	movs r0, #0x12
	movs r1, #2
	bl sub_08003B6C
	adds r5, r0, #0
	movs r0, #4
	movs r1, #1
	bl sub_08003B6C
	adds r4, r0, #0
	movs r0, #5
	subs r0, r0, r4
	movs r1, #1
	bl sub_08003B6C
	adds r3, r0, #0
	movs r0, #0x20
	str r0, [sp]
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_0800401C
	subs r7, #1
	cmp r7, #0
	bgt _08004248
_08004286:
	movs r0, #7
	mov r1, r8
	subs r1, r0, r1
	mov r8, r1
	mov r7, r8
	cmp r7, #0
	ble _080042D2
_08004294:
	movs r0, #0x1c
	movs r1, #2
	bl sub_08003B6C
	adds r6, r0, #0
	movs r0, #0x12
	movs r1, #2
	bl sub_08003B6C
	adds r5, r0, #0
	movs r0, #4
	movs r1, #2
	bl sub_08003B6C
	adds r4, r0, #0
	movs r0, #6
	subs r0, r0, r4
	movs r1, #2
	bl sub_08003B6C
	adds r3, r0, #0
	movs r0, #0x20
	str r0, [sp]
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_0800401C
	subs r7, #1
	cmp r7, #0
	bgt _08004294
_080042D2:
	movs r0, #0x32
	movs r1, #0x28
	bl sub_08003B6C
	mov r8, r0
	movs r4, #0
	movs r7, #0x32
_080042E0:
	movs r0, #0x1a
	movs r1, #4
	bl sub_08003B6C
	adds r6, r0, #0
	movs r0, #0x10
	movs r1, #4
	bl sub_08003B6C
	adds r5, r0, #0
	ldr r0, _08004344 @ =gUnknown_08499590
	ldr r1, [r0]
	lsls r2, r5, #1
	ldr r3, _08004348 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r6
	ldr r2, _08004350 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #1
	bne _08004326
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #4
	bl SetTerrainAt
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #0x87
	bl sub_08007F14
	adds r4, #1
_08004326:
	cmp r4, r8
	bgt _08004330
	subs r7, #1
	cmp r7, #0
	bgt _080042E0
_08004330:
	movs r0, #0x32
	movs r1, #0x28
	bl sub_08003B6C
	mov r8, r0
	movs r4, #0
	movs r7, #0x64
	b _0800435A
	.align 2, 0
_08004340: .4byte gUnknown_0808D798
_08004344: .4byte gUnknown_08499590
_08004348: .4byte 0x0000417A
_0800434C: .4byte 0x00000A22
_08004350: .4byte 0x00001432
_08004354:
	subs r7, #1
	cmp r7, #0
	ble _08004396
_0800435A:
	movs r0, #0x1c
	movs r1, #2
	bl sub_08003B6C
	adds r6, r0, #0
	movs r0, #0x12
	movs r1, #2
	bl sub_08003B6C
	adds r5, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_0800BCD0
	cmp r0, #0
	beq _08004392
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #0x13
	bl SetTerrainAt
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #0xb4
	lsls r2, r2, #1
	bl sub_08007F14
	adds r4, #1
_08004392:
	cmp r4, r8
	ble _08004354
_08004396:
	movs r6, #1
	ldr r1, _080043A0 @ =gUnknown_08499590
	ldr r0, [r1]
	b _08004476
	.align 2, 0
_080043A0: .4byte gUnknown_08499590
_080043A4:
	movs r4, #1
	ldr r3, _08004490 @ =gUnknown_08499590
	ldr r0, [r3]
	ldrh r0, [r0]
	subs r0, #1
	adds r1, r6, #1
	mov sl, r1
	cmp r4, r0
	bge _08004470
_080043B6:
	movs r0, #0xc8
	movs r1, #0x64
	bl sub_08003B6C
	adds r2, r4, #1
	str r2, [sp, #4]
	cmp r0, #0x95
	ble _08004462
	ldr r3, _08004490 @ =gUnknown_08499590
	mov sb, r3
	ldr r1, [r3]
	lsls r5, r6, #1
	ldr r7, _08004494 @ =0x0000417A
	adds r3, r1, r7
	adds r0, r3, r5
	ldrh r0, [r0]
	adds r0, r0, r4
	ldr r2, _08004498 @ =0x00001432
	mov r8, r2
	add r1, r8
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, #1
	bne _08004462
	subs r2, r6, #1
	lsls r0, r2, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	adds r0, r0, r4
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, #7
	bne _08004400
	adds r0, r4, #0
	adds r1, r2, #0
	bl sub_0800BA9C
_08004400:
	mov r3, sb
	ldr r1, [r3]
	mov r0, sl
	lsls r2, r0, #1
	adds r0, r1, r7
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r4
	add r1, r8
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #7
	bne _08004422
	adds r0, r4, #0
	mov r1, sl
	bl sub_0800BA9C
_08004422:
	mov r2, sb
	ldr r1, [r2]
	adds r0, r1, r7
	adds r0, r0, r5
	ldrh r0, [r0]
	subs r0, #1
	adds r0, r0, r4
	add r1, r8
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #7
	bne _08004442
	subs r0, r4, #1
	adds r1, r6, #0
	bl sub_0800BA9C
_08004442:
	mov r3, sb
	ldr r1, [r3]
	adds r0, r1, r7
	adds r0, r0, r5
	ldrh r0, [r0]
	adds r0, #1
	adds r0, r0, r4
	add r1, r8
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #7
	bne _08004462
	ldr r0, [sp, #4]
	adds r1, r6, #0
	bl sub_0800BA9C
_08004462:
	ldr r4, [sp, #4]
	ldr r1, _08004490 @ =gUnknown_08499590
	ldr r0, [r1]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	blt _080043B6
_08004470:
	mov r6, sl
	ldr r2, _08004490 @ =gUnknown_08499590
	ldr r0, [r2]
_08004476:
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r6, r0
	blt _080043A4
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004490: .4byte gUnknown_08499590
_08004494: .4byte 0x0000417A
_08004498: .4byte 0x00001432

