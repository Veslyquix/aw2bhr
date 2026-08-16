	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080164E0
sub_080164E0: @ 0x080164E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	mov sl, r1
	ldr r0, _08016594 @ =gUnknown_03001470
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
	bne _0801657C
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
	mov r0, r8
	adds r0, #0x4c
	adds r0, r7, r0
	ldr r5, _08016598 @ =0x00000000
	str r5, [r0]
	mov r4, r8
	adds r4, #0x50
	adds r4, r7, r4
	mov r0, r8
	adds r0, #4
	adds r0, r7, r0
	ldr r6, [r0]
	ldr r0, [r6]
	bl __floatsisf
	str r0, [r4]
	mov r0, r8
	adds r0, #0x54
	adds r0, r7, r0
	str r5, [r0]
	mov r0, r8
	adds r0, #0x58
	adds r0, r7, r0
	str r5, [r0]
	mov r0, r8
	adds r0, #0x5c
	adds r0, r7, r0
	ldrh r1, [r6, #4]
	str r1, [r0]
	mov r3, sb
	ldrh r0, [r3, #0x38]
	adds r0, #1
	strh r0, [r3, #0x38]
_0801657C:
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
_08016594: .4byte gUnknown_03001470
_08016598: .4byte 0x00000000

