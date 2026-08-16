	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806DD34
sub_0806DD34: @ 0x0806DD34
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r3, #0
	adds r4, #0x48
	ldrb r0, [r4]
	adds r1, r3, #0
	adds r1, #0x49
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x47
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806DD90
	ldr r2, _0806DD8C @ =gUnknown_0816E1B4
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0806DD68
	ldrb r0, [r4]
	cmp r0, #0
	beq _0806DD68
	subs r0, #1
	strb r0, [r4]
_0806DD68:
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x80
	ands r0, r1
	adds r1, r3, #0
	adds r1, #0x48
	cmp r0, #0
	beq _0806DDDC
	ldrb r2, [r1]
	adds r0, r3, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	bge _0806DDDC
	b _0806DDD8
	.align 2, 0
_0806DD8C: .4byte gUnknown_0816E1B4
_0806DD90:
	ldr r2, _0806DDD4 @ =gUnknown_0816E1B4
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0806DDB0
	ldrb r0, [r4]
	cmp r0, #0
	bne _0806DDAC
	adds r0, r3, #0
	adds r0, #0x4b
	ldrb r0, [r0]
_0806DDAC:
	subs r0, #1
	strb r0, [r4]
_0806DDB0:
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x80
	ands r0, r1
	adds r1, r3, #0
	adds r1, #0x48
	cmp r0, #0
	beq _0806DDDC
	ldrb r2, [r1]
	adds r0, r3, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	bne _0806DDD8
	movs r0, #0
	b _0806DDDA
	.align 2, 0
_0806DDD4: .4byte gUnknown_0816E1B4
_0806DDD8:
	adds r0, r2, #1
_0806DDDA:
	strb r0, [r1]
_0806DDDC:
	adds r0, r3, #0
	adds r0, #0x49
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _0806DDEE
	movs r0, #0x64
	bl sub_0803B4DC
_0806DDEE:
	pop {r4}
	pop {r0}
	bx r0

