	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805B814
sub_0805B814: @ 0x0805B814
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldrh r0, [r5]
	ldrh r1, [r5, #2]
	add r4, sp, #4
	adds r2, r4, #0
	bl sub_0805BA34
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805B8E8
	movs r7, #0
	add r0, sp, #4
	ldrh r0, [r0]
	ldrh r2, [r5]
	cmp r0, r2
	beq _0805B844
	subs r0, r2, r0
	adds r0, #3
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldrh r1, [r5, #2]
	b _0805B854
_0805B844:
	ldrh r0, [r4, #2]
	ldrh r1, [r5, #2]
	cmp r0, r1
	beq _0805B854
	subs r0, r0, r1
	adds r0, #2
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_0805B854:
	ldr r0, _0805B87C @ =gUnknown_030045C8
	str r7, [r0]
	add r4, sp, #8
	adds r0, r2, #0
	adds r2, r4, #0
	bl sub_0805BC7C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0805B8BC
	movs r6, #0
	ldrh r1, [r4]
	ldrh r0, [r5]
	cmp r1, r0
	beq _0805B880
	subs r0, r0, r1
	adds r0, #3
	b _0805B88C
	.align 2, 0
_0805B87C: .4byte gUnknown_030045C8
_0805B880:
	ldrh r0, [r4, #2]
	ldrh r1, [r5, #2]
	cmp r0, r1
	beq _0805B890
	subs r0, r0, r1
	adds r0, #2
_0805B88C:
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_0805B890:
	ldr r0, _0805B8B8 @ =gUnknown_030040D8
	ldr r3, [r0]
	ldrb r2, [r3, #9]
	lsrs r1, r2, #6
	subs r1, #2
	lsls r1, r1, #6
	movs r0, #0x3f
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #9]
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	str r6, [sp]
	movs r2, #8
	adds r3, r7, #0
	bl sub_0805D648
	b _0805B8E8
	.align 2, 0
_0805B8B8: .4byte gUnknown_030040D8
_0805B8BC:
	cmp r7, #0
	beq _0805B8E8
	ldr r0, _0805B8F0 @ =gUnknown_030040D8
	ldr r3, [r0]
	ldrb r2, [r3, #9]
	lsrs r1, r2, #6
	subs r1, #1
	lsls r1, r1, #6
	movs r0, #0x3f
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #9]
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	movs r2, #0
	str r2, [sp]
	movs r2, #8
	adds r3, r7, #0
	bl sub_0805D648
_0805B8E8:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805B8F0: .4byte gUnknown_030040D8

