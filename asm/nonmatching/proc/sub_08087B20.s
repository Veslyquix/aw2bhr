	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08087B20
sub_08087B20: @ 0x08087B20
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r7, r1, #0
	adds r4, r2, #0
	adds r6, r3, #0
	cmp r4, #0
	beq _08087B58
_08087B30:
	adds r0, r4, #0
	movs r1, #0xa
	bl DivRem
	adds r0, r6, r0
	movs r1, #2
	str r1, [sp]
	adds r1, r5, #0
	adds r2, r7, #0
	movs r3, #0
	bl sub_0801F34C
	adds r0, r4, #0
	movs r1, #0xa
	bl Div
	adds r4, r0, #0
	subs r5, #8
	cmp r4, #0
	bne _08087B30
_08087B58:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

