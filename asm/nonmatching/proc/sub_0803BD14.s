	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803BD14
sub_0803BD14: @ 0x0803BD14
	push {r4, lr}
	movs r3, #0
	ldr r2, _0803BD4C @ =gUnknown_085C77A0
	ldr r4, _0803BD50 @ =gUnknown_03003FC0
	ldrb r1, [r4, #2]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r2, #0x3c
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0803BD42
	movs r1, #0x5c
_0803BD2E:
	adds r3, #1
	cmp r3, #3
	bgt _0803BD42
	ldrb r0, [r4, #2]
	muls r0, r1, r0
	adds r0, r3, r0
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0803BD2E
_0803BD42:
	adds r0, r3, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803BD4C: .4byte gUnknown_085C77A0
_0803BD50: .4byte gUnknown_03003FC0

