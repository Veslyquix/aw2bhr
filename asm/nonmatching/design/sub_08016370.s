	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08016370
sub_08016370: @ 0x08016370
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	mov sl, r1
	ldr r7, _08016428 @ =gUnknown_03001470
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r6, r0, #5
	adds r0, r7, #4
	adds r0, r6, r0
	ldr r0, [r0]
	ldr r0, [r0]
	mov r8, r0
	adds r0, r6, r7
	mov sb, r0
	movs r2, #0x38
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _08016410
	mov r5, sp
	adds r5, #2
	adds r0, r1, #0
	mov r1, sp
	adds r2, r5, #0
	bl sub_080155E8
	adds r4, r7, #0
	adds r4, #0x3c
	adds r4, r6, r4
	mov r0, sp
	movs r3, #0
	ldrsh r0, [r0, r3]
	bl __floatsisf
	str r0, [r4]
	adds r4, r7, #0
	adds r4, #0x40
	adds r4, r6, r4
	movs r1, #0
	ldrsh r0, [r5, r1]
	bl __floatsisf
	str r0, [r4]
	adds r0, r7, #0
	adds r0, #0x4c
	adds r0, r6, r0
	mov r2, r8
	ldr r1, [r2]
	str r1, [r0]
	adds r0, r7, #0
	adds r0, #0x50
	adds r0, r6, r0
	ldr r1, [r2, #4]
	str r1, [r0]
	adds r0, r7, #0
	adds r0, #0x54
	adds r0, r6, r0
	ldr r1, [r2, #8]
	str r1, [r0]
	adds r0, r7, #0
	adds r0, #0x58
	adds r0, r6, r0
	ldr r1, [r2, #0xc]
	str r1, [r0]
	adds r4, r7, #0
	adds r4, #0x5c
	adds r4, r6, r4
	ldr r0, [r2, #0x10]
	bl __fixsfsi
	str r0, [r4]
	mov r3, sb
	ldrh r0, [r3, #0x38]
	adds r0, #1
	strh r0, [r3, #0x38]
_08016410:
	mov r0, sl
	bl sub_080162A4
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
_08016428: .4byte gUnknown_03001470

