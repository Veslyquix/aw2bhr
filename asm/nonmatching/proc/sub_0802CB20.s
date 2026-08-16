	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802CB20
sub_0802CB20: @ 0x0802CB20
	push {r4, r5, r6, lr}
	ldr r2, _0802CB80 @ =gUnknown_085D5ABC
	ldr r5, _0802CB84 @ =gUnknown_030040D8
	ldr r0, [r5]
	ldrb r1, [r0]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r3, [r0, #0xe]
	cmp r3, #1
	beq _0802CB7C
	ldr r0, _0802CB88 @ =gUnknown_08499590
	ldr r2, [r0]
	ldr r4, _0802CB8C @ =gUnknown_03003100
	ldrh r1, [r4, #2]
	lsls r1, r1, #1
	ldr r6, _0802CB90 @ =0x0000417A
	adds r0, r2, r6
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r1, [r4]
	adds r0, r0, r1
	adds r2, #0x12
	adds r2, r2, r0
	ldrb r0, [r2]
	cmp r0, #0
	bne _0802CB7C
	ldr r0, [r4]
	ldr r1, _0802CB94 @ =gUnknown_03003F24
	ldr r1, [r1]
	cmp r0, r1
	bne _0802CB7C
	cmp r3, #0
	beq _0802CB7C
	movs r0, #0xff
	bl sub_0801F838
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	ldr r2, [r5]
	bl sub_08020354
	bl sub_080413E8
	cmp r0, #0
	beq _0802CB98
_0802CB7C:
	movs r0, #1
	b _0802CB9A
	.align 2, 0
_0802CB80: .4byte gUnknown_085D5ABC
_0802CB84: .4byte gUnknown_030040D8
_0802CB88: .4byte gUnknown_08499590
_0802CB8C: .4byte gUnknown_03003100
_0802CB90: .4byte 0x0000417A
_0802CB94: .4byte gUnknown_03003F24
_0802CB98:
	movs r0, #2
_0802CB9A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

