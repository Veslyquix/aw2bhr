	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802361C
sub_0802361C: @ 0x0802361C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r2, _080236D4 @ =gUnknown_080909FC
	ldr r0, [r2]
	ldr r7, [r0]
	ldrh r1, [r7, #0x10]
	movs r0, #0xf
	ands r0, r1
	mov sl, r2
	cmp r0, #0
	bne _080236C4
	ldr r0, _080236D8 @ =gpKeySt
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	lsrs r5, r0, #4
	movs r0, #0xf
	ands r5, r0
	ldr r3, _080236DC @ =gUnknown_08090A00
	ldr r0, [r3]
	mov ip, r0
	ldrh r4, [r0]
	ldr r2, _080236E0 @ =gUnknown_08090A04
	ldr r1, [r2]
	lsls r0, r5, #2
	adds r6, r0, r1
	movs r0, #0
	ldrsh r1, [r6, r0]
	adds r4, r4, r1
	mov r8, r3
	mov sb, r2
	cmp r4, #0
	blt _08023684
	ldrh r7, [r7]
	cmp r4, r7
	bge _08023684
	ldr r0, _080236E4 @ =gUnknown_030032C4
	lsls r1, r1, #2
	ldrh r2, [r0]
	adds r1, r1, r2
	strh r1, [r0]
	mov r0, ip
	strh r4, [r0]
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	beq _08023684
	movs r0, #0x6a
	bl sub_0803B4DC
_08023684:
	mov r2, r8
	ldr r3, [r2]
	ldrh r0, [r3, #2]
	mov r4, sb
	ldr r1, [r4]
	lsls r2, r5, #2
	adds r1, #2
	adds r2, r2, r1
	movs r5, #0
	ldrsh r1, [r2, r5]
	adds r4, r0, r1
	cmp r4, #0
	blt _080236C4
	mov r5, sl
	ldr r0, [r5]
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	cmp r4, r0
	bge _080236C4
	ldr r0, _080236E4 @ =gUnknown_030032C4
	lsls r1, r1, #2
	ldrh r5, [r0, #2]
	adds r1, r1, r5
	strh r1, [r0, #2]
	strh r4, [r3, #2]
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	beq _080236C4
	movs r0, #0x6a
	bl sub_0803B4DC
_080236C4:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080236D4: .4byte gUnknown_080909FC
_080236D8: .4byte gpKeySt
_080236DC: .4byte gUnknown_08090A00
_080236E0: .4byte gUnknown_08090A04
_080236E4: .4byte gUnknown_030032C4

