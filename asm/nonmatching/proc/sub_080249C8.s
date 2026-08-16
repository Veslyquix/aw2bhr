	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080249C8
sub_080249C8: @ 0x080249C8
	adds r1, r0, #0
	movs r0, #0xe0
	ands r1, r0
	cmp r1, #0
	beq _080249E8
	asrs r1, r1, #5
	ldr r0, _080249E4 @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1a]
	b _080249EA
	.align 2, 0
_080249E4: .4byte gUnknown_08499598
_080249E8:
	movs r0, #0
_080249EA:
	bx lr

