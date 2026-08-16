	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08044560
sub_08044560: @ 0x08044560
	push {r4, r5, lr}
	ldr r4, _080445A0 @ =gUnknown_030033EC
	ldrh r1, [r4]
	ldr r5, _080445A4 @ =gUnknown_08499598
	ldr r2, [r5]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	movs r1, #0x96
	lsls r1, r1, #1
	bl Div
	ldrh r2, [r4]
	ldr r3, [r5]
	lsls r1, r2, #4
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	strh r0, [r1, #0x26]
	ldrh r1, [r4]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r1, #0xa
	strh r1, [r0, #0x28]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080445A0: .4byte gUnknown_030033EC
_080445A4: .4byte gUnknown_08499598

