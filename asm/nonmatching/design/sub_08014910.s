	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08014910
sub_08014910: @ 0x08014910
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	ldr r6, _08014968 @ =gUnknown_0200BC14
	lsls r4, r3, #1
	mov r8, r4
	adds r4, r4, r6
	movs r5, #0
	mov sb, r5
	mov r7, sb
	strh r7, [r4]
	lsls r4, r3, #2
	movs r7, #0x80
	lsls r7, r7, #3
	adds r5, r6, r7
	adds r4, r4, r5
	str r0, [r4]
	movs r4, #0x81
	lsls r4, r4, #3
	adds r6, r6, r4
	add r8, r6
	mov r5, r8
	strh r1, [r5]
	mov r7, sb
	str r7, [sp]
	bl sub_0801489C
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08014968: .4byte gUnknown_0200BC14

