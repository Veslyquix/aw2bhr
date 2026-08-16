	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080878A8
sub_080878A8: @ 0x080878A8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r1, _08087934 @ =gUnknown_02027F74
	adds r1, #4
	ldr r0, [r0, #0x54]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl sub_0802490C
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r5, #0
	subs r0, r6, #1
	cmp r5, r0
	bge _08087908
	subs r0, r6, #2
	lsls r0, r0, #5
	movs r1, #0x90
	mov r8, r1
	movs r7, #0xe0
	lsls r7, r7, #7
	rsbs r0, r0, #0
	adds r4, r0, #0
	adds r4, #0xd8
_080878DC:
	movs r0, #0x80
	lsls r0, r0, #5
	orrs r0, r4
	movs r2, #0x80
	lsls r2, r2, #3
	mov r1, r8
	orrs r2, r1
	orrs r2, r7
	movs r1, #0xa0
	movs r3, #6
	bl sub_0804402C
	movs r0, #0xc
	add r8, r0
	movs r1, #0x80
	lsls r1, r1, #5
	adds r7, r7, r1
	adds r4, #0x20
	adds r5, #1
	subs r0, r6, #1
	cmp r5, r0
	blt _080878DC
_08087908:
	movs r4, #2
	str r4, [sp]
	movs r0, #0x69
	movs r1, #0x26
	movs r2, #0x98
	movs r3, #0
	bl sub_0801F34C
	str r4, [sp]
	movs r0, #0x52
	movs r1, #0xd0
	movs r2, #0x88
	movs r3, #0
	bl sub_0801F34C
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087934: .4byte gUnknown_02027F74

