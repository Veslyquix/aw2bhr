	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08035584
sub_08035584: @ 0x08035584
	push {r4, lr}
	adds r4, r0, #0
	ldrb r1, [r4, #1]
	movs r0, #6
	orrs r0, r1
	strb r0, [r4, #1]
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	ldr r2, _080355C0 @ =gUnknown_08499594
	ldr r3, [r2]
	subs r3, r4, r3
	lsls r2, r3, #2
	adds r2, r2, r3
	lsls r3, r2, #4
	adds r2, r2, r3
	lsls r3, r2, #8
	adds r2, r2, r3
	lsls r3, r2, #0x10
	adds r2, r2, r3
	rsbs r2, r2, #0
	lsls r2, r2, #8
	lsrs r2, r2, #0x10
	ldrb r3, [r4]
	bl sub_080355CC
	cmp r0, #0
	beq _080355C4
	str r4, [r0, #0x30]
	b _080355C6
	.align 2, 0
_080355C0: .4byte gUnknown_08499594
_080355C4:
	movs r0, #0
_080355C6:
	pop {r4}
	pop {r1}
	bx r1

