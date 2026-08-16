	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08018ADC
sub_08018ADC: @ 0x08018ADC
	push {r4, lr}
	ldr r3, _08018B10 @ =gUnknown_0200C528
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r0, r1, r3
	adds r4, r3, #4
	adds r4, r1, r4
	ldr r2, [r4]
	ldrh r2, [r2, #8]
	strb r2, [r0, #0x11]
	adds r3, #8
	adds r1, r1, r3
	ldr r2, _08018B14 @ =sub_08018AA8
	str r2, [r1]
	bl _call_via_r2
	ldr r0, [r4]
	adds r0, #0x10
	str r0, [r4]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08018B10: .4byte gUnknown_0200C528
_08018B14: .4byte sub_08018AA8

