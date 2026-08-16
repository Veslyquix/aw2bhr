	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080275B4
sub_080275B4: @ 0x080275B4
	push {r4, lr}
	ldr r0, _08027604 @ =gUnknown_08090A9C
	ldr r3, [r0]
	ldr r2, [r3, #4]
	adds r4, r0, #0
	cmp r2, #3
	bgt _080275E0
	movs r0, #1
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x57
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	subs r0, r2, r0
	str r0, [r3, #4]
	movs r1, #0x56
	rsbs r1, r1, #0
	cmp r0, r1
	bgt _080275E0
	movs r0, #0xfa
	str r0, [r3, #4]
_080275E0:
	ldr r3, [r4]
	ldr r2, [r3, #4]
	cmp r2, #0xad
	ble _080275FE
	adds r0, r2, #0
	subs r0, #0xad
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	subs r0, r2, r0
	str r0, [r3, #4]
	cmp r0, #0xae
	bgt _080275FE
	movs r0, #0xad
	str r0, [r3, #4]
_080275FE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08027604: .4byte gUnknown_08090A9C

