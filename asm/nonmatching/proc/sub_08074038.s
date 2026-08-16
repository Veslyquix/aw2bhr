	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08074038
sub_08074038: @ 0x08074038
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r4, [sp, #0x3c]
	ldr r5, [sp, #0x40]
	ldr r6, [sp, #0x44]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov sl, r4
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	str r5, [sp, #0xc]
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	str r6, [sp, #0x10]
	cmp r5, #0
	beq _08074092
	ldr r0, _080740BC @ =gUnknown_08499578
	ldr r0, [r0]
	mov r1, r8
	subs r1, #5
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r2, #2
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	mov r2, sl
	movs r3, #6
	bl sub_08012BC8
_08074092:
	cmp r7, #0
	bne _080740C0
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _0807409E
	b _080741A0
_0807409E:
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r2, sl
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldr r2, _080740BC @ =gUnknown_08499578
	ldr r2, [r2]
	ldr r3, [sp, #0x10]
	str r3, [sp]
	str r7, [sp, #4]
	movs r3, #0
	bl sub_08014B0C
	b _080741A0
	.align 2, 0
_080740BC: .4byte gUnknown_08499578
_080740C0:
	cmp r7, #0
	blt _0807410C
	cmp r7, #5
	bgt _0807410C
	movs r6, #0
	cmp r6, r7
	bhs _080741A0
	mov r4, sb
	lsls r5, r4, #0xc
_080740D2:
	adds r4, r6, #1
	subs r0, r7, r6
	mov r1, r8
	subs r0, r1, r0
	lsls r0, r0, #3
	ldr r1, _08074100 @ =gUnknown_03001FF8
	ldrh r1, [r1]
	subs r0, r0, r1
	ldr r1, _08074104 @ =0x000001FF
	ands r0, r1
	mov r2, sl
	lsls r1, r2, #3
	ldr r2, _08074108 @ =gUnknown_0848B690
	ldr r3, [sp, #8]
	orrs r3, r5
	bl sub_0801BD00
	lsls r4, r4, #0x10
	lsrs r6, r4, #0x10
	cmp r6, r7
	blo _080740D2
	b _080741A0
	.align 2, 0
_08074100: .4byte gUnknown_03001FF8
_08074104: .4byte 0x000001FF
_08074108: .4byte gUnknown_0848B690
_0807410C:
	movs r1, #0xa
	movs r6, #0
	mov r3, sl
	lsls r3, r3, #3
	str r3, [sp, #0x18]
	mov r4, sb
	lsls r4, r4, #0xc
	str r4, [sp, #0x14]
	ldr r0, [sp, #8]
	adds r0, #4
	mov sb, r0
	cmp r7, #0xa
	blo _0807413C
_08074126:
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #0x11
	lsrs r1, r0, #0x10
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #9
	bhi _0807413C
	cmp r7, r1
	bhs _08074126
_0807413C:
	adds r0, r6, #3
	mov r1, r8
	subs r0, r1, r0
	lsls r0, r0, #3
	ldr r5, _080741B0 @ =gUnknown_03001FF8
	ldrh r1, [r5]
	subs r0, r0, r1
	ldr r4, _080741B4 @ =0x000001FF
	ands r0, r4
	ldr r2, _080741B8 @ =gUnknown_0848B690
	ldr r3, [sp, #8]
	ldr r1, [sp, #0x14]
	orrs r3, r1
	ldr r1, [sp, #0x18]
	bl sub_0801BD00
	adds r0, r6, #1
	mov r2, r8
	subs r0, r2, r0
	lsls r0, r0, #3
	ldrh r1, [r5]
	subs r0, r0, r1
	ands r0, r4
	ldr r1, [sp, #0x18]
	adds r1, #6
	ldr r2, _080741BC @ =gUnknown_0848B688
	mov r3, sb
	ldr r4, [sp, #0x14]
	orrs r3, r4
	mov sb, r3
	bl sub_0801BD00
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _080741A0
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r2, sl
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldr r2, _080741C0 @ =gUnknown_08499578
	ldr r2, [r2]
	ldr r3, [sp, #0x10]
	str r3, [sp]
	movs r3, #0
	str r3, [sp, #4]
	adds r3, r7, #0
	bl sub_08014B0C
_080741A0:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080741B0: .4byte gUnknown_03001FF8
_080741B4: .4byte 0x000001FF
_080741B8: .4byte gUnknown_0848B690
_080741BC: .4byte gUnknown_0848B688
_080741C0: .4byte gUnknown_08499578

