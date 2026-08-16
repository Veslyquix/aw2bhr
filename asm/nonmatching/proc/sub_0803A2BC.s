	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803A2BC
sub_0803A2BC: @ 0x0803A2BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r1, #0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r4, r1, #0
	adds r4, #8
	adds r0, r4, #0
	lsrs r4, r0, #3
	ldr r0, _0803A330 @ =gUnknown_08499578
	mov sb, r0
	ldr r2, [r0]
	ldr r1, _0803A334 @ =gUnknown_085D5ABC
	mov sl, r1
	ldrb r0, [r6]
	movs r1, #0x5c
	mov r8, r1
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	add r0, sl
	ldrh r3, [r0, #2]
	movs r7, #0x80
	lsls r7, r7, #8
	str r7, [sp]
	movs r5, #0
	str r5, [sp, #4]
	adds r0, r4, #0
	movs r1, #7
	bl sub_08014A5C
	mov r0, sb
	ldr r2, [r0]
	ldrb r0, [r6]
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	add r0, sl
	ldrh r3, [r0, #4]
	str r7, [sp]
	str r5, [sp, #4]
	adds r0, r4, #0
	movs r1, #0xd
	bl sub_08014A5C
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803A330: .4byte gUnknown_08499578
_0803A334: .4byte gUnknown_085D5ABC

