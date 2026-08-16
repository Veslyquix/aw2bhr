	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08073998
sub_08073998: @ 0x08073998
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r3, #0
	cmp r4, r6
	ble _080739B4
	adds r1, r2, #0
	adds r2, r5, #0
	adds r5, r1, #0
	adds r1, r6, #0
	adds r6, r4, #0
	adds r4, r1, #0
_080739B4:
	subs r0, r2, r5
	lsls r0, r0, #0x10
	subs r1, r6, r4
	bl __divsi3
	adds r7, r0, #0
	lsls r5, r5, #0x10
	cmp r6, #0xa0
	ble _080739C8
	movs r6, #0xa0
_080739C8:
	cmp r4, #0
	bge _080739D4
	rsbs r0, r4, #0
	muls r0, r7, r0
	adds r5, r5, r0
	movs r4, #0
_080739D4:
	cmp r4, r6
	bge _080739F2
	ldr r0, _080739FC @ =gUnknown_0202FDE0
	mov r8, r0
_080739DC:
	asrs r0, r5, #0x10
	mov r1, r8
	ldr r3, [r1]
	adds r1, r4, #0
	ldr r2, [sp, #0x18]
	bl sub_08073974
	adds r5, r5, r7
	adds r4, #1
	cmp r4, r6
	blt _080739DC
_080739F2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080739FC: .4byte gUnknown_0202FDE0

