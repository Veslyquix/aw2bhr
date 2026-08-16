	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08018BCC
sub_08018BCC: @ 0x08018BCC
	push {r4, r5, lr}
	ldr r1, _08018BF8 @ =gUnknown_0200C528
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r1, #4
	adds r4, r0, r1
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl _call_via_r0
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08018BFC
	ldr r0, [r4]
	adds r0, #0x10
	str r0, [r4]
	movs r0, #1
	b _08018C06
	.align 2, 0
_08018BF8: .4byte gUnknown_0200C528
_08018BFC:
	adds r0, r5, #0
	bl sub_08018BAC
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
_08018C06:
	pop {r4, r5}
	pop {r1}
	bx r1

