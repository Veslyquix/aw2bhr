	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08020354
sub_08020354: @ 0x08020354
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _080203B8 @ =gUnknown_08499594
	ldr r1, [r0]
	subs r1, r6, r1
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r1, r0, #4
	adds r0, r0, r1
	lsls r1, r0, #8
	adds r0, r0, r1
	lsls r1, r0, #0x10
	adds r0, r0, r1
	rsbs r0, r0, #0
	asrs r0, r0, #8
	adds r0, #1
	ldrb r1, [r6]
	bl sub_08042D50
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_0801F9C0
	ldr r2, _080203BC @ =gUnknown_085D5ABC
	ldrb r1, [r6]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r2, [r0, #0xe]
	subs r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0xff
	bl sub_0801F9C0
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080203B8: .4byte gUnknown_08499594
_080203BC: .4byte gUnknown_085D5ABC

