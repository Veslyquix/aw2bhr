	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08074A28
sub_08074A28: @ 0x08074A28
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0x18
	ldr r0, [r5, #0x2c]
	ldrb r4, [r0]
	ldr r0, _08074A94 @ =gUnknown_086142CC
	adds r1, r5, #0
	bl Proc_StartBlocking
	adds r2, r0, #0
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	strh r4, [r2, #0x2a]
	ldr r1, _08074A98 @ =gUnknown_08615194
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrh r1, [r0, #6]
	strh r1, [r2, #0x2c]
	ldrh r1, [r0, #8]
	strh r1, [r2, #0x2e]
	ldrb r1, [r0, #2]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08074A60
	movs r6, #0x28
_08074A60:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08074A6A
	movs r6, #0x38
_08074A6A:
	strh r6, [r2, #0x30]
	movs r0, #0
	str r0, [r2, #0x38]
	adds r0, r4, #0
	bl sub_08074754
	ldr r1, [r5, #0x2c]
	adds r0, r1, #1
	str r0, [r5, #0x2c]
	ldrb r1, [r1, #1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08074A9C
	adds r0, r5, #0
	bl Proc_Break
	b _08074AA4
	.align 2, 0
_08074A94: .4byte gUnknown_086142CC
_08074A98: .4byte gUnknown_08615194
_08074A9C:
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
_08074AA4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

