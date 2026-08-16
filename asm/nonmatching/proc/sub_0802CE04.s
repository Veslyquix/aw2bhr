	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802CE04
sub_0802CE04: @ 0x0802CE04
	push {r4, lr}
	ldr r3, _0802CE20 @ =gUnknown_08090BF4
	ldr r1, [r3]
	ldrb r2, [r1, #0xc]
	movs r0, #1
	subs r0, r0, r2
	strb r0, [r1, #0xc]
	ldrb r0, [r1, #0xc]
	adds r4, r3, #0
	cmp r0, #0
	beq _0802CE24
	cmp r0, #1
	beq _0802CE2A
	b _0802CE32
	.align 2, 0
_0802CE20: .4byte gUnknown_08090BF4
_0802CE24:
	bl sub_0803B5E8
	b _0802CE32
_0802CE2A:
	ldr r0, _0802CE4C @ =gUnknown_030033EC
	ldrb r0, [r0]
	bl sub_08043DAC
_0802CE32:
	bl sub_08019E68
	ldr r2, _0802CE50 @ =gUnknown_0200C420
	movs r1, #0
	ldr r0, [r4]
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _0802CE44
	movs r1, #1
_0802CE44:
	strb r1, [r2, #0x14]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802CE4C: .4byte gUnknown_030033EC
_0802CE50: .4byte gUnknown_0200C420

