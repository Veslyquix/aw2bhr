	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08044534
sub_08044534: @ 0x08044534
	ldr r2, _08044558 @ =gUnknown_030033EC
	ldrh r1, [r2]
	ldr r0, _0804455C @ =gUnknown_08499598
	ldr r3, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r1, #0
	strh r1, [r0, #0x26]
	ldrh r1, [r2]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r1, #0xa
	strh r1, [r0, #0x28]
	bx lr
	.align 2, 0
_08044558: .4byte gUnknown_030033EC
_0804455C: .4byte gUnknown_08499598

