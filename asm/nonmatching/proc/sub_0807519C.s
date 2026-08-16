	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807519C
sub_0807519C: @ 0x0807519C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x34
	ldrsh r1, [r5, r0]
	movs r0, #0x36
	ldrsh r2, [r5, r0]
	ldr r3, _08075200 @ =gUnknown_081CC4F0
	ldr r4, _08075204 @ =gUnknown_0861433C
	ldrh r0, [r5, #0x38]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	str r0, [sp]
	movs r0, #1
	bl sub_0801BEBC
	ldr r0, [r5, #0x2c]
	ldr r2, [r5, #0x30]
	cmp r0, r2
	beq _08075230
	ldrh r1, [r5, #0x3a]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08075228
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #0x34
	ldrsh r1, [r5, r0]
	lsls r0, r2, #3
	adds r0, r1, r0
	cmp r2, #4
	ble _080751E4
	subs r0, #0x28
_080751E4:
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	movs r1, #0x36
	ldrsh r0, [r5, r1]
	adds r1, r0, #0
	adds r1, #8
	ldr r0, [r5, #0x30]
	cmp r0, #4
	ble _08075208
	adds r0, r1, #0
	adds r0, #8
	lsls r0, r0, #0x10
	b _0807520A
	.align 2, 0
_08075200: .4byte gUnknown_081CC4F0
_08075204: .4byte gUnknown_0861433C
_08075208:
	lsls r0, r1, #0x10
_0807520A:
	asrs r3, r0, #0x10
	ldrh r0, [r5, #0x38]
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08075058
	ldr r2, [r5, #0x30]
	lsls r3, r2, #2
	adds r1, r5, #0
	adds r1, #0x3c
	adds r1, r1, r3
	str r0, [r1]
	adds r2, #1
	str r2, [r5, #0x30]
_08075228:
	ldr r1, [r5, #0x2c]
	ldr r0, [r5, #0x30]
	cmp r1, r0
	bne _0807523A
_08075230:
	movs r0, #0
	strh r0, [r5, #0x3a]
	adds r0, r5, #0
	bl Proc_Break
_0807523A:
	ldrh r0, [r5, #0x3a]
	adds r0, #1
	strh r0, [r5, #0x3a]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

