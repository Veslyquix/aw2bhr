	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080784E4
sub_080784E4: @ 0x080784E4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _08078500 @ =gUnknown_08615A8C
	bl Proc_StartBlocking
	str r4, [r0, #0x58]
	str r5, [r0, #0x5c]
	str r6, [r0, #0x60]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08078500: .4byte gUnknown_08615A8C

