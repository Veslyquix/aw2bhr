	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08059464
sub_08059464: @ 0x08059464
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	movs r0, #0
	str r0, [sp, #0xc]
	movs r1, #0
	str r1, [sp, #0x10]
	ldr r6, _08059638 @ =gUnknown_0816D95C
	ldr r0, [r6]
	ldr r5, [r0]
	ldr r4, _0805963C @ =gUnknown_0816D960
	ldr r7, [r4]
	ldr r0, [r7]
	ldrb r0, [r0, #0xa]
	movs r1, #0x64
	bl __umodsi3
	ldrb r1, [r5, #1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	blo _080594AA
	bl sub_08062474
	ldr r2, _08059640 @ =gUnknown_085D5ABC
	ldr r0, [r7]
	ldrb r1, [r0]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #0x1d]
	str r0, [sp, #0x10]
_080594AA:
	ldr r5, _08059644 @ =gUnknown_0816D964
	ldr r4, [r5]
	ldr r0, [r4]
	ldr r2, _08059648 @ =0x00002852
	adds r0, r0, r2
	bl sub_0801F92C
	ldr r0, [r7]
	bl sub_080202A4
	ldr r3, [r4]
	ldr r2, [r7]
	ldrb r1, [r2, #3]
	lsls r1, r1, #1
	ldr r4, _0805964C @ =0x0000417A
	adds r0, r3, r4
	adds r0, r0, r1
	ldrh r1, [r0]
	ldrb r0, [r2, #2]
	adds r1, r1, r0
	ldr r7, _08059650 @ =0x00002D5A
	adds r0, r3, r7
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	ldr r0, _08059654 @ =0x0000FFFF
	str r0, [sp, #8]
	movs r7, #0
	ldr r1, [sp, #0xc]
	ldrh r3, [r3, #2]
	cmp r1, r3
	bge _080595D8
_080594F2:
	movs r2, #0
	ldr r3, _08059644 @ =gUnknown_0816D964
	ldr r0, _08059658 @ =gUnknown_08499590
	ldr r0, [r0]
	lsls r4, r7, #0x10
	str r4, [sp, #0x1c]
	ldrh r0, [r0]
	cmp r2, r0
	bge _080595C2
	ldr r1, _0805965C @ =gUnknown_03003340
	str r4, [sp, #0x14]
	adds r7, r4, #0
	asrs r7, r7, #0x10
	mov sb, r7
	lsls r0, r7, #2
	adds r0, r0, r1
	str r0, [sp, #0x18]
_08059514:
	lsls r0, r2, #0x10
	asrs r4, r0, #0x10
	ldr r2, [sp, #0x18]
	ldr r1, [r2]
	adds r1, r1, r4
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r6, r0, #0
	cmp r1, #0
	blt _080595AC
	ldr r3, [r3]
	mov r8, r3
	ldr r3, [r3]
	mov r7, sb
	lsls r5, r7, #1
	ldr r1, _0805964C @ =0x0000417A
	adds r0, r3, r1
	adds r0, r0, r5
	ldrh r0, [r0]
	adds r2, r0, r4
	ldr r7, _08059650 @ =0x00002D5A
	mov sl, r7
	mov r1, sl
	adds r0, r3, r1
	adds r0, r0, r2
	ldrb r1, [r0]
	ldr r7, [sp, #4]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bgt _080595AC
	ldr r1, _08059660 @ =0x00003262
	adds r0, r3, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	ldr r2, [sp, #0x10]
	ands r0, r2
	cmp r0, #0
	bne _080595AC
	adds r0, r4, #0
	mov r1, sb
	bl sub_08059674
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080595AC
	mov r7, r8
	ldr r2, [r7]
	ldr r1, _0805964C @ =0x0000417A
	adds r0, r2, r1
	adds r0, r0, r5
	ldrh r0, [r0]
	adds r3, r0, r4
	ldr r4, _08059664 @ =0x00001432
	adds r0, r2, r4
	adds r0, r0, r3
	ldrb r1, [r0]
	movs r0, #0x1f
	ands r0, r1
	cmp r0, #0xb
	beq _080595AC
	mov r7, sl
	adds r0, r2, r7
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	lsrs r0, r6, #0x10
	str r0, [sp, #8]
	ldr r1, [sp, #0x14]
	lsrs r1, r1, #0x10
	str r1, [sp, #0xc]
_080595AC:
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r6, r2
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	ldr r3, _08059644 @ =gUnknown_0816D964
	ldr r1, _08059658 @ =gUnknown_08499590
	ldr r1, [r1]
	ldrh r1, [r1]
	cmp r0, r1
	blt _08059514
_080595C2:
	ldr r4, [sp, #0x1c]
	movs r7, #0x80
	lsls r7, r7, #9
	adds r0, r4, r7
	lsrs r7, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, _08059658 @ =gUnknown_08499590
	ldr r1, [r1]
	ldrh r1, [r1, #2]
	cmp r0, r1
	blt _080594F2
_080595D8:
	ldr r1, [sp, #8]
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _080595F6
	ldr r4, [sp, #0xc]
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	movs r0, #0
	str r0, [sp]
	adds r0, r2, #0
	movs r2, #2
	movs r3, #0
	bl sub_0805D648
_080595F6:
	ldr r0, _08059668 @ =gUnknown_030045CC
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08059624
	ldr r0, _0805966C @ =gUnknown_03004784
	ldr r4, [r0]
	ldr r0, _08059670 @ =gUnknown_030040D8
	ldr r0, [r0]
	ldrb r0, [r0, #0xa]
	movs r1, #0x64
	bl __umodsi3
	ldrb r1, [r4, #1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	bls _08059620
	bl sub_0805F914
_08059620:
	bl sub_0805F7B8
_08059624:
	bl sub_0805F7B8
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08059638: .4byte gUnknown_0816D95C
_0805963C: .4byte gUnknown_0816D960
_08059640: .4byte gUnknown_085D5ABC
_08059644: .4byte gUnknown_0816D964
_08059648: .4byte 0x00002852
_0805964C: .4byte 0x0000417A
_08059650: .4byte 0x00002D5A
_08059654: .4byte 0x0000FFFF
_08059658: .4byte gUnknown_08499590
_0805965C: .4byte gUnknown_03003340
_08059660: .4byte 0x00003262
_08059664: .4byte 0x00001432
_08059668: .4byte gUnknown_030045CC
_0805966C: .4byte gUnknown_03004784
_08059670: .4byte gUnknown_030040D8

