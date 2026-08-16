	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08018C80
sub_08018C80: @ 0x08018C80
	push {r4, lr}
	ldr r1, _08018CB4 @ =gUnknown_0200C528
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r1, #4
	adds r2, r2, r1
	ldr r4, [r2]
	ldrb r1, [r4, #8]
	ldr r0, _08018CB8 @ =gUnknown_08499598
	ldr r3, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r4, #0xa]
	strb r1, [r0, #0x1d]
	ldr r0, [r2]
	adds r0, #0x10
	str r0, [r2]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08018CB4: .4byte gUnknown_0200C528
_08018CB8: .4byte gUnknown_08499598

