	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801D78C
sub_0801D78C: @ 0x0801D78C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	ldr r2, [sp, #0x1c]
	ldr r1, [sp, #0x18]
	cmp r1, r2
	bgt _0801D7C6
	ldr r4, _0801D7BC @ =gUnknown_0200E440
_0801D7A0:
	movs r0, #0x4c
	muls r0, r1, r0
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #0
	bne _0801D7C0
	str r3, [sp]
	adds r0, r1, #0
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl sub_0801D6E8
	b _0801D7CA
	.align 2, 0
_0801D7BC: .4byte gUnknown_0200E440
_0801D7C0:
	adds r1, #1
	cmp r1, r2
	ble _0801D7A0
_0801D7C6:
	movs r0, #1
	rsbs r0, r0, #0
_0801D7CA:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

