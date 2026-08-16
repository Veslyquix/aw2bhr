	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806E1B8
sub_0806E1B8: @ 0x0806E1B8
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r3, _0806E208 @ =gUnknown_0816E7F0
	movs r0, #0
	str r0, [sp]
	movs r1, #8
	movs r2, #0x10
	bl PutSprite
	ldr r0, [r5, #0x58]
	movs r1, #0xa
	bl DivRem
	adds r4, r0, #0
	ldr r0, [r5, #0x58]
	movs r1, #0xa
	bl Div
	ldr r5, _0806E20C @ =gUnknown_0816E7F8
	lsls r0, r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0x18
	movs r2, #8
	adds r3, r5, #0
	bl PutSprite
	lsls r4, r4, #1
	str r4, [sp]
	movs r0, #0
	movs r1, #0x20
	movs r2, #8
	adds r3, r5, #0
	bl PutSprite
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806E208: .4byte gUnknown_0816E7F0
_0806E20C: .4byte gUnknown_0816E7F8

