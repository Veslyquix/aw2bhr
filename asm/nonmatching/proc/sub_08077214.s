	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08077214
sub_08077214: @ 0x08077214
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov r8, r0
	adds r5, r1, #0
	adds r4, r2, #0
	adds r6, r3, #0
	ldr r2, [sp, #0x28]
	ldr r1, [sp, #0x2c]
	ldr r0, [sp, #0x30]
	lsls r2, r2, #0x10
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	cmp r2, r1
	beq _0807727C
	bl sub_08014878
	lsls r5, r5, #0x10
	lsrs r1, r5, #0x10
	lsls r4, r4, #0x10
	lsrs r2, r4, #0x10
	lsls r3, r6, #0x10
	lsrs r3, r3, #0x10
	ldr r0, [sp, #0x24]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	movs r6, #0
	str r6, [sp, #4]
	mov r0, r8
	bl sub_08012BC8
	asrs r5, r5, #0x10
	asrs r4, r4, #0x10
	str r6, [sp]
	movs r0, #0xa0
	lsls r0, r0, #2
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, r8
	adds r3, r7, #0
	bl sub_08014740
	adds r0, #0x3a
	mov r1, sb
	strb r1, [r0]
_0807727C:
	adds r0, r7, #0
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

