	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802CF94
sub_0802CF94: @ 0x0802CF94
	push {lr}
	ldr r1, _0802CFA8 @ =gUnknown_08090C00
	ldr r0, [r1]
	adds r2, r0, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	cmp r0, #1
	bls _0802CFAC
	movs r0, #0
	b _0802CFAE
	.align 2, 0
_0802CFA8: .4byte gUnknown_08090C00
_0802CFAC:
	adds r0, #1
_0802CFAE:
	strb r0, [r2]
	ldr r0, [r1]
	adds r0, #0x2c
	ldrb r0, [r0]
	bl sub_08035020
	pop {r0}
	bx r0
	.align 2, 0

