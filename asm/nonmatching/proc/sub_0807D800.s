	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807D800
sub_0807D800: @ 0x0807D800
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r6, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r6, r0
	bge _0807D856
	ldr r7, _0807D83C @ =gUnknown_030058E0
_0807D812:
	ldr r4, _0807D840 @ =gUnknown_030058D4
	adds r4, r6, r4
	adds r0, r5, #0
	adds r0, #0x52
	ldrh r0, [r0]
	ldr r2, _0807D844 @ =gUnknown_03005948
	ldr r1, [r5, #0x58]
	adds r1, r1, r2
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r5, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r7
	ldrb r1, [r4]
	ldrb r0, [r0]
	cmp r1, r0
	bne _0807D848
	movs r0, #0
	b _0807D858
	.align 2, 0
_0807D83C: .4byte gUnknown_030058E0
_0807D840: .4byte gUnknown_030058D4
_0807D844: .4byte gUnknown_03005948
_0807D848:
	adds r6, #1
	adds r0, r5, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r6, r0
	blt _0807D812
_0807D856:
	movs r0, #1
_0807D858:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

