	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080438FC
sub_080438FC: @ 0x080438FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	mov r8, r0
	adds r6, r1, #0
	adds r4, r2, #0
	ldr r0, _080439A0 @ =gUnknown_08499598
	ldr r1, [r0]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0, #0x20]
	str r0, [sp, #0x18]
	adds r0, r4, #0
	bl sub_080441D4
	adds r5, r0, #0
	adds r0, r4, #0
	bl sub_08044208
	subs r0, r0, r5
	mov sb, r0
	adds r0, r4, #0
	bl sub_0804419C
	mov sl, r0
	ldr r0, _080439A4 @ =gUnknown_03004008
	ldr r0, [r0]
	str r0, [sp, #0x1c]
	mov r0, r8
	str r0, [sp, #0x10]
	adds r6, #0x18
	str r6, [sp, #0x14]
	add r6, sp, #0x14
	add r7, sp, #0x18
	str r5, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r1, #0
	ldr r0, [sp, #0x18]
	cmp r0, r5
	blt _0804395A
	movs r1, #1
_0804395A:
	str r1, [sp, #8]
	add r4, sp, #0x1c
	str r4, [sp, #0xc]
	add r0, sp, #0x10
	adds r1, r6, #0
	adds r2, r7, #0
	mov r3, sl
	bl sub_080439A8
	mov r0, sb
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r1, #0
	ldr r0, [sp, #0x18]
	cmp r0, sb
	blt _0804397E
	movs r1, #1
_0804397E:
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	add r0, sp, #0x10
	adds r1, r6, #0
	adds r2, r7, #0
	mov r3, sl
	bl sub_080439A8
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080439A0: .4byte gUnknown_08499598
_080439A4: .4byte gUnknown_03004008

