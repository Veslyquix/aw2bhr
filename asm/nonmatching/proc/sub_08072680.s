	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072680
sub_08072680: @ 0x08072680
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	mov sl, r1
	ldr r0, [sp, #0x24]
	lsls r3, r3, #0x10
	lsrs r4, r3, #0x10
	adds r3, r2, #0
	adds r0, r3, r0
	cmp r3, r0
	bge _080726D8
	mov r8, r0
	mov r0, sl
	lsls r0, r0, #1
	mov ip, r0
_080726A4:
	mov r1, sl
	ldr r2, [sp, #0x20]
	adds r0, r1, r2
	adds r6, r3, #1
	cmp r1, r0
	bge _080726D2
	adds r5, r0, #0
	lsls r0, r3, #6
	add r0, sb
	mov r7, ip
	adds r2, r7, r0
_080726BA:
	cmp r1, #0x1f
	bhi _080726C4
	cmp r3, #0x1f
	bhi _080726C4
	strh r4, [r2]
_080726C4:
	adds r2, #2
	adds r1, #1
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r1, r5
	blt _080726BA
_080726D2:
	adds r3, r6, #0
	cmp r3, r8
	blt _080726A4
_080726D8:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

