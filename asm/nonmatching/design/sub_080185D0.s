	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080185D0
sub_080185D0: @ 0x080185D0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	lsls r0, r0, #0x10
	ldr r2, _08018650 @ =gUnknown_08610A38
	ldr r4, _08018654 @ =gUnknown_0808E580
	ldr r1, [r4]
	mov r8, r1
	lsrs r7, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r6, r1, #3
	mov r0, r8
	adds r0, #4
	adds r5, r6, r0
	ldr r0, [r5]
	movs r1, #8
	ldrsh r0, [r0, r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	bl sub_08014004
	lsls r0, r0, #0x18
	ldr r2, _08018658 @ =gUnknown_0808E584
	cmp r0, #0
	bne _08018610
	ldr r1, [r2]
	movs r0, #2
	strb r0, [r1]
_08018610:
	ldr r0, [r2]
	ldrb r0, [r0]
	cmp r0, #1
	beq _0801866C
	ldr r0, _0801865C @ =gUnknown_08499588
	ldr r2, [r0]
	ldr r0, [r5]
	ldrh r3, [r0, #8]
	ldr r0, _08018660 @ =gUnknown_03002F08
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp, #4]
	movs r0, #7
	movs r1, #1
	bl sub_08014740
	ldr r1, _08018664 @ =sub_080185A0
	str r1, [r0, #0x3c]
	adds r0, #0x38
	movs r1, #1
	strb r1, [r0]
	mov r0, r8
	adds r0, #8
	adds r0, r6, r0
	ldr r1, _08018668 @ =sub_080185BC
	str r1, [r0]
	movs r3, #0
	b _0801866E
	.align 2, 0
_08018650: .4byte gUnknown_08610A38
_08018654: .4byte gUnknown_0808E580
_08018658: .4byte gUnknown_0808E584
_0801865C: .4byte gUnknown_08499588
_08018660: .4byte gUnknown_03002F08
_08018664: .4byte sub_080185A0
_08018668: .4byte sub_080185BC
_0801866C:
	movs r3, #1
_0801866E:
	ldr r2, [r4]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r2, #4
	adds r1, r1, r2
	ldr r0, [r1]
	adds r0, #0x10
	str r0, [r1]
	adds r0, r3, #0
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

