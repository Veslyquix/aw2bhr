	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805A0EC
sub_0805A0EC: @ 0x0805A0EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	ldr r1, _0805A118 @ =gUnknown_0857680F
	ldr r2, _0805A11C @ =gUnknown_0816D978
	ldr r0, [r2]
	ldr r0, [r0]
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	str r0, [sp]
	movs r0, #0
	mov r8, r0
	ldr r1, _0805A120 @ =gUnknown_0816D97C
	ldr r0, [r1]
	ldr r0, [r0]
	mov sl, r1
	b _0805A21E
	.align 2, 0
_0805A118: .4byte gUnknown_0857680F
_0805A11C: .4byte gUnknown_0816D978
_0805A120: .4byte gUnknown_0816D97C
_0805A124:
	movs r7, #0
	adds r2, r1, #0
	ldr r0, [r2]
	ldr r0, [r0]
	mov r1, r8
	adds r1, #1
	str r1, [sp, #4]
	ldrh r0, [r0]
	cmp r7, r0
	bge _0805A214
	ldr r1, _0805A23C @ =gUnknown_03003340
	mov r3, r8
	lsls r0, r3, #2
	adds r0, r0, r1
	mov sb, r0
_0805A142:
	mov r1, sb
	ldr r0, [r1]
	adds r0, r0, r7
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _0805A206
	ldr r0, [r2]
	ldr r3, [r0]
	mov r2, r8
	lsls r1, r2, #1
	ldr r2, _0805A240 @ =0x0000417A
	adds r0, r3, r2
	adds r0, r0, r1
	mov ip, r0
	ldrh r0, [r0]
	adds r4, r0, r7
	ldr r1, _0805A244 @ =0x00001432
	adds r0, r3, r1
	adds r0, r0, r4
	ldrb r2, [r0]
	movs r0, #0xe0
	ldr r1, _0805A248 @ =gUnknown_03004084
	ands r0, r2
	ldrh r1, [r1]
	cmp r0, r1
	bne _0805A206
	ldr r0, _0805A24C @ =gUnknown_085767F2
	movs r1, #0x1f
	ands r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	ldr r2, [sp]
	cmp r0, r2
	bne _0805A206
	adds r6, r3, #0
	adds r6, #0x12
	adds r3, r6, r4
	ldrb r1, [r3]
	ldr r2, _0805A250 @ =gUnknown_0816D980
	cmp r1, #0
	beq _0805A1A0
	ldr r0, _0805A254 @ =gUnknown_03003F38
	ldrb r0, [r0]
	cmp r1, r0
	bne _0805A206
_0805A1A0:
	ldr r4, [r2]
	ldrb r0, [r4]
	cmp r1, r0
	bne _0805A1BC
	ldr r2, _0805A258 @ =gUnknown_08499594
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r1, r1, r0
	ldrb r0, [r1, #0xb]
	cmp r0, #5
	beq _0805A206
_0805A1BC:
	ldr r0, _0805A25C @ =gUnknown_030040D8
	ldr r1, [r0]
	movs r0, #0
	strh r0, [r5, #2]
	mov r2, ip
	ldrh r0, [r2]
	adds r0, r0, r7
	adds r0, r6, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805A1EC
	ldrb r4, [r4]
	cmp r0, r4
	beq _0805A1EC
	ldr r0, _0805A260 @ =gUnknown_030033EC
	ldrh r0, [r0]
	ldrb r1, [r1]
	bl sub_08042D1C
	lsls r1, r0, #2
	adds r1, r1, r0
	ldrh r3, [r5, #2]
	adds r1, r1, r3
	strh r1, [r5, #2]
_0805A1EC:
	mov r1, sb
	ldr r0, [r1]
	adds r0, r0, r7
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r2, [r5, #2]
	adds r0, r0, r2
	strh r0, [r5, #2]
	strb r7, [r5]
	mov r3, r8
	strb r3, [r5, #1]
	adds r5, #4
_0805A206:
	adds r7, #1
	mov r2, sl
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r7, r0
	blt _0805A142
_0805A214:
	ldr r0, [sp, #4]
	mov r8, r0
	mov r1, sl
	ldr r0, [r1]
	ldr r0, [r0]
_0805A21E:
	ldrh r0, [r0, #2]
	cmp r8, r0
	bge _0805A226
	b _0805A124
_0805A226:
	ldr r0, _0805A264 @ =0x0000FFFF
	strh r0, [r5, #2]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A23C: .4byte gUnknown_03003340
_0805A240: .4byte 0x0000417A
_0805A244: .4byte 0x00001432
_0805A248: .4byte gUnknown_03004084
_0805A24C: .4byte gUnknown_085767F2
_0805A250: .4byte gUnknown_0816D980
_0805A254: .4byte gUnknown_03003F38
_0805A258: .4byte gUnknown_08499594
_0805A25C: .4byte gUnknown_030040D8
_0805A260: .4byte gUnknown_030033EC
_0805A264: .4byte 0x0000FFFF

