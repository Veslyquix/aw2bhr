	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072344
sub_08072344: @ 0x08072344
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x58]
	ldr r3, [r1, #0x54]
	adds r2, r0, r3
	str r2, [r1, #0x58]
	ldr r0, [r1, #0x5c]
	adds r0, r0, r3
	str r0, [r1, #0x5c]
	cmp r2, #0xf
	bgt _08072362
	cmp r0, r3
	beq _08072368
	movs r0, #1
	b _0807238E
_08072362:
	adds r0, r2, #0
	subs r0, #0x10
	str r0, [r1, #0x58]
_08072368:
	ldr r1, [r1, #0x5c]
	ldr r0, _08072384 @ =0x000001FF
	cmp r1, r0
	bgt _0807238C
	bl sub_080718F0
	ldr r1, _08072388 @ =gUnknown_030020C0
	movs r0, #0
	strh r0, [r1]
	bl sub_080135A4
	movs r0, #1
	b _0807238E
	.align 2, 0
_08072384: .4byte 0x000001FF
_08072388: .4byte gUnknown_030020C0
_0807238C:
	movs r0, #0
_0807238E:
	pop {r1}
	bx r1
	.align 2, 0

