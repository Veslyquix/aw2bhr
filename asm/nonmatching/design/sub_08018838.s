	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08018838
sub_08018838: @ 0x08018838
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r1, _08018880 @ =gUnknown_03002F08
	movs r0, #0xf
	strb r0, [r1]
	ldr r0, _08018884 @ =gUnknown_030033EC
	ldrh r1, [r0]
	ldr r0, _08018888 @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1a]
	subs r0, #1
	movs r1, #0xf
	bl sub_0802D5CC
	ldr r0, _0801888C @ =gUnknown_0200C528
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	adds r0, #0x10
	str r0, [r1]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08018880: .4byte gUnknown_03002F08
_08018884: .4byte gUnknown_030033EC
_08018888: .4byte gUnknown_08499598
_0801888C: .4byte gUnknown_0200C528

