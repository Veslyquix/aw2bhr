	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08035170
sub_08035170: @ 0x08035170
	push {r4, r5, lr}
	ldr r1, _080351A8 @ =gUnknown_08090E3C
	ldr r2, [r1]
	adds r0, r2, #0
	adds r0, #0x2c
	ldrb r4, [r0]
	adds r5, r1, #0
	cmp r4, #0
	beq _0803518C
	cmp r4, #0
	blt _0803518A
	cmp r4, #2
	ble _080351C0
_0803518A:
	movs r4, #0
_0803518C:
	ldr r0, [r5]
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #1
	bne _080351E8
	ldr r5, _080351AC @ =gUnknown_03004490
	ldrb r0, [r5, #2]
	bl sub_080129F8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080351B0
	movs r4, #1
	b _080351E8
	.align 2, 0
_080351A8: .4byte gUnknown_08090E3C
_080351AC: .4byte gUnknown_03004490
_080351B0:
	ldrb r0, [r5, #1]
	bl sub_080129F8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080351E8
	movs r4, #2
	b _080351E8
_080351C0:
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	cmp r1, #2
	beq _080351E8
	adds r0, r2, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r4, r0
	bne _080351D8
	cmp r1, #3
	beq _080351E8
_080351D8:
	bl sub_08035080
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080351E8
	ldr r0, [r5]
	adds r0, #0x2f
	ldrb r4, [r0]
_080351E8:
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1

