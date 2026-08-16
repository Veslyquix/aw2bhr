	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080200EC
sub_080200EC: @ 0x080200EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	lsls r5, r2, #0x10
	asrs r2, r5, #0x10
	rsbs r0, r5, #0
	lsrs r6, r0, #0x10
	lsrs r0, r1, #0x10
	str r0, [sp]
	asrs r1, r1, #0x10
	subs r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r3, r4, #0x10
	asrs r0, r3, #0x10
	adds r1, r1, r2
	cmp r0, r1
	bgt _080201C8
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
_08020132:
	asrs r2, r3, #0x10
	mov r0, sb
	lsls r7, r0, #0x10
	ldr r1, [sp]
	lsls r1, r1, #0x10
	mov ip, r1
	lsls r4, r4, #0x10
	lsls r6, r6, #0x10
	cmp r2, #0
	blt _080201AA
	ldr r1, _08020168 @ =gUnknown_08499590
	ldr r0, [r1]
	ldrh r0, [r0, #2]
	cmp r2, r0
	bge _080201AA
	asrs r0, r5, #0x10
	ldr r1, [sp, #4]
	subs r2, r1, r0
	asrs r0, r6, #0x10
	mov r1, sl
	lsls r5, r1, #0x10
	cmp r0, #0
	bge _08020162
	rsbs r0, r0, #0
_08020162:
	adds r0, r2, r0
	lsls r0, r0, #0x10
	b _08020190
	.align 2, 0
_08020168: .4byte gUnknown_08499590
_0802016C:
	cmp r2, #0
	blt _08020188
	ldr r1, _080201D8 @ =gUnknown_08499590
	ldr r0, [r1]
	ldrh r0, [r0]
	cmp r2, r0
	bge _08020188
	asrs r0, r4, #0xe
	ldr r1, _080201DC @ =gUnknown_03003340
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r2
	mov r1, r8
	strb r1, [r0]
_08020188:
	lsls r0, r3, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
_08020190:
	lsrs r3, r0, #0x10
	lsls r0, r3, #0x10
	asrs r2, r0, #0x10
	asrs r1, r5, #0x10
	asrs r0, r7, #0x10
	adds r1, r1, r0
	asrs r0, r6, #0x10
	cmp r0, #0
	bge _080201A4
	rsbs r0, r0, #0
_080201A4:
	subs r0, r1, r0
	cmp r2, r0
	ble _0802016C
_080201AA:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r4, r1
	lsrs r4, r0, #0x10
	adds r0, r6, r1
	lsrs r6, r0, #0x10
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	mov r0, ip
	asrs r1, r0, #0x10
	adds r5, r7, #0
	asrs r0, r5, #0x10
	adds r1, r1, r0
	cmp r2, r1
	ble _08020132
_080201C8:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080201D8: .4byte gUnknown_08499590
_080201DC: .4byte gUnknown_03003340

