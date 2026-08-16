	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08044B28
sub_08044B28: @ 0x08044B28
	push {r4, r5, lr}
	ldr r5, _08044B90 @ =gUnknown_08499598
	ldr r4, [r5]
	lsls r3, r0, #4
	subs r3, r3, r0
	lsls r3, r3, #2
	adds r4, r3, r4
	strb r1, [r4, #0x1f]
	ldr r4, _08044B94 @ =gUnknown_085D3DD0
	ldr r0, [r5]
	adds r3, r3, r0
	ldrb r0, [r3, #0x1f]
	lsls r1, r0, #4
	adds r1, r1, r0
	ldrb r3, [r3, #0x1d]
	lsls r0, r3, #6
	adds r0, r0, r3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, #0x3c
	adds r0, r0, r4
	ldr r1, [r0]
	adds r0, r2, #0
	bl _call_via_r1
	ldr r3, _08044B98 @ =gUnknown_084A0090
	ldr r0, _08044B9C @ =gUnknown_030033EC
	ldrh r1, [r0]
	ldr r2, [r5]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #0x1f]
	subs r1, #1
	lsls r2, r1, #2
	adds r2, r2, r1
	ldrb r1, [r0, #0x1d]
	lsls r0, r1, #4
	adds r0, r0, r1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r3, #0x28
	adds r0, r0, r3
	ldr r1, [r0]
	movs r0, #0
	bl _call_via_r1
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08044B90: .4byte gUnknown_08499598
_08044B94: .4byte gUnknown_085D3DD0
_08044B98: .4byte gUnknown_084A0090
_08044B9C: .4byte gUnknown_030033EC

