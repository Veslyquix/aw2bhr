	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801659C
sub_0801659C: @ 0x0801659C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	ldr r1, _080167BC @ =gUnknown_0808E538
	ldr r0, [r1]
	mov sb, r0
	mov r2, sl
	lsls r0, r2, #1
	add r0, sl
	lsls r7, r0, #5
	mov r0, sb
	adds r0, #4
	adds r0, r7, r0
	ldr r0, [r0]
	ldr r0, [r0]
	mov r8, r0
	mov r3, sb
	adds r3, r7, r3
	str r3, [sp, #4]
	movs r2, #0x38
	ldrsh r0, [r3, r2]
	cmp r0, #0
	beq _080165D8
	b _080166DA
_080165D8:
	mov r4, sp
	adds r4, #2
	mov r0, sl
	mov r1, sp
	adds r2, r4, #0
	bl sub_080155E8
	mov r6, sb
	adds r6, #0x3c
	adds r6, r7, r6
	mov r0, sp
	movs r3, #0
	ldrsh r0, [r0, r3]
	bl __floatsisf
	str r0, [r6]
	mov r0, sb
	adds r0, #0x40
	adds r0, r7, r0
	str r0, [sp, #8]
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl __floatsisf
	ldr r2, [sp, #8]
	str r0, [r2]
	mov r5, sb
	adds r5, #0x44
	adds r5, r7, r5
	mov r3, r8
	ldr r0, [r3]
	ldr r1, [r6]
	bl __addsf3
	str r0, [r5]
	mov r0, sb
	adds r0, #0x48
	adds r0, r7, r0
	str r0, [sp, #0xc]
	mov r1, r8
	ldr r0, [r1, #4]
	ldr r2, [sp, #8]
	ldr r1, [r2]
	bl __addsf3
	ldr r3, [sp, #0xc]
	str r0, [r3]
	mov r4, sb
	adds r4, #0x4c
	adds r4, r7, r4
	mov r1, r8
	ldr r0, [r1, #8]
	str r0, [r4]
	mov r0, sb
	adds r0, #0x54
	adds r0, r7, r0
	ldr r1, _080167C0 @ =0x00000000
	str r1, [r0]
	mov r0, sb
	adds r0, #0x58
	adds r0, r7, r0
	mov r2, r8
	ldr r2, [r2, #0xc]
	mov r8, r2
	str r2, [r0]
	ldr r0, [r5]
	ldr r1, [r6]
	bl __subsf3
	ldr r1, [r4]
	bl __divsf3
	bl __fixsfsi
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0801667C
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_0801667C:
	mov r6, sb
	adds r6, #0x50
	adds r6, r7, r6
	mov r0, r8
	bl __negsf2
	adds r4, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	subs r0, r5, #1
	bl __floatsisf
	adds r1, r0, #0
	adds r0, r4, #0
	bl __mulsf3
	ldr r1, _080167C4 @ =0x3F000000
	bl __mulsf3
	mov r8, r0
	ldr r3, [sp, #0xc]
	ldr r0, [r3]
	ldr r2, [sp, #8]
	ldr r1, [r2]
	bl __subsf3
	adds r4, r0, #0
	adds r0, r5, #0
	bl __floatsisf
	adds r1, r0, #0
	adds r0, r4, #0
	bl __divsf3
	adds r1, r0, #0
	mov r0, r8
	bl __addsf3
	str r0, [r6]
	mov r0, sb
	adds r0, #0x5c
	adds r0, r7, r0
	str r5, [r0]
	ldr r3, [sp, #4]
	ldrh r0, [r3, #0x38]
	adds r0, #1
	strh r0, [r3, #0x38]
_080166DA:
	ldr r0, _080167C8 @ =gUnknown_03001470
	mov sb, r0
	mov r1, sl
	lsls r0, r1, #1
	add r0, sl
	lsls r7, r0, #5
	movs r2, #0x3c
	add r2, sb
	mov r8, r2
	add r8, r7
	mov r5, sb
	adds r5, #0x4c
	adds r5, r7, r5
	mov r3, r8
	ldr r0, [r3]
	ldr r1, [r5]
	bl __addsf3
	mov r1, r8
	str r0, [r1]
	mov r6, sb
	adds r6, #0x40
	adds r6, r7, r6
	mov r4, sb
	adds r4, #0x50
	adds r4, r7, r4
	ldr r0, [r6]
	ldr r1, [r4]
	bl __addsf3
	str r0, [r6]
	mov r1, sb
	adds r1, #0x54
	adds r1, r7, r1
	ldr r0, [r5]
	ldr r1, [r1]
	bl __addsf3
	str r0, [r5]
	mov r1, sb
	adds r1, #0x58
	adds r1, r7, r1
	ldr r0, [r4]
	ldr r1, [r1]
	bl __addsf3
	str r0, [r4]
	mov r2, r8
	ldr r0, [r2]
	bl __fixsfsi
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r0, [r6]
	bl __fixsfsi
	adds r2, r0, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r0, sl
	adds r1, r4, #0
	bl sub_080155C0
	mov r1, sb
	adds r1, #0x5c
	adds r1, r7, r1
	ldr r0, [r1]
	adds r2, r0, #0
	subs r0, #1
	str r0, [r1]
	cmp r2, #0
	bne _080167AA
	mov r3, sb
	adds r0, r7, r3
	strh r2, [r0, #0x38]
	mov r1, sb
	adds r1, #4
	adds r1, r7, r1
	ldr r0, [r1]
	adds r0, #8
	str r0, [r1]
	mov r0, sb
	adds r0, #0x44
	adds r0, r7, r0
	ldr r0, [r0]
	bl __fixsfsi
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, sb
	adds r0, #0x48
	adds r0, r7, r0
	ldr r0, [r0]
	bl __fixsfsi
	adds r2, r0, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r0, sl
	adds r1, r4, #0
	bl sub_080155C0
_080167AA:
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080167BC: .4byte gUnknown_0808E538
_080167C0: .4byte 0x00000000
_080167C4: .4byte 0x3F000000
_080167C8: .4byte gUnknown_03001470

