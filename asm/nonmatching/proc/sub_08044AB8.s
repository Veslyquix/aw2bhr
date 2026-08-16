	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08044AB8
sub_08044AB8: @ 0x08044AB8
	push {r4, r5, lr}
	ldr r1, _08044B00 @ =gUnknown_08499598
	ldr r2, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r3, [r1, #0x1d]
	ldrb r0, [r1, #0x1f]
	ldr r4, _08044B04 @ =gUnknown_084A0090
	subs r0, #1
	lsls r2, r0, #2
	adds r2, r2, r0
	lsls r1, r3, #4
	adds r1, r1, r3
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrb r0, [r1, #0x1c]
	ldrb r4, [r1, #0x1d]
	bl sub_08043A80
	adds r5, r0, #0
	adds r0, r4, #0
	bl sub_08043A90
	adds r1, r0, #0
	movs r2, #0xe5
	lsls r2, r2, #1
	adds r0, r5, #0
	movs r3, #5
	bl sub_08039A5C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08044B00: .4byte gUnknown_08499598
_08044B04: .4byte gUnknown_084A0090

