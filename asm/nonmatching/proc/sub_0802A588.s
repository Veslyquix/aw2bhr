	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802A588
sub_0802A588: @ 0x0802A588
	push {r4, lr}
	adds r2, r0, #0
	ldr r4, [r2, #0x4c]
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl sub_0803FECC
	ldr r0, _0802A5C0 @ =gUnknown_08499594
	ldr r0, [r0]
	subs r4, r4, r0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r1, r0, #4
	adds r0, r0, r1
	lsls r1, r0, #8
	adds r0, r0, r1
	lsls r1, r0, #0x10
	adds r0, r0, r1
	rsbs r0, r0, #0
	asrs r0, r0, #2
	bl sub_08025D60
	bl sub_080258CC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A5C0: .4byte gUnknown_08499594

