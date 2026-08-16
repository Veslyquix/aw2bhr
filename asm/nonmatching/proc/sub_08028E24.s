	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08028E24
sub_08028E24: @ 0x08028E24
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	ldr r6, [r4, #0x4c]
	adds r1, r4, #0
	adds r1, #0x66
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #8
	bne _08028E58
	ldr r1, _08028E54 @ =gUnknown_03003100
	ldrh r0, [r1]
	ldrh r1, [r1, #2]
	movs r2, #1
	bl sub_08022990
	adds r0, r4, #0
	bl Proc_End
	b _08028EBA
	.align 2, 0
_08028E54: .4byte gUnknown_03003100
_08028E58:
	adds r0, r2, #1
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x64
	movs r7, #0
	ldrsh r1, [r0, r7]
	adds r5, r0, #0
	cmp r1, #0x10
	bgt _08028EBA
	movs r2, #0
	cmp r2, r1
	bge _08028EBA
	mov r8, r2
_08028E72:
	lsls r4, r2, #0x10
	asrs r4, r4, #0x10
	lsls r2, r4, #3
	adds r2, r2, r6
	ldrh r0, [r2, #4]
	ldrh r1, [r2]
	adds r0, r0, r1
	strh r0, [r2]
	ldrh r0, [r2, #6]
	ldrh r3, [r2, #2]
	adds r0, r0, r3
	strh r0, [r2, #2]
	ldrh r1, [r2]
	ldr r0, _08028EC8 @ =gUnknown_08499590
	ldr r3, [r0]
	movs r7, #4
	ldrsh r0, [r3, r7]
	subs r1, r1, r0
	ldrh r2, [r2, #2]
	movs r7, #6
	ldrsh r0, [r3, r7]
	subs r2, r2, r0
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	ldr r3, _08028ECC @ =gUnknown_08499FE4
	bl sub_0801BEBC
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r2, r4, #0x10
	asrs r4, r4, #0x10
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r4, r0
	blt _08028E72
_08028EBA:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08028EC8: .4byte gUnknown_08499590
_08028ECC: .4byte gUnknown_08499FE4

