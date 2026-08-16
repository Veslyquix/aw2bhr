	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080611D8
sub_080611D8: @ 0x080611D8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	movs r7, #0
	movs r0, #0
	mov sb, r0
	ldr r0, _080612B8 @ =0x0000270F
	strh r0, [r5]
	ldr r6, _080612BC @ =gUnknown_030046C0
	ldrb r0, [r6, #7]
	cmp r0, #5
	beq _08061278
	ldr r1, _080612C0 @ =gUnknown_085D5ABC
	ldrb r2, [r6, #6]
	movs r0, #0x5c
	muls r0, r2, r0
	adds r0, r0, r1
	ldrb r4, [r0, #0x1a]
	mov r8, r4
	cmp r2, #0x14
	bne _08061218
	adds r0, r4, #0
	movs r1, #3
	adds r2, r5, #0
	bl sub_08061308
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080612EA
_08061218:
	ldrb r0, [r6, #6]
	cmp r0, #0x17
	bne _08061230
	adds r0, r4, #0
	movs r1, #4
	adds r2, r5, #0
	bl sub_08061308
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080612EA
_08061230:
	adds r0, r4, #0
	movs r1, #0
	adds r2, r5, #0
	bl sub_08061308
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080612EA
	ldrb r0, [r6, #6]
	cmp r0, #2
	bhi _0806125A
	movs r0, #0x10
	movs r1, #1
	adds r2, r5, #0
	bl sub_08061308
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080612EA
_0806125A:
	ldr r0, _080612C4 @ =gUnknown_0857680F
	ldrb r1, [r6, #6]
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #2
	beq _08061278
	mov r0, r8
	movs r1, #2
	adds r2, r5, #0
	bl sub_08061308
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080612EA
_08061278:
	ldr r2, _080612C8 @ =gUnknown_0816DAE8
	ldr r0, [r2]
	ldr r1, [r0]
	lsls r0, r7, #2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080612AE
	ldr r6, _080612C4 @ =gUnknown_0857680F
	mov r8, r6
	ldr r4, _080612BC @ =gUnknown_030046C0
	adds r3, r1, #0
_08061290:
	adds r1, r3, #0
	ldrb r0, [r1, #3]
	cmp r0, #0xfd
	bhi _080612A4
	ldrb r0, [r4, #6]
	add r0, r8
	ldrb r0, [r0]
	ldrb r6, [r1, #2]
	cmp r0, r6
	beq _080612CC
_080612A4:
	adds r3, r1, #4
	adds r7, #1
	ldrb r0, [r1, #4]
	cmp r0, #0xff
	bne _08061290
_080612AE:
	ldrh r1, [r5]
	ldr r0, _080612B8 @ =0x0000270F
	cmp r1, r0
	bne _080612D8
	b _080612FA
	.align 2, 0
_080612B8: .4byte 0x0000270F
_080612BC: .4byte gUnknown_030046C0
_080612C0: .4byte gUnknown_085D5ABC
_080612C4: .4byte gUnknown_0857680F
_080612C8: .4byte gUnknown_0816DAE8
_080612CC:
	ldrb r0, [r3]
	strh r0, [r5]
	ldrb r0, [r3, #1]
	strh r0, [r5, #2]
	mov sb, r7
	b _080612AE
_080612D8:
	ldr r0, [r2]
	ldr r1, [r0]
	mov r2, sb
	lsls r0, r2, #2
	adds r0, r0, r1
	movs r1, #0xfe
	strb r1, [r0, #3]
	movs r0, #1
	b _080612FC
_080612EA:
	adds r0, r5, #0
	bl sub_08061668
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080612FA
	movs r0, #1
	b _080612FC
_080612FA:
	movs r0, #0
_080612FC:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

