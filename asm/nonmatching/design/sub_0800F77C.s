	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800F77C
sub_0800F77C: @ 0x0800F77C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r0
	mov sl, r1
	adds r5, r2, #0
	bl sub_0800F564
	mov r8, r0
	movs r0, #0
	str r0, [sp]
	ldr r0, _0800F818 @ =gUnknown_0848895C
	lsls r1, r5, #1
	adds r0, r1, r0
	str r0, [sp, #4]
	movs r2, #0
	ldrsh r0, [r0, r2]
	mov r3, sb
	adds r4, r3, r0
	cmp r4, #0
	blt _0800F876
	ldr r0, _0800F81C @ =gUnknown_08499590
	ldr r2, [r0]
	ldrh r7, [r2]
	cmp r4, r7
	bge _0800F876
	ldr r0, _0800F820 @ =gUnknown_08488964
	adds r6, r1, r0
	movs r1, #0
	ldrsh r0, [r6, r1]
	mov r7, sl
	adds r3, r7, r0
	cmp r3, #0
	blt _0800F876
	ldrh r0, [r2, #2]
	cmp r3, r0
	bge _0800F876
	lsls r1, r3, #1
	ldr r7, _0800F824 @ =0x0000417A
	adds r0, r2, r7
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, r1, r4
	lsls r1, r1, #1
	ldr r7, _0800F828 @ =0x00000A22
	adds r0, r2, r7
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r2, _0800F82C @ =0xFFFFFE9E
	adds r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800F86E
	cmp r5, #1
	bhi _0800F834
	ldr r0, _0800F830 @ =0x00000163
	cmp r1, r0
	bne _0800F86A
	adds r0, r4, #0
	adds r1, r3, #0
	movs r2, #2
	bl sub_0800F564
	cmp r0, #2
	beq _0800F876
	ldr r3, [sp, #4]
	movs r7, #0
	ldrsh r0, [r3, r7]
	add r0, sb
	movs r2, #0
	ldrsh r1, [r6, r2]
	add r1, sl
	movs r2, #3
	b _0800F862
	.align 2, 0
_0800F818: .4byte gUnknown_0848895C
_0800F81C: .4byte gUnknown_08499590
_0800F820: .4byte gUnknown_08488964
_0800F824: .4byte 0x0000417A
_0800F828: .4byte 0x00000A22
_0800F82C: .4byte 0xFFFFFE9E
_0800F830: .4byte 0x00000163
_0800F834:
	subs r0, r5, #2
	cmp r0, #1
	bhi _0800F86E
	lsls r1, r1, #0x10
	movs r0, #0xb1
	lsls r0, r0, #0x11
	cmp r1, r0
	bne _0800F86A
	adds r0, r4, #0
	adds r1, r3, #0
	movs r2, #0
	bl sub_0800F564
	cmp r0, #2
	beq _0800F876
	ldr r3, [sp, #4]
	movs r7, #0
	ldrsh r0, [r3, r7]
	add r0, sb
	movs r2, #0
	ldrsh r1, [r6, r2]
	add r1, sl
	movs r2, #1
_0800F862:
	bl sub_0800F564
	cmp r0, #2
	beq _0800F876
_0800F86A:
	movs r0, #0
	b _0800F8BC
_0800F86E:
	mov r0, r8
	subs r0, #2
	cmp r0, #1
	bls _0800F87A
_0800F876:
	movs r0, #2
	b _0800F8BC
_0800F87A:
	movs r4, #0
	lsls r6, r5, #1
	ldr r7, _0800F8CC @ =gUnknown_0848895C
	ldr r0, _0800F8D0 @ =gUnknown_08488964
	adds r0, r0, r6
	mov r8, r0
	adds r5, r7, #0
_0800F888:
	adds r0, r6, r7
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmn r1, r0
	beq _0800F8B2
	mov r3, sb
	adds r0, r3, r1
	mov r2, r8
	movs r3, #0
	ldrsh r1, [r2, r3]
	add r1, sl
	adds r2, r4, #0
	bl sub_0800F564
	cmp r0, #2
	bne _0800F8B2
	ldr r0, [sp]
	adds r0, #1
	str r0, [sp]
_0800F8B2:
	adds r5, #2
	adds r4, #1
	cmp r4, #3
	ble _0800F888
	ldr r0, [sp]
_0800F8BC:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800F8CC: .4byte gUnknown_0848895C
_0800F8D0: .4byte gUnknown_08488964

