	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080232CC
sub_080232CC: @ 0x080232CC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	adds r6, r0, #0
	mov r8, r1
	ldr r1, _08023340 @ =gUnknown_030033E4
	ldrh r0, [r1]
	lsls r0, r0, #0x14
	asrs r0, r0, #0x10
	ldrh r1, [r1, #2]
	lsls r1, r1, #0x14
	asrs r1, r1, #0x10
	lsls r2, r6, #0x10
	asrs r2, r2, #0x10
	mov r4, sp
	adds r4, #6
	str r4, [sp]
	add r3, sp, #4
	bl sub_08023168
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r5, _08023344 @ =gUnknown_08499590
	ldr r2, [r5]
	movs r3, #4
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	movs r3, #0
	ldrsh r1, [r4, r3]
	movs r3, #6
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	adds r2, r6, #0
	bl sub_08043418
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r2, [r5]
	movs r3, #4
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	movs r3, #0
	ldrsh r1, [r4, r3]
	movs r3, #6
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	mov r2, r8
	bl sub_08043418
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08023340: .4byte gUnknown_030033E4
_08023344: .4byte gUnknown_08499590

