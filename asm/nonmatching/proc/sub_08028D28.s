	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08028D28
sub_08028D28: @ 0x08028D28
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	movs r0, #0xcc
	lsls r0, r0, #3
	bl sub_08014E44
	mov r1, sb
	str r0, [r1, #0x4c]
	adds r4, r0, #0
	mov r0, sb
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	movs r2, #0
	ldr r1, _08028E0C @ =gUnknown_08499590
	ldr r0, [r1]
	ldrh r3, [r0, #2]
	cmp r2, r3
	bge _08028DFA
	mov sl, r1
	mov r8, r0
_08028D60:
	movs r3, #0
	lsls r2, r2, #0x10
	str r2, [sp]
	mov r7, r8
	ldrh r7, [r7]
	cmp r3, r7
	bge _08028DE6
	asrs r6, r2, #0x10
	lsls r0, r6, #2
	ldr r1, _08028E10 @ =gUnknown_03003340
	adds r0, r0, r1
	mov ip, r0
	mov r2, sb
	adds r2, #0x64
	ldr r5, _08028E14 @ =gUnknown_03003100
_08028D7E:
	lsls r0, r3, #0x10
	asrs r3, r0, #0x10
	mov r7, ip
	ldr r0, [r7]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _08028DD4
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrh r0, [r5]
	lsls r0, r0, #4
	strh r0, [r1]
	movs r7, #0
	ldrsh r1, [r2, r7]
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrh r0, [r5, #2]
	lsls r0, r0, #4
	strh r0, [r1, #2]
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrh r0, [r5]
	subs r0, r3, r0
	lsls r0, r0, #1
	strh r0, [r1, #4]
	movs r7, #0
	ldrsh r1, [r2, r7]
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrh r0, [r5, #2]
	subs r0, r6, r0
	lsls r0, r0, #1
	strh r0, [r1, #6]
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
_08028DD4:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	mov r7, sl
	ldr r1, [r7]
	ldrh r1, [r1]
	cmp r0, r1
	blt _08028D7E
_08028DE6:
	ldr r1, [sp]
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r1, r2
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	mov r3, r8
	ldrh r3, [r3, #2]
	cmp r0, r3
	blt _08028D60
_08028DFA:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08028E0C: .4byte gUnknown_08499590
_08028E10: .4byte gUnknown_03003340
_08028E14: .4byte gUnknown_03003100

