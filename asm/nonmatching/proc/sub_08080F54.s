	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08080F54
sub_08080F54: @ 0x08080F54
	push {r4, lr}
	adds r2, r0, #0
	movs r1, #0
	ldr r3, _08080F74 @ =gUnknown_081D938C
	ldr r4, _08080F78 @ =gUnknown_081D9390
_08080F5E:
	ldr r0, [r3]
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, r2
	bne _08080F7C
	adds r0, r1, #4
	movs r1, #6
	bl DivRem
	ldr r1, [r4]
	b _08080F86
	.align 2, 0
_08080F74: .4byte gUnknown_081D938C
_08080F78: .4byte gUnknown_081D9390
_08080F7C:
	adds r1, #1
	cmp r1, #5
	ble _08080F5E
	ldr r1, [r4]
	movs r0, #4
_08080F86:
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

