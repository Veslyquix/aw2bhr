	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080468D4
sub_080468D4: @ 0x080468D4
	push {lr}
	sub sp, #8
	ldr r1, _0804690C @ =gUnknown_08499578
	ldr r3, [r1]
	ldr r2, _08046910 @ =gUnknown_084C211C
	ldrb r1, [r2]
	lsls r1, r1, #3
	adds r0, r0, r1
	cmp r0, #0
	bge _080468EA
	adds r0, #7
_080468EA:
	lsls r1, r0, #0xd
	lsrs r1, r1, #0x10
	ldrb r2, [r2, #1]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r3, #8
	bl sub_08012BC8
	bl sub_08013AEC
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_0804690C: .4byte gUnknown_08499578
_08046910: .4byte gUnknown_084C211C

