	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803DF54
sub_0803DF54: @ 0x0803DF54
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r7, r1, #0
	bl sub_0803DE94
	adds r4, r0, #0
	cmp r4, #0
	beq _0803DF8E
	mov r6, sp
	adds r0, r4, #0
	mov r1, sp
	bl sub_0803DFE0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803DF8E
	mov r0, sp
	ldrh r0, [r0]
	cmp r0, r5
	bne _0803DF8E
	ldrh r0, [r6, #2]
	cmp r0, r7
	bne _0803DF8E
	ldrb r0, [r4, #4]
	cmp r0, #0
	beq _0803DF8E
	adds r0, r4, #0
	b _0803DF90
_0803DF8E:
	movs r0, #0
_0803DF90:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

