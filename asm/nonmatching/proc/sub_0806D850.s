	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806D850
sub_0806D850: @ 0x0806D850
	push {r4, r5, lr}
	ldr r5, _0806D8B0 @ =gUnknown_0816E1A4
	ldr r4, [r5]
	ldr r0, [r4]
	ldr r1, _0806D8B4 @ =gUnknown_0202F2C8
	ldrb r1, [r1]
	adds r0, #0x2c
	strb r1, [r0]
	ldr r0, [r4]
	bl sub_0803BFBC
	bl sub_0806D8B8
	ldr r0, [r4]
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _0806D87A
	adds r2, r0, #0
_0806D874:
	subs r2, #1
	cmp r2, #0
	bne _0806D874
_0806D87A:
	ldr r1, [r5]
	ldr r0, [r1]
	adds r0, #0x30
	movs r2, #0
	strb r2, [r0]
	ldr r0, [r1]
	adds r0, #0x33
	strb r2, [r0]
	adds r4, r1, #0
	movs r3, #0xff
	movs r2, #7
_0806D890:
	ldr r1, [r4]
	adds r1, #0x32
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	subs r2, #1
	cmp r2, #0
	bge _0806D890
	ldr r0, [r5]
	ldr r0, [r0]
	adds r0, #0x2d
	movs r1, #0
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806D8B0: .4byte gUnknown_0816E1A4
_0806D8B4: .4byte gUnknown_0202F2C8

