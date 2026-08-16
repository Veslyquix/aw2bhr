	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08022428
sub_08022428: @ 0x08022428
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	ldr r1, _080224A0 @ =gUnknown_0809099C
	ldr r0, [r1]
	ldr r2, [r0]
	adds r7, r1, #0
	ldrh r0, [r2, #2]
	cmp r5, r0
	bhs _08022494
	lsls r1, r5, #1
	ldr r3, _080224A4 @ =0x0000417A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r1, r0, r6
	ldr r3, _080224A8 @ =0x0000051A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrb r4, [r0]
	cmp r4, #0
	beq _08022494
	ldr r3, _080224AC @ =0x0000234A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08022494
	adds r0, r4, #0
	bl sub_0802571C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08022494
	ldr r3, _080224B0 @ =gUnknown_080909A0
	ldr r0, [r3]
	ldr r1, [r0]
	lsls r2, r4, #1
	adds r0, r2, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #1]
	movs r0, #4
	ands r0, r1
	str r2, [sp, #0x10]
	cmp r0, #0
	beq _080224B4
_08022494:
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_080223E0
	b _08022568
	.align 2, 0
_080224A0: .4byte gUnknown_0809099C
_080224A4: .4byte 0x0000417A
_080224A8: .4byte 0x0000051A
_080224AC: .4byte 0x0000234A
_080224B0: .4byte gUnknown_080909A0
_080224B4:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080224C4
	movs r0, #0x80
	lsls r0, r0, #1
	mov r8, r0
	b _080224CE
_080224C4:
	movs r2, #0xc0
	mov r8, r2
	mov r3, r8
	ands r3, r4
	mov r8, r3
_080224CE:
	ldr r0, [r7]
	ldr r2, [r0]
	ldrh r0, [r2, #0xc]
	subs r0, r6, r0
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	mov sb, r0
	ldrh r0, [r2, #0xe]
	subs r0, r5, r0
	ands r0, r1
	lsls r0, r0, #1
	mov sl, r0
	ldr r1, _08022514 @ =gUnknown_08499594
	ldr r2, [sp, #0x10]
	adds r0, r2, r4
	lsls r0, r0, #2
	ldr r1, [r1]
	adds r6, r1, r0
	ldrb r1, [r6, #4]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _08022518
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x19
	subs r0, #1
	movs r1, #0xa
	bl Div
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	b _0802251A
	.align 2, 0
_08022514: .4byte gUnknown_08499594
_08022518:
	movs r7, #0
_0802251A:
	lsrs r0, r4, #6
	adds r0, #1
	bl sub_08043050
	adds r5, r0, #0
	movs r0, #1
	ands r5, r0
	ldr r0, _08022578 @ =gUnknown_0849957C
	mov r3, sb
	lsls r1, r3, #1
	ldr r0, [r0]
	adds r0, r0, r1
	mov r2, sl
	lsls r1, r2, #6
	adds r0, r0, r1
	ldr r1, _0802257C @ =gUnknown_08499594
	ldr r2, [r1]
	ldr r3, [sp, #0x10]
	adds r1, r3, r4
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r1, [r1]
	ldrb r2, [r6, #7]
	ldrb r3, [r6, #8]
	orrs r3, r2
	ldrb r2, [r6, #5]
	lsrs r2, r2, #3
	str r2, [sp]
	str r7, [sp, #4]
	ldrb r4, [r6, #1]
	movs r2, #0x20
	ands r2, r4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #8]
	str r5, [sp, #0xc]
	mov r2, r8
	bl sub_0802216C
_08022568:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08022578: .4byte gUnknown_0849957C
_0802257C: .4byte gUnknown_08499594

