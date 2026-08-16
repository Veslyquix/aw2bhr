	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08014D38
sub_08014D38: @ 0x08014D38
	push {r4, lr}
	adds r1, r0, #0
	movs r2, #0
	movs r3, #0
	ldrb r0, [r1]
	cmp r0, #0
	beq _08014D72
	ldr r4, _08014D58 @ =gUnknown_084C36E4
_08014D48:
	ldrb r0, [r1]
	cmp r0, #0xa
	bgt _08014D5C
	cmp r0, #9
	blt _08014D5C
	adds r2, #0x10
	adds r1, #2
	b _08014D6C
	.align 2, 0
_08014D58: .4byte gUnknown_084C36E4
_08014D5C:
	cmp r3, #0
	beq _08014D62
	adds r2, #1
_08014D62:
	adds r0, r0, r4
	ldrb r0, [r0]
	adds r2, r2, r0
	adds r1, #1
	movs r3, #1
_08014D6C:
	ldrb r0, [r1]
	cmp r0, #0
	bne _08014D48
_08014D72:
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

