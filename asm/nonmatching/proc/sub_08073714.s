	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08073714
sub_08073714: @ 0x08073714
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	ldr r2, _08073768 @ =gUnknown_0202FDE4
	ldr r0, _0807376C @ =gUnknown_0202F8DC
	str r0, [r2]
	adds r4, r5, #0
	movs r6, #0
	cmp r4, #0
	blt _0807375E
	mov r8, r2
	lsls r0, r4, #1
	subs r7, r0, #2
_08073730:
	asrs r1, r6, #1
	mov r0, r8
	ldr r2, [r0]
	adds r0, r4, #0
	bl sub_080736F4
	asrs r1, r4, #1
	mov r0, r8
	ldr r2, [r0]
	adds r0, r6, #0
	bl sub_080736F4
	adds r1, r5, #1
	lsls r0, r6, #1
	subs r5, r1, r0
	cmp r5, #0
	bge _08073758
	adds r5, r5, r7
	subs r7, #2
	subs r4, #1
_08073758:
	adds r6, #1
	cmp r4, r6
	bge _08073730
_0807375E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073768: .4byte gUnknown_0202FDE4
_0807376C: .4byte gUnknown_0202F8DC

