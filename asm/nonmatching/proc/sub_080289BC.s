	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080289BC
sub_080289BC: @ 0x080289BC
	push {lr}
	adds r2, r0, #0
	ldr r0, _080289EC @ =gUnknown_08499598
	ldr r1, [r0]
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0x1b]
	cmp r0, #1
	bne _080289F4
	ldr r0, _080289F0 @ =gUnknown_03003FC0
	ldrb r1, [r0, #4]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080289F4
	adds r0, r2, #0
	bl sub_080271CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080289F6
	.align 2, 0
_080289EC: .4byte gUnknown_08499598
_080289F0: .4byte gUnknown_03003FC0
_080289F4:
	movs r0, #1
_080289F6:
	pop {r1}
	bx r1
	.align 2, 0

