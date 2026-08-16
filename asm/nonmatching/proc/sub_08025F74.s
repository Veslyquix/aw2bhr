	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08025F74
sub_08025F74: @ 0x08025F74
	push {r4, lr}
	adds r3, r0, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	ldr r1, _08025FB4 @ =gUnknown_085D5ABC
	ldrb r2, [r3]
	movs r0, #0x5c
	muls r0, r2, r0
	adds r1, #0x14
	adds r0, r0, r1
	ldr r1, [r0]
	cmp r1, #0
	beq _08025FB0
	adds r0, r1, #1
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _08025FB0
	ldrb r0, [r1]
	adds r1, r0, #0
	cmp r1, #2
	bne _08025FA6
	ldrb r0, [r3, #8]
	cmp r0, #0
	bne _08025FB0
_08025FA6:
	cmp r1, #1
	bne _08025FB8
	ldrb r0, [r3, #7]
	cmp r0, #0
	beq _08025FB8
_08025FB0:
	movs r0, #0
	b _08025FBA
	.align 2, 0
_08025FB4: .4byte gUnknown_085D5ABC
_08025FB8:
	movs r0, #1
_08025FBA:
	pop {r4}
	pop {r1}
	bx r1

