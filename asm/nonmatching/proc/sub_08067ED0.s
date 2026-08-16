	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067ED0
sub_08067ED0: @ 0x08067ED0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	adds r4, r1, #0
	mov sb, r2
	mov sl, r3
	ldr r6, [sp, #0x28]
	ldr r0, [sp, #0x2c]
	mov r8, r0
	ldr r7, [sp, #0x30]
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r3, r8
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r8, r3
	ldr r1, _08067F54 @ =gUnknown_08581104
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	bl sub_08043BC8
	adds r0, r4, #0
	movs r1, #0x12
	bl sub_08043AA0
	ldr r0, _08067F58 @ =gUnknown_08581108
	adds r1, r7, #0
	bl Proc_Start
	adds r2, r0, #0
	adds r0, #0x2a
	movs r1, #0
	strb r5, [r0]
	subs r0, #1
	strb r4, [r0]
	mov r0, sb
	str r0, [r2, #0x2c]
	mov r3, sl
	str r3, [r2, #0x30]
	ldr r0, [sp, #0x20]
	str r0, [r2, #0x34]
	ldr r3, [sp, #0x24]
	str r3, [r2, #0x38]
	adds r0, r2, #0
	adds r0, #0x3c
	strb r6, [r0]
	adds r0, #1
	mov r3, r8
	strb r3, [r0]
	str r1, [r2, #0x40]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08067F54: .4byte gUnknown_08581104
_08067F58: .4byte gUnknown_08581108

