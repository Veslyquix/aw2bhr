	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803AAC0
sub_0803AAC0: @ 0x0803AAC0
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r4, r0, #0
	adds r0, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsrs r0, r0, #0x19
	lsls r0, r0, #1
	adds r2, #0xac
	adds r0, r0, r2
	ldr r1, _0803AB34 @ =gUnknown_0849D89C
	mov sb, r1
	ldr r1, [r1]
	ldrb r1, [r1]
	ldr r3, _0803AB38 @ =gUnknown_0849E2F8
	lsls r5, r4, #2
	adds r5, r5, r3
	ldrh r2, [r5]
	adds r1, r1, r2
	adds r1, #1
	lsls r4, r4, #1
	adds r4, #1
	lsls r4, r4, #1
	adds r4, r4, r3
	ldrh r2, [r4]
	movs r3, #0
	mov r8, r3
	str r3, [sp]
	bl sub_0801F34C
	adds r6, #0xb2
	mov r1, sb
	ldr r0, [r1]
	ldrb r1, [r0]
	ldrh r0, [r5]
	adds r1, r1, r0
	adds r1, #1
	ldrh r2, [r4]
	mov r3, r8
	str r3, [sp]
	adds r0, r6, #0
	movs r3, #0
	bl sub_0801F34C
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803AB34: .4byte gUnknown_0849D89C
_0803AB38: .4byte gUnknown_0849E2F8

