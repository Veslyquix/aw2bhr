	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803550C
sub_0803550C: @ 0x0803550C
	push {lr}
	ldr r0, _08035524 @ =gUnknown_03003FC0
	adds r0, #0x2c
	ldrb r0, [r0]
	cmp r0, #1
	beq _08035528
	cmp r0, #1
	ble _08035532
	cmp r0, #2
	beq _0803552E
	b _08035532
	.align 2, 0
_08035524: .4byte gUnknown_03003FC0
_08035528:
	bl sub_080352B4
	b _08035532
_0803552E:
	bl sub_080353E8
_08035532:
	pop {r0}
	bx r0
	.align 2, 0

