	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080570C4
sub_080570C4: @ 0x080570C4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldrh r6, [r4]
	movs r7, #0
	b _08057100
_080570D2:
	movs r5, #0
	adds r0, r7, #1
	mov r8, r0
	b _080570F8
_080570DA:
	ldrh r1, [r4, #6]
	adds r1, r1, r5
	lsls r0, r7, #5
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r2, [r4, #8]
	adds r0, r6, #0
	movs r3, #0
	bl sub_08057110
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r5, #1
_080570F8:
	ldrh r0, [r4, #2]
	cmp r5, r0
	blt _080570DA
	mov r7, r8
_08057100:
	ldrh r0, [r4, #4]
	cmp r7, r0
	blt _080570D2
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

