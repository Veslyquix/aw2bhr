	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803E388
sub_0803E388: @ 0x0803E388
	push {r4, r5, lr}
	adds r2, r0, #0
	movs r4, #0
	ldr r3, _0803E398 @ =gUnknown_02028360
	ldrh r1, [r3, #2]
	movs r5, #0xf0
	lsls r5, r5, #2
	b _0803E3C0
	.align 2, 0
_0803E398: .4byte gUnknown_02028360
_0803E39C:
	lsls r0, r1, #0x16
	lsrs r0, r0, #0x1c
	cmp r0, r2
	bne _0803E3BC
	cmp r2, #1
	beq _0803E3B4
	cmp r2, #1
	blt _0803E3BA
	cmp r2, #5
	bgt _0803E3BA
	cmp r2, #3
	blt _0803E3BA
_0803E3B4:
	ldrb r0, [r3, #4]
	cmp r0, #0
	beq _0803E3BC
_0803E3BA:
	adds r4, #1
_0803E3BC:
	adds r3, #8
	ldrh r1, [r3, #2]
_0803E3C0:
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _0803E39C
	cmp r4, #0
	bne _0803E3D0
	movs r0, #0
	b _0803E3D2
_0803E3D0:
	movs r0, #1
_0803E3D2:
	pop {r4, r5}
	pop {r1}
	bx r1

