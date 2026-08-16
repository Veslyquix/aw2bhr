	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805A268
sub_0805A268: @ 0x0805A268
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	movs r0, #0
	mov r8, r0
	ldr r1, _0805A304 @ =gUnknown_0816D984
	ldr r0, [r1]
	ldr r0, [r0]
	ldrb r0, [r0]
	subs r0, #0x13
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r1
	cmp r0, #1
	bhi _0805A292
	movs r1, #1
	rsbs r1, r1, #0
	mov r8, r1
_0805A292:
	ldr r0, _0805A308 @ =gUnknown_0816D988
	ldr r1, [r0]
	ldrh r6, [r1]
	adds r1, r6, #0
	adds r1, #0x40
	mov sb, r0
	cmp r6, r1
	bge _0805A36E
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r7, r0, #2
_0805A2A8:
	ldr r0, _0805A30C @ =gUnknown_08499594
	ldr r0, [r0]
	adds r4, r0, r7
	ldrb r0, [r4]
	cmp r0, #0
	beq _0805A35E
	adds r0, r4, #0
	bl sub_08042084
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805A318
	ldr r1, _0805A310 @ =gUnknown_084995A8
	mov r2, sl
	ldr r0, [r2]
	ldr r0, [r0]
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805A318
	ldr r3, _0805A314 @ =gUnknown_03003340
	ldrb r0, [r4, #3]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r2, [r4, #2]
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _0805A35E
	ldrb r1, [r4, #1]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0805A35E
	strb r2, [r5]
	ldrb r0, [r4, #3]
	strb r0, [r5, #1]
	ldrb r0, [r4, #3]
	lsls r0, r0, #2
	adds r0, r0, r3
	b _0805A34E
	.align 2, 0
_0805A304: .4byte gUnknown_0816D984
_0805A308: .4byte gUnknown_0816D988
_0805A30C: .4byte gUnknown_08499594
_0805A310: .4byte gUnknown_084995A8
_0805A314: .4byte gUnknown_03003340
_0805A318:
	mov r0, r8
	cmp r0, #0
	beq _0805A35E
	ldrb r0, [r4]
	cmp r0, #0x16
	bne _0805A35E
	ldrb r0, [r4, #8]
	cmp r0, #0
	bne _0805A35E
	ldr r2, _0805A380 @ =gUnknown_03003340
	ldrb r0, [r4, #3]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r4, #2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _0805A35E
	strb r1, [r5]
	ldrb r0, [r4, #3]
	strb r0, [r5, #1]
	ldrb r0, [r4, #3]
	lsls r0, r0, #2
	adds r0, r0, r2
_0805A34E:
	ldrb r1, [r4, #2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r5, #2]
	adds r5, #4
_0805A35E:
	adds r7, #0xc
	adds r6, #1
	mov r1, sb
	ldr r0, [r1]
	ldrh r0, [r0]
	adds r0, #0x40
	cmp r6, r0
	blt _0805A2A8
_0805A36E:
	ldr r0, _0805A384 @ =0x0000FFFF
	strh r0, [r5, #2]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A380: .4byte gUnknown_03003340
_0805A384: .4byte 0x0000FFFF

