	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801E508
sub_0801E508: @ 0x0801E508
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	adds r4, r0, #0
	str r1, [sp]
	str r2, [sp, #4]
	ldrh r2, [r3]
	adds r0, r3, #0
	adds r0, #2
	str r0, [sp, #8]
	adds r0, r4, r2
	cmp r0, #0x80
	ble _0801E52C
	movs r0, #1
	b _0801E8BA
_0801E52C:
	ldr r1, _0801E590 @ =gUnknown_03002520
	lsls r0, r4, #3
	adds r1, r0, r1
	str r1, [sp, #0x14]
	cmp r2, #0
	bne _0801E53A
	b _0801E8B8
_0801E53A:
	ldr r1, _0801E594 @ =gUnknown_0200F720
	ldr r3, [sp, #0x44]
	lsls r0, r3, #4
	adds r0, r0, r1
	mov sb, r0
	str r2, [sp, #0xc]
_0801E546:
	ldr r0, [sp, #8]
	ldrh r0, [r0]
	mov r8, r0
	ldr r1, [sp, #8]
	adds r1, #2
	str r1, [sp, #8]
	movs r2, #0xff
	ands r0, r2
	mov sl, r0
	movs r0, #0x80
	mov r3, sl
	ands r0, r3
	cmp r0, #0
	beq _0801E568
	ldr r0, _0801E598 @ =0xFFFFFF00
	orrs r3, r0
	mov sl, r3
_0801E568:
	movs r0, #0x80
	lsls r0, r0, #1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0801E5A4
	ldr r2, [sp, #8]
	ldrh r7, [r2]
	adds r2, #2
	str r2, [sp, #8]
	ldr r0, _0801E59C @ =0x0000C1FF
	ands r7, r0
	ldr r1, _0801E5A0 @ =gUnknown_0808F0B8
	ldr r3, [sp, #0x44]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	orrs r7, r0
	b _0801E5AC
	.align 2, 0
_0801E590: .4byte gUnknown_03002520
_0801E594: .4byte gUnknown_0200F720
_0801E598: .4byte 0xFFFFFF00
_0801E59C: .4byte 0x0000C1FF
_0801E5A0: .4byte gUnknown_0808F0B8
_0801E5A4:
	ldr r0, [sp, #8]
	ldrh r7, [r0]
	adds r0, #2
	str r0, [sp, #8]
_0801E5AC:
	ldr r1, _0801E708 @ =0x000001FF
	ands r1, r7
	str r1, [sp, #0x10]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0801E5C2
	ldr r0, _0801E70C @ =0xFFFFFE00
	orrs r1, r0
	str r1, [sp, #0x10]
_0801E5C2:
	movs r1, #0xc0
	lsls r1, r1, #2
	mov r0, r8
	ands r0, r1
	cmp r0, r1
	beq _0801E5D0
	b _0801E710
_0801E5D0:
	adds r0, r7, #0
	bl sub_0801E3B4
	ldr r2, [sp, #0x10]
	adds r2, r2, r0
	str r2, [sp, #0x10]
	mov r0, r8
	bl sub_0801E3B4
	add sl, r0
	adds r0, r7, #0
	bl sub_0801E3B4
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x10]
	bl __floatsisf
	adds r4, r0, #0
	mov r3, sb
	movs r1, #4
	ldrsh r0, [r3, r1]
	bl __floatsisf
	bl sub_0808B91C
	adds r1, r0, #0
	adds r0, r4, #0
	bl __mulsf3
	adds r4, r0, #0
	mov r2, sb
	movs r3, #0
	ldrsh r0, [r2, r3]
	bl __floatsisf
	adds r1, r0, #0
	adds r0, r4, #0
	bl __divsf3
	adds r5, r0, #0
	mov r0, sl
	bl __floatsisf
	adds r6, r0, #0
	mov r1, sb
	movs r2, #4
	ldrsh r0, [r1, r2]
	bl __floatsisf
	bl sub_0808B710
	adds r1, r0, #0
	adds r0, r6, #0
	bl __mulsf3
	adds r4, r0, #0
	mov r3, sb
	movs r1, #0
	ldrsh r0, [r3, r1]
	bl __floatsisf
	adds r1, r0, #0
	adds r0, r4, #0
	bl __divsf3
	adds r1, r0, #0
	adds r0, r5, #0
	bl __addsf3
	adds r4, r0, #0
	ldr r0, [sp]
	bl __floatsisf
	adds r1, r0, #0
	adds r0, r4, #0
	bl __addsf3
	adds r4, r0, #0
	ldr r0, [sp, #0x18]
	bl __floatsisf
	adds r1, r0, #0
	adds r0, r4, #0
	bl __subsf3
	bl __fixsfsi
	mov sl, r0
	mov r0, r8
	bl sub_0801E3B4
	str r0, [sp, #0x1c]
	ldr r2, [sp, #0x10]
	rsbs r0, r2, #0
	bl __floatsisf
	adds r4, r0, #0
	mov r3, sb
	movs r1, #4
	ldrsh r0, [r3, r1]
	bl __floatsisf
	bl sub_0808B710
	adds r1, r0, #0
	adds r0, r4, #0
	bl __mulsf3
	adds r4, r0, #0
	mov r2, sb
	movs r3, #2
	ldrsh r0, [r2, r3]
	bl __floatsisf
	adds r1, r0, #0
	adds r0, r4, #0
	bl __divsf3
	adds r5, r0, #0
	mov r1, sb
	movs r2, #4
	ldrsh r0, [r1, r2]
	bl __floatsisf
	bl sub_0808B91C
	adds r1, r0, #0
	adds r0, r6, #0
	bl __mulsf3
	adds r4, r0, #0
	mov r3, sb
	movs r1, #2
	ldrsh r0, [r3, r1]
	bl __floatsisf
	adds r1, r0, #0
	adds r0, r4, #0
	bl __divsf3
	adds r1, r0, #0
	adds r0, r5, #0
	bl __addsf3
	adds r4, r0, #0
	ldr r0, [sp, #4]
	bl __floatsisf
	adds r1, r0, #0
	adds r0, r4, #0
	bl __addsf3
	adds r4, r0, #0
	ldr r0, [sp, #0x1c]
	b _0801E85C
	.align 2, 0
_0801E708: .4byte 0x000001FF
_0801E70C: .4byte 0xFFFFFE00
_0801E710:
	adds r0, r7, #0
	bl sub_0801E3B4
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldr r2, [sp, #0x10]
	adds r2, r2, r0
	str r2, [sp, #0x10]
	mov r0, r8
	bl sub_0801E3B4
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	add sl, r0
	adds r0, r7, #0
	bl sub_0801E3B4
	adds r5, r0, #0
	ldr r0, [sp, #0x10]
	bl __floatsisf
	adds r4, r0, #0
	mov r3, sb
	movs r1, #4
	ldrsh r0, [r3, r1]
	bl __floatsisf
	bl sub_0808B91C
	adds r1, r0, #0
	adds r0, r4, #0
	bl __mulsf3
	adds r4, r0, #0
	mov r2, sb
	movs r3, #0
	ldrsh r0, [r2, r3]
	bl __floatsisf
	adds r1, r0, #0
	adds r0, r4, #0
	bl __divsf3
	adds r6, r0, #0
	mov r0, sl
	bl __floatsisf
	str r0, [sp, #0x20]
	mov r1, sb
	movs r2, #4
	ldrsh r0, [r1, r2]
	bl __floatsisf
	bl sub_0808B710
	adds r1, r0, #0
	ldr r0, [sp, #0x20]
	bl __mulsf3
	adds r4, r0, #0
	mov r3, sb
	movs r1, #0
	ldrsh r0, [r3, r1]
	bl __floatsisf
	adds r1, r0, #0
	adds r0, r4, #0
	bl __divsf3
	adds r1, r0, #0
	adds r0, r6, #0
	bl __addsf3
	adds r4, r0, #0
	ldr r0, [sp]
	bl __floatsisf
	adds r1, r0, #0
	adds r0, r4, #0
	bl __addsf3
	adds r4, r0, #0
	lsrs r0, r5, #0x1f
	adds r5, r5, r0
	asrs r5, r5, #1
	adds r0, r5, #0
	bl __floatsisf
	adds r1, r0, #0
	adds r0, r4, #0
	bl __subsf3
	bl __fixsfsi
	mov sl, r0
	mov r0, r8
	bl sub_0801E3B4
	adds r5, r0, #0
	ldr r2, [sp, #0x10]
	rsbs r0, r2, #0
	bl __floatsisf
	adds r4, r0, #0
	mov r3, sb
	movs r1, #4
	ldrsh r0, [r3, r1]
	bl __floatsisf
	bl sub_0808B710
	adds r1, r0, #0
	adds r0, r4, #0
	bl __mulsf3
	adds r4, r0, #0
	mov r2, sb
	movs r3, #2
	ldrsh r0, [r2, r3]
	bl __floatsisf
	adds r1, r0, #0
	adds r0, r4, #0
	bl __divsf3
	adds r6, r0, #0
	mov r1, sb
	movs r2, #4
	ldrsh r0, [r1, r2]
	bl __floatsisf
	bl sub_0808B91C
	adds r1, r0, #0
	ldr r0, [sp, #0x20]
	bl __mulsf3
	adds r4, r0, #0
	mov r3, sb
	movs r1, #2
	ldrsh r0, [r3, r1]
	bl __floatsisf
	adds r1, r0, #0
	adds r0, r4, #0
	bl __divsf3
	adds r1, r0, #0
	adds r0, r6, #0
	bl __addsf3
	adds r4, r0, #0
	ldr r0, [sp, #4]
	bl __floatsisf
	adds r1, r0, #0
	adds r0, r4, #0
	bl __addsf3
	adds r4, r0, #0
	lsrs r0, r5, #0x1f
	adds r5, r5, r0
	asrs r5, r5, #1
	adds r0, r5, #0
_0801E85C:
	bl __floatsisf
	adds r1, r0, #0
	adds r0, r4, #0
	bl __subsf3
	bl __fixsfsi
	adds r1, r0, #0
	ldr r2, _0801E8CC @ =0xFFFFFF00
	adds r0, r2, #0
	mov r3, r8
	ands r3, r0
	movs r0, #0xff
	ands r1, r0
	orrs r3, r1
	ldr r0, [sp, #0x14]
	strh r3, [r0]
	adds r0, #2
	str r0, [sp, #0x14]
	ldr r1, _0801E8D0 @ =0xFFFFFE00
	adds r0, r1, #0
	ands r7, r0
	ldr r2, _0801E8D4 @ =0x000001FF
	adds r0, r2, #0
	mov r3, sl
	ands r3, r0
	orrs r7, r3
	ldr r0, [sp, #0x14]
	strh r7, [r0]
	adds r0, #2
	str r0, [sp, #0x14]
	ldr r1, [sp, #8]
	ldrh r0, [r1]
	ldr r2, [sp, #0x14]
	strh r0, [r2]
	adds r1, #2
	str r1, [sp, #8]
	adds r2, #4
	str r2, [sp, #0x14]
	ldr r3, [sp, #0xc]
	subs r3, #1
	str r3, [sp, #0xc]
	cmp r3, #0
	beq _0801E8B8
	b _0801E546
_0801E8B8:
	movs r0, #0
_0801E8BA:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801E8CC: .4byte 0xFFFFFF00
_0801E8D0: .4byte 0xFFFFFE00
_0801E8D4: .4byte 0x000001FF

