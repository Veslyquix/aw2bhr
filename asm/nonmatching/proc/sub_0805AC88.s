	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805AC88
sub_0805AC88: @ 0x0805AC88
	push {r4, lr}
	movs r2, #0
	ldr r4, _0805ACA4 @ =gUnknown_03004730
	movs r3, #0
_0805AC90:
	adds r0, r2, r4
	ldrb r1, [r0]
	strb r3, [r0]
	adds r2, #1
	cmp r2, #0x3f
	ble _0805AC90
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805ACA4: .4byte gUnknown_03004730

