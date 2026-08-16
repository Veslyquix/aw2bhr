	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080314A4
sub_080314A4: @ 0x080314A4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r1, _08031538 @ =gUnknown_08090CF4
	add r0, sp, #8
	movs r2, #0xa
	bl sub_0808B6E8
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #2
	beq _080315BE
	movs r7, #0
	ldr r0, _0803153C @ =gUnknown_08499578
	mov sb, r0
	movs r1, #0
	mov sl, r1
	str r4, [sp, #0x14]
	movs r0, #0xc0
	lsls r0, r0, #0xb
	mov r8, r0
_080314DA:
	mov r1, sb
	ldr r0, [r1]
	mov r1, r8
	lsrs r2, r1, #0x10
	movs r1, #2
	str r1, [sp]
	mov r1, sl
	str r1, [sp, #4]
	movs r1, #0xe
	movs r3, #8
	bl sub_08012BC8
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _08031506
	lsls r0, r7, #0x18
	asrs r0, r0, #0x18
	bl sub_0802F460
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080315AE
_08031506:
	ldr r0, _08031540 @ =gUnknown_0849B018
	ldr r0, [r0]
	adds r0, #0xa
	adds r3, r0, r7
	ldrb r0, [r3]
	cmp r0, #4
	bhi _08031544
	mov r0, r8
	asrs r1, r0, #0x10
	mov r0, sb
	ldr r2, [r0]
	ldrb r0, [r3]
	lsls r0, r0, #1
	add r0, sp
	adds r0, #8
	ldrh r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	mov r0, sl
	str r0, [sp, #4]
	movs r0, #0xe
	bl sub_08014A5C
	b _080315AE
	.align 2, 0
_08031538: .4byte gUnknown_08090CF4
_0803153C: .4byte gUnknown_08499578
_08031540: .4byte gUnknown_0849B018
_08031544:
	mov r1, r8
	asrs r5, r1, #0x10
	mov r0, sb
	ldr r2, [r0]
	ldr r1, _08031590 @ =gUnknown_020257E4
	movs r0, #0xd
	muls r0, r7, r0
	adds r4, r0, r1
	movs r6, #0x80
	lsls r6, r6, #8
	str r6, [sp]
	mov r1, sl
	str r1, [sp, #4]
	movs r0, #0xe
	adds r1, r5, #0
	adds r3, r4, #0
	bl sub_080149C0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bne _080315AE
	ldr r0, _08031594 @ =gUnknown_0300449C
	adds r0, r7, r0
	ldrb r0, [r0]
	adds r1, r0, #0
	cmp r1, #0
	beq _08031598
	mov r1, sb
	ldr r2, [r1]
	str r6, [sp]
	mov r0, sl
	str r0, [sp, #4]
	movs r0, #0xe
	adds r1, r5, #0
	adds r3, r4, #0
	bl sub_080149C0
	b _080315AE
	.align 2, 0
_08031590: .4byte gUnknown_020257E4
_08031594: .4byte gUnknown_0300449C
_08031598:
	mov r0, sb
	ldr r2, [r0]
	movs r0, #0xe0
	lsls r0, r0, #7
	str r0, [sp]
	str r1, [sp, #4]
	movs r0, #0xe
	adds r1, r5, #0
	adds r3, r4, #0
	bl sub_080149C0
_080315AE:
	movs r1, #0x80
	lsls r1, r1, #0xa
	add r8, r1
	adds r7, #1
	cmp r7, #3
	ble _080314DA
	bl sub_08013AEC
_080315BE:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

