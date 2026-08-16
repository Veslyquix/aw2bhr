	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080189EC
sub_080189EC: @ 0x080189EC
	push {r4, r5, r6, lr}
	ldr r6, _08018A1C @ =gUnknown_0200C528
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r5, r6, #4
	adds r5, r4, r5
	ldr r0, [r5]
	ldr r1, [r0, #4]
	ldr r0, [r0, #0xc]
	bl _call_via_r1
	ldr r0, [r5]
	adds r0, #0x10
	str r0, [r5]
	adds r4, r4, r6
	ldr r0, [r4]
	cmp r0, #0
	bne _08018A20
	movs r0, #0
	b _08018A22
	.align 2, 0
_08018A1C: .4byte gUnknown_0200C528
_08018A20:
	movs r0, #1
_08018A22:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

