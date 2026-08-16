	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08053614
sub_08053614: @ 0x08053614
	push {r4, r5, lr}
	sub sp, #8
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq _08053654
	adds r0, r4, #0
	bl sub_080153F0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08053654
	mov r0, sp
	adds r1, r4, #0
	bl sub_08015638
	ldr r1, [sp]
	ldr r2, [sp, #4]
	movs r3, #3
	ands r3, r5
	lsls r3, r3, #0xa
	ldr r0, _0805365C @ =0xFFFFF3FF
	ands r0, r2
	adds r2, r0, #0
	orrs r2, r3
	adds r0, r4, #0
	bl sub_08015608
_08053654:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805365C: .4byte 0xFFFFF3FF

