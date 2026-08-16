	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08026A48
sub_08026A48: @ 0x08026A48
	push {r4, r5, r6, lr}
	ldr r0, _08026A80 @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	cmp r0, #2
	bgt _08026A7A
	cmp r0, #1
	blt _08026A7A
	movs r4, #1
	ldr r6, _08026A84 @ =gUnknown_08090A80
	movs r5, #0x3c
_08026A5C:
	adds r0, r4, #0
	bl sub_08042DFC
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08026AC0
	ldr r1, [r6]
	ldr r1, [r1]
	adds r1, r5, r1
	strb r0, [r1, #0x1a]
	adds r5, #0x3c
	adds r4, #1
	cmp r4, #4
	ble _08026A5C
_08026A7A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08026A80: .4byte gUnknown_03003FC0
_08026A84: .4byte gUnknown_08090A80

