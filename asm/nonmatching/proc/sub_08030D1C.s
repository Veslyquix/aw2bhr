	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08030D1C
sub_08030D1C: @ 0x08030D1C
	push {lr}
	bl sub_0802EB28
	ldr r2, _08030D40 @ =gUnknown_0849B018
	ldr r1, [r2]
	ldrb r3, [r1, #6]
	strb r0, [r1, #6]
	ldr r0, [r2]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _08030D44
	movs r0, #1
	b _08030D46
	.align 2, 0
_08030D40: .4byte gUnknown_0849B018
_08030D44:
	movs r0, #0
_08030D46:
	pop {r1}
	bx r1
	.align 2, 0

