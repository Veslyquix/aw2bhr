	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802B91C
sub_0802B91C: @ 0x0802B91C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r4, [sp, #0x2c]
	ldr r5, [sp, #0x30]
	ldr r6, [sp, #0x34]
	ldr r7, [sp, #0x38]
	mov r8, r7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #4]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #8]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r4, r4, #0x18
	lsrs r7, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	mov sl, r5
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov sb, r6
	mov r0, r8
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r1, #0
	mov r8, r1
	cmp r7, #0
	beq _0802B968
	movs r7, #1
_0802B968:
	ldr r1, [sp, #8]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0802B9BC @ =gUnknown_030033EC
	ldrh r1, [r1]
	lsls r4, r3, #0x10
	lsrs r2, r4, #0x10
	bl sub_0802706C
	lsls r0, r0, #0x18
	adds r6, r4, #0
	cmp r0, #0
	beq _0802B9C4
	bl sub_08026198
	adds r4, r0, #0
	bl sub_080261A0
	movs r1, #0x78
	subs r1, r1, r0
	lsls r1, r1, #5
	adds r4, r4, r1
	lsls r5, r5, #0x10
	asrs r1, r5, #0xe
	asrs r0, r6, #0x10
	movs r2, #1
	ands r0, r2
	movs r2, #0xee
	lsls r2, r2, #1
	adds r0, r0, r2
	adds r1, r1, r0
	lsls r1, r1, #5
	ldr r3, _0802B9C0 @ =0x06010000
	adds r1, r1, r3
	adds r0, r4, #0
	movs r2, #0x20
	bl sub_08011E54
	movs r7, #1
	mov r8, r7
	b _0802BA76
	.align 2, 0
_0802B9BC: .4byte gUnknown_030033EC
_0802B9C0: .4byte 0x06010000
_0802B9C4:
	lsls r5, r5, #0x10
	cmp r7, #0
	beq _0802B9FE
	bl sub_08026198
	adds r4, r0, #0
	bl sub_080261A0
	movs r1, #0x75
	subs r1, r1, r0
	lsls r1, r1, #5
	adds r4, r4, r1
	asrs r1, r5, #0xe
	asrs r0, r6, #0x10
	movs r2, #1
	ands r0, r2
	movs r2, #0xee
	lsls r2, r2, #1
	adds r0, r0, r2
	adds r1, r1, r0
	lsls r1, r1, #5
	ldr r0, _0802BAAC @ =0x06010000
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0x20
	bl sub_08011E54
	movs r1, #1
	mov r8, r1
_0802B9FE:
	mov r3, sl
	cmp r3, #0
	beq _0802BA38
	bl sub_08026198
	adds r4, r0, #0
	bl sub_080261A0
	movs r1, #0x76
	subs r1, r1, r0
	lsls r1, r1, #5
	adds r4, r4, r1
	asrs r1, r5, #0xe
	asrs r0, r6, #0x10
	movs r2, #1
	ands r0, r2
	movs r2, #0xee
	lsls r2, r2, #1
	adds r0, r0, r2
	adds r1, r1, r0
	lsls r1, r1, #5
	ldr r7, _0802BAAC @ =0x06010000
	adds r1, r1, r7
	adds r0, r4, #0
	movs r2, #0x20
	bl sub_08011E54
	movs r0, #1
	add r8, r0
_0802BA38:
	movs r0, #0x20
	mov r1, sb
	ands r1, r0
	cmp r1, #0
	beq _0802BA76
	bl sub_08026198
	adds r4, r0, #0
	bl sub_080261A0
	movs r1, #0x77
	subs r1, r1, r0
	lsls r1, r1, #5
	adds r4, r4, r1
	asrs r1, r5, #0xe
	asrs r0, r6, #0x10
	movs r2, #1
	ands r0, r2
	movs r2, #0xee
	lsls r2, r2, #1
	adds r0, r0, r2
	adds r1, r1, r0
	lsls r1, r1, #5
	ldr r3, _0802BAAC @ =0x06010000
	adds r1, r1, r3
	adds r0, r4, #0
	movs r2, #0x20
	bl sub_08011E54
	movs r7, #1
	add r8, r7
_0802BA76:
	bl sub_08026190
	adds r4, r0, #0
	asrs r6, r6, #0x10
	ldr r0, [sp, #8]
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	adds r0, r6, #0
	bl sub_080261A4
	ldr r1, _0802BAB0 @ =0x000003FF
	ands r1, r0
	lsls r1, r1, #5
	adds r4, r4, r1
	asrs r1, r5, #9
	ldr r3, _0802BAB4 @ =0x06013B40
	adds r1, r1, r3
	adds r0, r4, #0
	movs r2, #0x80
	bl sub_08011E54
	mov r7, r8
	cmp r7, #0
	beq _0802BABC
	ldr r1, _0802BAB8 @ =gUnknown_0849A218
	b _0802BABE
	.align 2, 0
_0802BAAC: .4byte 0x06010000
_0802BAB0: .4byte 0x000003FF
_0802BAB4: .4byte 0x06013B40
_0802BAB8: .4byte gUnknown_0849A218
_0802BABC:
	ldr r1, _0802BAF8 @ =gUnknown_0849A22C
_0802BABE:
	subs r0, r6, #1
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	ldr r1, [sp]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r3, #0
	ldr r7, [sp, #4]
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	orrs r1, r2
	asrs r3, r5, #0xe
	movs r2, #0xf0
	lsls r2, r2, #8
	orrs r3, r2
	adds r2, r4, #0
	bl sub_0801BD00
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802BAF8: .4byte gUnknown_0849A22C

