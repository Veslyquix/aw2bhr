	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080409E8
sub_080409E8: @ 0x080409E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	adds r4, r1, #0
	str r2, [sp]
	str r3, [sp, #4]
	lsls r1, r0, #4
	ldr r0, _08040AE8 @ =gUnknown_08499590
	mov sl, r0
	ldr r2, [r0]
	movs r3, #4
	ldrsh r0, [r2, r3]
	subs r1, r1, r0
	adds r6, r1, #0
	adds r6, #8
	lsls r0, r4, #4
	movs r3, #6
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r7, r0, #0
	adds r7, #0x10
	cmp r6, #0x1f
	bgt _08040A20
	movs r6, #0x20
_08040A20:
	cmp r6, #0xd0
	ble _08040A26
	movs r6, #0xd0
_08040A26:
	cmp r7, #0x4f
	bgt _08040A2C
	movs r7, #0x50
_08040A2C:
	cmp r7, #0xa0
	ble _08040A32
	movs r7, #0xa0
_08040A32:
	ldr r0, _08040AEC @ =gUnknown_0849FD84
	movs r1, #3
	bl Proc_Start
	adds r2, r0, #0
	strh r6, [r2, #0x3c]
	strh r7, [r2, #0x3e]
	adds r0, #0x48
	mov r1, sp
	ldrb r1, [r1]
	strb r1, [r0]
	adds r0, #1
	mov r3, sp
	ldrb r3, [r3, #4]
	strb r3, [r0]
	subs r0, #5
	add r1, sp, #0x28
	ldrb r1, [r1]
	strb r1, [r0]
	mov r3, sl
	ldr r1, [r3]
	lsls r5, r4, #1
	ldr r4, _08040AF0 @ =0x0000417A
	adds r0, r1, r4
	adds r0, r0, r5
	ldrh r0, [r0]
	add r0, r8
	ldr r3, _08040AF4 @ =0x00001432
	mov sb, r3
	add r1, sb
	adds r1, r1, r0
	ldrb r1, [r1]
	movs r0, #0x1f
	ands r0, r1
	ldr r3, [sp, #0x28]
	lsls r1, r3, #5
	orrs r0, r1
	adds r1, r2, #0
	adds r1, #0x4a
	strb r0, [r1]
	ldr r0, _08040AF8 @ =gUnknown_0849FD44
	adds r1, r2, #0
	bl Proc_Start
	adds r3, r0, #0
	strh r6, [r3, #0x3c]
	strh r7, [r3, #0x3e]
	adds r0, #0x48
	mov r1, sp
	ldrb r1, [r1]
	strb r1, [r0]
	adds r0, #1
	mov r2, sp
	ldrb r2, [r2, #4]
	strb r2, [r0]
	subs r0, #5
	add r1, sp, #0x28
	ldrb r1, [r1]
	strb r1, [r0]
	mov r2, sl
	ldr r1, [r2]
	adds r0, r1, r4
	adds r0, r0, r5
	ldrh r0, [r0]
	add r0, r8
	add r1, sb
	adds r1, r1, r0
	ldrb r0, [r1]
	lsrs r0, r0, #5
	adds r1, r3, #0
	adds r1, #0x45
	strb r0, [r1]
	ldr r1, [r2]
	adds r4, r1, r4
	adds r4, r4, r5
	ldrh r0, [r4]
	add r0, r8
	add r1, sb
	adds r1, r1, r0
	ldrb r1, [r1]
	adds r0, r3, #0
	adds r0, #0x4a
	strb r1, [r0]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040AE8: .4byte gUnknown_08499590
_08040AEC: .4byte gUnknown_0849FD84
_08040AF0: .4byte 0x0000417A
_08040AF4: .4byte 0x00001432
_08040AF8: .4byte gUnknown_0849FD44

