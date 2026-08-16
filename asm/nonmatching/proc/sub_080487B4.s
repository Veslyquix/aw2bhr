	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080487B4
sub_080487B4: @ 0x080487B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	mov r8, r1
	adds r7, r2, #0
	ldr r5, [sp, #0x28]
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r1, _08048848 @ =gUnknown_0849EDB0
	mov sb, r1
	lsls r4, r3, #1
	adds r4, r4, r3
	lsls r4, r4, #3
	adds r2, r4, #0
	add r2, sb
	mov sl, r2
	ldrb r0, [r2]
	mov r3, r8
	lsls r1, r3, #5
	adds r1, r1, r6
	lsls r1, r1, #1
	adds r1, r7, r1
	bl sub_0801F2AC
	adds r0, r6, #2
	ldr r2, _0804884C @ =gUnknown_08610A38
	mov r3, sl
	ldrh r1, [r3, #2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r3, [r1]
	lsls r5, r5, #0x1c
	lsrs r5, r5, #0x10
	str r5, [sp]
	movs r1, #0
	mov sl, r1
	str r1, [sp, #4]
	mov r1, r8
	adds r2, r7, #0
	bl sub_080149C0
	adds r6, #0xe
	movs r2, #4
	add sb, r2
	add r4, sb
	ldr r3, [r4]
	str r5, [sp]
	mov r0, sl
	str r0, [sp, #4]
	adds r0, r6, #0
	mov r1, r8
	adds r2, r7, #0
	bl sub_08014B0C
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08048848: .4byte gUnknown_0849EDB0
_0804884C: .4byte gUnknown_08610A38

