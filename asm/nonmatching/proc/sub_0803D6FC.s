	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803D6FC
sub_0803D6FC: @ 0x0803D6FC
	push {r4, lr}
	movs r2, #0
	ldr r4, _0803D71C @ =gUnknown_030040F8
	ldr r1, _0803D720 @ =0x000004C4
	adds r3, r0, r1
_0803D706:
	adds r0, r2, r4
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #4
	ble _0803D706
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803D71C: .4byte gUnknown_030040F8
_0803D720: .4byte 0x000004C4

