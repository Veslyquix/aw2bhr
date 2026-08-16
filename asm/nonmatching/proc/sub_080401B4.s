	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080401B4
sub_080401B4: @ 0x080401B4
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldr r4, [r3, #0x4c]
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	ldr r6, _080401F8 @ =gUnknown_085D5ABC
	ldrb r5, [r4]
	movs r2, #0x5c
	muls r2, r5, r2
	adds r2, r2, r6
	ldrb r2, [r2, #0x18]
	bl sub_0803FF48
	ldr r0, _080401FC @ =gUnknown_08499594
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
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080401F8: .4byte gUnknown_085D5ABC
_080401FC: .4byte gUnknown_08499594

