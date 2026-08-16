	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08004D28
sub_08004D28: @ 0x08004D28
	push {lr}
	ldr r0, _08004D44 @ =gUnknown_0200B0B0
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08004D5A
	cmp r0, #1
	bgt _08004D48
	cmp r0, #0
	beq _08004D4E
	b _08004D70
	.align 2, 0
_08004D44: .4byte gUnknown_0200B0B0
_08004D48:
	cmp r0, #2
	beq _08004D66
	b _08004D70
_08004D4E:
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_080055B8
	b _08004D70
_08004D5A:
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_08005634
	b _08004D70
_08004D66:
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_080056B0
_08004D70:
	pop {r0}
	bx r0

