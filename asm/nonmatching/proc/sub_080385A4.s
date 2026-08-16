	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080385A4
sub_080385A4: @ 0x080385A4
	push {lr}
	ldr r0, _08038608 @ =gUnknown_08499598
	ldr r1, [r0]
	movs r0, #0
	strb r0, [r1, #0x1a]
	movs r2, #1
	ldr r3, _0803860C @ =gUnknown_03003FF3
_080385B2:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	adds r1, r0, r3
	strb r2, [r1]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _080385B2
	ldr r2, _08038610 @ =gUnknown_03003FC0
	adds r0, r2, #0
	adds r0, #0x3e
	movs r3, #1
	strb r3, [r0]
	adds r1, r2, #0
	adds r1, #0x3f
	movs r0, #3
	strb r0, [r1]
	adds r1, #1
	movs r0, #9
	strb r0, [r1]
	adds r1, #1
	movs r0, #6
	strb r0, [r1]
	ldrb r0, [r2, #1]
	cmp r0, #3
	beq _08038602
	adds r0, r2, #0
	adds r0, #0x39
	strb r3, [r0]
	adds r0, #1
	movs r1, #2
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	bl sub_08026900
_08038602:
	pop {r0}
	bx r0
	.align 2, 0
_08038608: .4byte gUnknown_08499598
_0803860C: .4byte gUnknown_03003FF3
_08038610: .4byte gUnknown_03003FC0

