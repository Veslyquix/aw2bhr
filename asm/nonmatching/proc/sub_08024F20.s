	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08024F20
sub_08024F20: @ 0x08024F20
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsrs r0, r4, #0x10
	str r0, [sp]
	asrs r4, r4, #0x10
	ldr r0, _08025004 @ =gUnknown_08499594
	ldr r3, [r0]
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r3, r1, r3
	ldrb r0, [r3, #2]
	mov sl, r0
	ldrh r0, [r2]
	strb r0, [r3, #2]
	ldr r3, _08025004 @ =gUnknown_08499594
	ldr r0, [r3]
	adds r1, r1, r0
	ldrb r0, [r1, #3]
	lsls r0, r0, #0x10
	mov r3, sl
	orrs r3, r0
	mov sl, r3
	ldrh r0, [r2, #2]
	strb r0, [r1, #3]
	ldr r6, _08025008 @ =gUnknown_08090A38
	ldr r0, [r6]
	mov sb, r0
	adds r1, r4, #0
	bl sub_08024A2C
	ldr r4, _0802500C @ =gUnknown_08090A3C
	ldr r7, [r4]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r0, r7, #0
	adds r1, r5, #0
	bl sub_08024A2C
	mov r1, sb
	ldr r5, [r1]
	ldrb r1, [r5, #2]
	ldr r3, [r7]
	ldrb r0, [r3, #2]
	subs r2, r1, r0
	mov r8, r4
	cmp r2, #0
	bge _08024F94
	rsbs r2, r2, #0
_08024F94:
	ldrb r1, [r5, #3]
	ldrb r0, [r3, #3]
	subs r1, r1, r0
	cmp r1, #0
	bge _08024FA0
	rsbs r1, r1, #0
_08024FA0:
	adds r4, r2, r1
	mov r0, sb
	adds r1, r7, #0
	adds r2, r4, #0
	movs r3, #1
	bl sub_08024ABC
	adds r0, r7, #0
	mov r1, sb
	adds r2, r4, #0
	movs r3, #0
	bl sub_08024ABC
	mov r0, sb
	movs r1, #0
	movs r2, #1
	bl sub_08024C58
	adds r0, r7, #0
	movs r1, #1
	movs r2, #1
	bl sub_08024C58
	ldr r1, [r7]
	ldr r2, _08025004 @ =gUnknown_08499594
	ldr r0, [r2]
	subs r1, r1, r0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r1, r0, #4
	adds r0, r0, r1
	lsls r1, r0, #8
	adds r0, r0, r1
	lsls r1, r0, #0x10
	adds r0, r0, r1
	rsbs r0, r0, #0
	asrs r0, r0, #8
	adds r0, #1
	bl sub_08043050
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _08025010
	adds r0, r7, #0
	mov r1, sb
	bl sub_08024E60
	b _08025018
	.align 2, 0
_08025004: .4byte gUnknown_08499594
_08025008: .4byte gUnknown_08090A38
_0802500C: .4byte gUnknown_08090A3C
_08025010:
	mov r0, sb
	adds r1, r7, #0
	bl sub_08024E60
_08025018:
	ldr r0, [r6]
	mov r3, r8
	ldr r1, [r3]
	bl sub_08024ED8
	ldr r0, [sp]
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	ldr r3, _08025054 @ =gUnknown_08499594
	ldr r2, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r0, r2
	mov r1, sl
	strb r1, [r2, #2]
	ldr r1, [r3]
	adds r0, r0, r1
	mov r2, sl
	lsrs r1, r2, #0x10
	strb r1, [r0, #3]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08025054: .4byte gUnknown_08499594

