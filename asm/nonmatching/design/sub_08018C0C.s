	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08018C0C
sub_08018C0C: @ 0x08018C0C
	ldr r1, _08018C48 @ =gUnknown_0200C528
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r1, #4
	adds r2, r2, r1
	ldr r1, [r2]
	ldrb r3, [r1, #8]
	ldr r0, _08018C4C @ =gUnknown_03003FC0
	adds r0, #0x38
	adds r0, r3, r0
	ldrh r1, [r1, #0xa]
	strb r1, [r0]
	ldr r0, _08018C50 @ =gUnknown_08499598
	ldr r1, [r0]
	lsls r0, r3, #4
	subs r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r2]
	ldrh r1, [r1, #0xa]
	strb r1, [r0, #0x1b]
	ldr r0, [r2]
	adds r0, #0x10
	str r0, [r2]
	movs r0, #1
	bx lr
	.align 2, 0
_08018C48: .4byte gUnknown_0200C528
_08018C4C: .4byte gUnknown_03003FC0
_08018C50: .4byte gUnknown_08499598

