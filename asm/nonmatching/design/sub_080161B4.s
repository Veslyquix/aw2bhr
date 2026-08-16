	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080161B4
sub_080161B4: @ 0x080161B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	mov sl, r1
	ldr r0, _0801623C @ =gUnknown_03001470
	mov r8, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r7, r0, #5
	adds r2, r7, #0
	add r2, r8
	mov sb, r2
	movs r3, #0x38
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bne _0801620E
	mov r5, sp
	adds r5, #2
	adds r0, r1, #0
	mov r1, sp
	adds r2, r5, #0
	bl sub_080155E8
	mov r4, r8
	adds r4, #0x3c
	adds r4, r7, r4
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl __floatsisf
	str r0, [r4]
	mov r4, r8
	adds r4, #0x40
	adds r4, r7, r4
	movs r2, #0
	ldrsh r0, [r5, r2]
	bl __floatsisf
	str r0, [r4]
_0801620E:
	mov r0, r8
	adds r0, #4
	adds r3, r7, r0
	ldr r2, [r3]
	ldr r6, [r2]
	mov r4, sb
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r6, r6, r0
	movs r4, #0
	ldrsh r1, [r6, r4]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08016240
	adds r0, r2, #0
	adds r0, #8
	str r0, [r3]
	movs r0, #0
	mov r1, sb
	strh r0, [r1, #0x38]
	b _08016290
	.align 2, 0
_0801623C: .4byte gUnknown_03001470
_08016240:
	mov r4, r8
	adds r4, #0x3c
	adds r4, r7, r4
	movs r2, #0
	ldrsh r0, [r6, r2]
	bl __floatsisf
	adds r1, r0, #0
	ldr r0, [r4]
	bl __addsf3
	bl __fixsfsi
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r4, r8
	adds r4, #0x40
	adds r4, r7, r4
	movs r3, #2
	ldrsh r0, [r6, r3]
	bl __floatsisf
	adds r1, r0, #0
	ldr r0, [r4]
	bl __addsf3
	bl __fixsfsi
	adds r2, r0, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r0, sl
	adds r1, r5, #0
	bl sub_080155C0
	mov r4, sb
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
_08016290:
	movs r0, #0
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

