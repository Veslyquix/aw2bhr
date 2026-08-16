	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08037C34
sub_08037C34: @ 0x08037C34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r6, #0
	ldr r0, _08037C94 @ =gUnknown_02027F74
	strb r6, [r0, #1]
	strb r6, [r0]
	strb r6, [r0, #2]
	strb r6, [r0, #3]
	movs r1, #0
	ldr r0, _08037C98 @ =gUnknown_03003F68
	ldr r2, [r0]
	ldrb r3, [r2, #1]
	cmp r1, r3
	bhs _08037CE8
	mov ip, r0
	mov r8, r2
	mov sl, ip
	ldr r0, _08037C9C @ =gUnknown_0849959C
	mov sb, r0
_08037C60:
	movs r3, #0
	adds r7, r1, #1
	mov r1, r8
	ldrb r1, [r1]
	cmp r3, r1
	bhs _08037CD2
	mov r0, sl
	ldr r4, [r0]
	mov r1, sb
	ldr r5, [r1]
	ldr r2, _08037C94 @ =gUnknown_02027F74
_08037C76:
	adds r0, r6, r3
	lsls r0, r0, #1
	adds r0, r4, r0
	ldrh r0, [r0, #2]
	adds r0, r5, r0
	ldrb r0, [r0]
	movs r1, #0x1f
	ands r1, r0
	cmp r1, #0xa
	beq _08037CB8
	cmp r1, #0xa
	bgt _08037CA0
	cmp r1, #6
	beq _08037CB0
	b _08037CC6
	.align 2, 0
_08037C94: .4byte gUnknown_02027F74
_08037C98: .4byte gUnknown_03003F68
_08037C9C: .4byte gUnknown_0849959C
_08037CA0:
	cmp r1, #0xb
	beq _08037CC0
	cmp r1, #0xe
	bne _08037CC6
	ldrb r0, [r2, #1]
	adds r0, #1
	strb r0, [r2, #1]
	b _08037CC6
_08037CB0:
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	b _08037CC6
_08037CB8:
	ldrb r0, [r2, #2]
	adds r0, #1
	strb r0, [r2, #2]
	b _08037CC6
_08037CC0:
	ldrb r0, [r2, #3]
	adds r0, #1
	strb r0, [r2, #3]
_08037CC6:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldrb r0, [r4]
	cmp r3, r0
	blo _08037C76
_08037CD2:
	mov r1, ip
	ldr r0, [r1]
	ldrb r1, [r0]
	adds r1, r6, r1
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r1, r7, #0x18
	lsrs r1, r1, #0x18
	ldrb r0, [r0, #1]
	cmp r1, r0
	blo _08037C60
_08037CE8:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

