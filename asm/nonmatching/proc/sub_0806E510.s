	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806E510
sub_0806E510: @ 0x0806E510
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sb, r0
	movs r7, #0
	ldr r6, _0806E570 @ =gUnknown_08582A7C
	mov sl, r6
	movs r0, #0
	mov r8, r0
_0806E528:
	lsls r5, r7, #2
	ldr r0, [r6]
	mov r1, sl
	adds r1, #4
	add r1, r8
	ldr r1, [r1]
	mov r2, sl
	adds r2, #8
	add r2, r8
	ldr r2, [r2]
	ldrh r3, [r6, #0x10]
	ldr r4, [r6, #0xc]
	str r4, [sp]
	str r7, [sp, #4]
	mov r4, sb
	str r4, [sp, #8]
	bl sub_0806E4BC
	mov r1, sb
	adds r1, #0x3c
	adds r1, r1, r5
	str r0, [r1]
	adds r6, #0x14
	movs r0, #0x14
	add r8, r0
	adds r7, #1
	cmp r7, #5
	ble _0806E528
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E570: .4byte gUnknown_08582A7C

