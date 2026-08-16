	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804443C
sub_0804443C: @ 0x0804443C
	push {lr}
	adds r2, r0, #0
	ldrb r1, [r2, #1]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _08044454
	ldrb r0, [r2]
	bl sub_080432E0
	cmp r0, #6
	beq _08044458
_08044454:
	movs r0, #0
	b _0804445A
_08044458:
	movs r0, #1
_0804445A:
	pop {r1}
	bx r1
	.align 2, 0

