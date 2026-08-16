	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080307E0
sub_080307E0: @ 0x080307E0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08030828 @ =gUnknown_0849B018
	ldr r3, [r0]
	ldr r0, _0803082C @ =0x00001AAC
	adds r2, r3, r0
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r3, r0
	movs r1, #0x96
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xaf
	bne _08030830
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r3, r0
	movs r1, #0x98
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	str r0, [r4]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #3
	movs r1, #0x96
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r0, r3, r0
	b _08030832
	.align 2, 0
_08030828: .4byte gUnknown_0849B018
_0803082C: .4byte 0x00001AAC
_08030830:
	movs r0, #0
_08030832:
	pop {r4}
	pop {r1}
	bx r1

