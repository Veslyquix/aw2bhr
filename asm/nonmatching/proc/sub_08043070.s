	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08043070
sub_08043070: @ 0x08043070
	push {r4, r5, r6, lr}
	ldr r6, [sp, #0x10]
	ldr r5, _080430A4 @ =gUnknown_085D5ABC
	movs r4, #0x1a
	muls r4, r6, r4
	adds r3, r3, r4
	movs r4, #0x5c
	muls r4, r2, r4
	adds r3, r3, r4
	adds r5, #0x1e
	adds r3, r3, r5
	ldrb r4, [r3]
	bl sub_080430B0
	adds r0, #0x64
	cmp r4, #0
	ble _080430A8
	muls r0, r4, r0
	movs r1, #0x64
	bl Div
	cmp r0, #0
	bne _080430AA
	movs r0, #1
	b _080430AA
	.align 2, 0
_080430A4: .4byte gUnknown_085D5ABC
_080430A8:
	movs r0, #0
_080430AA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

