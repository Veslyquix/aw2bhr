	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08044D70
sub_08044D70: @ 0x08044D70
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	mov sb, r1
	mov sl, r2
	adds r5, r3, #0
	ldr r6, [sp, #0x20]
	ldr r7, [sp, #0x24]
	ldr r4, [sp, #0x2c]
	ldr r1, [sp, #0x30]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08044DCC @ =gUnknown_084A08EC
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r0, #0x2c
	strb r5, [r0]
	adds r0, #1
	strb r6, [r0]
	adds r0, #1
	strb r7, [r0]
	adds r0, #1
	add r2, sp, #0x28
	ldrb r2, [r2]
	strb r2, [r0]
	adds r0, #1
	strb r4, [r0]
	mov r0, r8
	bl Proc_Start
	mov r3, sb
	str r3, [r0, #0x4c]
	mov r1, sl
	str r1, [r0, #0x50]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044DCC: .4byte gUnknown_084A08EC

