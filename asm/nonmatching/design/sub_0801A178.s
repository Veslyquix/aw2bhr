	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801A178
sub_0801A178: @ 0x0801A178
	adds r2, r0, #0
	ldrb r0, [r2]
	cmp r0, #0
	bne _0801A184
	movs r0, #0
	b _0801A19E
_0801A184:
	subs r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	ldrb r1, [r2, #3]
	subs r0, r0, r1
	ldrb r3, [r2, #4]
	cmp r0, r3
	bge _0801A19C
	cmp r1, #0
	beq _0801A19C
	subs r0, r1, #1
	strb r0, [r2, #3]
_0801A19C:
	movs r0, #1
_0801A19E:
	bx lr

