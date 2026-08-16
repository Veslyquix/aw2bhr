	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08073CB8
sub_08073CB8: @ 0x08073CB8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	cmp r3, #0
	ble _08073CE8
	lsls r0, r7, #6
	mov sb, r0
	adds r4, r3, #0
	lsls r0, r7, #5
	mov r8, r0
_08073CD4:
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl sub_08073CF4
	add r6, sb
	add r5, r8
	subs r4, #1
	cmp r4, #0
	bne _08073CD4
_08073CE8:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

