	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080722B8
sub_080722B8: @ 0x080722B8
	push {r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r1, r2, #0
	adds r5, r3, #0
	ldr r7, _080722FC @ =gUnknown_081CBF68
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r6, r2, #2
	adds r0, r6, r7
	ldr r2, [r0]
	ldr r0, _08072300 @ =gUnknown_08613EE4
	bl _call_via_r2
	str r4, [r0, #0x54]
	str r5, [r0, #0x4c]
	asrs r4, r4, #4
	cmp r4, #0
	bne _080722DE
	movs r4, #1
_080722DE:
	adds r0, r7, #4
	adds r0, r6, r0
	ldr r1, [r0]
	adds r0, r7, #0
	adds r0, #8
	adds r0, r6, r0
	ldr r0, [r0]
	muls r0, r4, r0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl _call_via_r1
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080722FC: .4byte gUnknown_081CBF68
_08072300: .4byte gUnknown_08613EE4

