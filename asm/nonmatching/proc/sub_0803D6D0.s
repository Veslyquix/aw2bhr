	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803D6D0
sub_0803D6D0: @ 0x0803D6D0
	push {r4, r5, lr}
	movs r2, #0
	ldr r5, _0803D6F4 @ =gUnknown_030040F8
	ldr r4, _0803D6F8 @ =gUnknown_08499598
	movs r3, #0
_0803D6DA:
	adds r0, r2, r5
	ldr r1, [r4]
	adds r1, r3, r1
	ldrb r1, [r1, #0x1a]
	strb r1, [r0]
	adds r3, #0x3c
	adds r2, #1
	cmp r2, #4
	ble _0803D6DA
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803D6F4: .4byte gUnknown_030040F8
_0803D6F8: .4byte gUnknown_08499598

