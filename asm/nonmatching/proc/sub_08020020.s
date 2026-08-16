	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08020020
sub_08020020: @ 0x08020020
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r3, #0
	ldr r1, _080200E4 @ =gUnknown_08499590
	ldr r0, [r1]
	ldrh r0, [r0, #2]
	cmp r3, r0
	bge _080200D6
	mov sb, r1
_08020036:
	movs r2, #0
	mov r1, sb
	ldr r0, [r1]
	adds r7, r3, #1
	mov r8, r7
	ldrh r0, [r0]
	cmp r2, r0
	bge _080200CA
	ldr r1, _080200E8 @ =gUnknown_03003340
	lsls r0, r3, #2
	adds r4, r0, r1
	movs r5, #1
	ldr r6, _080200E4 @ =gUnknown_08499590
	subs r0, r3, #1
	lsls r0, r0, #2
	adds r0, r0, r1
	mov ip, r0
	lsls r0, r7, #2
	adds r7, r0, r1
_0802005C:
	ldr r0, [r4]
	adds r0, r0, r2
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	blt _080200C0
	cmp r1, #1
	beq _080200C0
	subs r1, r0, #1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0802007C
	cmp r2, #0
	beq _0802007C
	strb r5, [r1]
_0802007C:
	ldr r0, [r4]
	adds r1, r2, r0
	movs r0, #1
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _08020094
	ldr r0, [r6]
	ldrh r0, [r0]
	subs r0, #1
	cmp r2, r0
	beq _08020094
	strb r5, [r1, #1]
_08020094:
	mov r1, ip
	ldr r0, [r1]
	adds r1, r0, r2
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _080200A8
	cmp r3, #0
	beq _080200A8
	strb r5, [r1]
_080200A8:
	ldr r0, [r7]
	adds r1, r0, r2
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _080200C0
	ldr r0, [r6]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r3, r0
	beq _080200C0
	strb r5, [r1]
_080200C0:
	adds r2, #1
	ldr r0, [r6]
	ldrh r0, [r0]
	cmp r2, r0
	blt _0802005C
_080200CA:
	mov r3, r8
	mov r7, sb
	ldr r0, [r7]
	ldrh r0, [r0, #2]
	cmp r3, r0
	blt _08020036
_080200D6:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080200E4: .4byte gUnknown_08499590
_080200E8: .4byte gUnknown_03003340

