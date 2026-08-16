	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08048850
sub_08048850: @ 0x08048850
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	movs r0, #0
	bl sub_0801B780
	ldr r4, _080488D8 @ =gUnknown_0812A144
	ldr r0, [r4]
	ldr r0, [r0]
	adds r0, #0x32
	movs r1, #0xa
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r2, #0
	movs r3, #0x14
	bl sub_08012BC8
	movs r5, #0
	adds r0, r7, #3
	mov r8, r4
	cmp r5, r0
	bge _080488CC
	ldr r1, _080488DC @ =gUnknown_02028E1C
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080488CC
	adds r4, r1, #0
_08048894:
	lsls r1, r5, #0x19
	movs r0, #0x80
	lsls r0, r0, #0x12
	adds r1, r1, r0
	lsrs r1, r1, #0x18
	mov r2, r8
	ldr r0, [r2]
	ldr r2, [r0]
	adds r2, #0x32
	adds r0, r6, r5
	adds r0, r0, r4
	ldrb r3, [r0]
	movs r0, #3
	str r0, [sp]
	movs r0, #0
	bl sub_080487B4
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r7, #3
	cmp r5, r0
	bge _080488CC
	adds r0, r6, r5
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _08048894
_080488CC:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080488D8: .4byte gUnknown_0812A144
_080488DC: .4byte gUnknown_02028E1C

