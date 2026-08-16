	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08071948
sub_08071948: @ 0x08071948
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r5, r1, #0
	mov ip, r2
	ldr r0, [sp, #0x18]
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r2, r3, #2
	movs r1, #0xff
	ldr r0, [r3]
	ldrb r7, [r3]
	lsrs r3, r0, #8
	ands r3, r1
	lsls r1, r3, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0
	blt _080719B0
_0807196E:
	asrs r0, r1, #0x10
	add r0, ip
	lsls r4, r3, #0x10
	cmp r0, #0x1f
	bhi _080719A4
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	mov r3, r8
	adds r1, r3, r0
	lsls r3, r7, #0x10
	asrs r0, r3, #0x10
	cmp r0, #0
	blt _080719A4
_0807198A:
	asrs r3, r3, #0x10
	adds r0, r5, r3
	cmp r0, #0x1f
	bhi _08071998
	ldrh r0, [r2]
	adds r0, r6, r0
	strh r0, [r1]
_08071998:
	subs r0, r3, #1
	adds r2, #2
	adds r1, #2
	lsls r3, r0, #0x10
	cmp r3, #0
	bge _0807198A
_080719A4:
	ldr r1, _080719BC @ =0xFFFF0000
	adds r0, r4, r1
	lsrs r3, r0, #0x10
	lsls r1, r3, #0x10
	cmp r1, #0
	bge _0807196E
_080719B0:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080719BC: .4byte 0xFFFF0000

