	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08042864
sub_08042864: @ 0x08042864
	push {r4, r5, lr}
	ldr r4, _080428A0 @ =gUnknown_08499594
	ldr r0, _080428A4 @ =gUnknown_08499590
	ldr r2, [r0]
	ldr r3, _080428A8 @ =gUnknown_03003100
	ldrh r1, [r3, #2]
	lsls r1, r1, #1
	ldr r5, _080428AC @ =0x0000417A
	adds r0, r2, r5
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r1, [r3]
	adds r0, r0, r1
	adds r2, #0x12
	adds r2, r2, r0
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r4]
	adds r4, r1, r0
	bl sub_080424BC
	ldrb r0, [r4, #7]
	cmp r0, #0
	beq _080428B4
	ldr r0, _080428B0 @ =gUnknown_03003F38
	ldrb r0, [r0]
	strb r0, [r4, #8]
	b _080428BA
	.align 2, 0
_080428A0: .4byte gUnknown_08499594
_080428A4: .4byte gUnknown_08499590
_080428A8: .4byte gUnknown_03003100
_080428AC: .4byte 0x0000417A
_080428B0: .4byte gUnknown_03003F38
_080428B4:
	ldr r0, _080428E8 @ =gUnknown_03003F38
	ldrb r0, [r0]
	strb r0, [r4, #7]
_080428BA:
	ldr r3, _080428EC @ =gUnknown_030040D8
	ldr r2, [r3]
	ldrb r1, [r2, #1]
	movs r0, #8
	orrs r0, r1
	strb r0, [r2, #1]
	ldrb r1, [r4, #1]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r4, #1]
	ldr r0, [r3]
	ldrb r0, [r0]
	cmp r0, #2
	bgt _080428E0
	cmp r0, #1
	blt _080428E0
	movs r0, #0x4f
	bl sub_0803B4DC
_080428E0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080428E8: .4byte gUnknown_03003F38
_080428EC: .4byte gUnknown_030040D8

