	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801368C
sub_0801368C: @ 0x0801368C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r2, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _080136C0 @ =gUnknown_030020C0
	lsrs r1, r1, #0x11
	lsls r1, r1, #1
	adds r1, r1, r0
	adds r0, r6, #0
	adds r2, r4, #0
	bl sub_08011C58
	movs r0, #0xa0
	lsls r0, r0, #0x13
	adds r5, r5, r0
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_08011C58
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080136C0: .4byte gUnknown_030020C0

