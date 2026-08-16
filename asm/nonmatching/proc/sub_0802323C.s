	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802323C
sub_0802323C: @ 0x0802323C
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r2, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r5, sp
	adds r5, #6
	str r5, [sp]
	adds r2, r4, #0
	add r3, sp, #4
	bl sub_080230DC
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r5, r2]
	adds r2, r4, #0
	bl sub_08043418
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0

