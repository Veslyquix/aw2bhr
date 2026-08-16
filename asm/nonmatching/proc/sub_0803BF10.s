	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803BF10
sub_0803BF10: @ 0x0803BF10
	ldr r3, _0803BF2C @ =gUnknown_03002F1C
	ldrh r0, [r3]
	cmp r0, #0
	beq _0803BF38
	ldr r0, _0803BF30 @ =gUnknown_0849ECDC
	ldr r2, [r0]
	ldrb r0, [r2, #1]
	adds r1, r0, #0
	cmp r1, #0
	beq _0803BF34
	subs r0, #1
	strb r0, [r2, #1]
	b _0803BF60
	.align 2, 0
_0803BF2C: .4byte gUnknown_03002F1C
_0803BF30: .4byte gUnknown_0849ECDC
_0803BF34:
	strh r1, [r3]
	b _0803BF60
_0803BF38:
	ldr r1, _0803BF64 @ =gUnknown_03003FC0
	ldr r2, _0803BF68 @ =gUnknown_0849ECDC
	ldr r0, [r2]
	ldrb r0, [r0, #1]
	adds r1, r1, r0
	adds r1, #0x3e
	ldr r0, _0803BF6C @ =gUnknown_020288B0
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, [r2]
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	ldr r1, [r2]
	ldrb r0, [r1, #1]
	ldrb r1, [r1]
	cmp r0, r1
	beq _0803BF60
	movs r0, #1
	strh r0, [r3]
_0803BF60:
	bx lr
	.align 2, 0
_0803BF64: .4byte gUnknown_03003FC0
_0803BF68: .4byte gUnknown_0849ECDC
_0803BF6C: .4byte gUnknown_020288B0

