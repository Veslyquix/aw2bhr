	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08020634
sub_08020634: @ 0x08020634
	push {r4, lr}
	sub sp, #0x14
	adds r3, r0, #0
	adds r2, r1, #0
	movs r4, #0
	cmp r2, r3
	beq _08020652
_08020642:
	mov r0, sp
	adds r1, r0, r4
	subs r2, #1
	ldrb r0, [r2]
	strb r0, [r1]
	adds r4, #1
	cmp r2, r3
	bne _08020642
_08020652:
	mov r0, sp
	adds r1, r0, r4
	movs r0, #4
	strb r0, [r1]
	mov r0, sp
	ldrb r0, [r0]
	strb r0, [r3]
	movs r4, #1
	b _08020670
_08020664:
	adds r3, #1
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	strb r0, [r3]
	adds r4, #1
_08020670:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bne _08020664
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0

