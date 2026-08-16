	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802F4A0
sub_0802F4A0: @ 0x0802F4A0
	push {r4, lr}
	movs r2, #0
	movs r1, #0
	ldr r4, _0802F4E8 @ =gUnknown_08090C78
	ldr r0, [r4]
	ldr r0, [r0]
	adds r3, r0, #0
	adds r3, #0xa
_0802F4B0:
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #5
	bne _0802F4BA
	adds r2, #1
_0802F4BA:
	adds r1, #1
	cmp r1, #3
	ble _0802F4B0
	ldr r0, [r4]
	ldr r1, [r0]
	ldrb r0, [r1, #9]
	cmp r0, #3
	bne _0802F4CE
	cmp r2, #2
	beq _0802F4E2
_0802F4CE:
	ldrb r0, [r1, #9]
	cmp r0, #7
	bne _0802F4D8
	cmp r2, #3
	beq _0802F4E2
_0802F4D8:
	ldrb r0, [r1, #9]
	cmp r0, #0xf
	bne _0802F4EC
	cmp r2, #4
	bne _0802F4EC
_0802F4E2:
	movs r0, #1
	b _0802F4EE
	.align 2, 0
_0802F4E8: .4byte gUnknown_08090C78
_0802F4EC:
	movs r0, #0
_0802F4EE:
	pop {r4}
	pop {r1}
	bx r1

