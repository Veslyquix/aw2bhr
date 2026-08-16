	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801FD9C
sub_0801FD9C: @ 0x0801FD9C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r4, #0
	ldr r1, _0801FE60 @ =gUnknown_08499590
	ldr r0, [r1]
	ldrh r0, [r0, #2]
	cmp r4, r0
	bge _0801FE54
	mov sb, r1
_0801FDB6:
	movs r2, #0
	mov r1, sb
	ldr r0, [r1]
	adds r7, r4, #1
	mov ip, r7
	ldrh r0, [r0]
	cmp r2, r0
	bge _0801FE48
	ldr r1, _0801FE64 @ =gUnknown_03003340
	lsls r0, r4, #2
	adds r5, r0, r1
	ldr r6, _0801FE60 @ =gUnknown_08499590
	subs r0, r4, #1
	lsls r0, r0, #2
	adds r0, r0, r1
	mov r8, r0
	lsls r0, r7, #2
	adds r7, r0, r1
_0801FDDA:
	ldr r0, [r5]
	adds r1, r0, r2
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _0801FE3E
	cmp r0, r3
	beq _0801FE3E
	subs r1, #1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801FDFA
	cmp r2, #0
	beq _0801FDFA
	strb r3, [r1]
_0801FDFA:
	ldr r0, [r5]
	adds r1, r2, r0
	movs r0, #1
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801FE12
	ldr r0, [r6]
	ldrh r0, [r0]
	subs r0, #1
	cmp r2, r0
	beq _0801FE12
	strb r3, [r1, #1]
_0801FE12:
	mov r1, r8
	ldr r0, [r1]
	adds r1, r0, r2
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801FE26
	cmp r4, #0
	beq _0801FE26
	strb r3, [r1]
_0801FE26:
	ldr r0, [r7]
	adds r1, r0, r2
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801FE3E
	ldr r0, [r6]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r4, r0
	beq _0801FE3E
	strb r3, [r1]
_0801FE3E:
	adds r2, #1
	ldr r0, [r6]
	ldrh r0, [r0]
	cmp r2, r0
	blt _0801FDDA
_0801FE48:
	mov r4, ip
	mov r7, sb
	ldr r0, [r7]
	ldrh r0, [r0, #2]
	cmp r4, r0
	blt _0801FDB6
_0801FE54:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801FE60: .4byte gUnknown_08499590
_0801FE64: .4byte gUnknown_03003340

