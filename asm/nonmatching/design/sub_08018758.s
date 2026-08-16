	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08018758
sub_08018758: @ 0x08018758
	push {r4, r5, lr}
	sub sp, #8
	ldr r5, _080187B4 @ =gUnknown_0200C528
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r0, r5, #0
	adds r0, #0x14
	adds r0, r4, r0
	ldrh r3, [r0]
	ldr r0, _080187B8 @ =gUnknown_08499588
	ldr r2, [r0]
	ldr r0, _080187BC @ =gUnknown_03002F08
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp, #4]
	movs r0, #7
	movs r1, #1
	bl sub_08014740
	ldr r1, _080187C0 @ =sub_080185A0
	str r1, [r0, #0x3c]
	adds r0, #0x38
	movs r1, #1
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #8
	adds r0, r4, r0
	ldr r1, _080187C4 @ =sub_080185BC
	str r1, [r0]
	adds r0, r5, #4
	adds r4, r4, r0
	ldr r0, [r4]
	adds r0, #0x10
	str r0, [r4]
	movs r0, #0
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080187B4: .4byte gUnknown_0200C528
_080187B8: .4byte gUnknown_08499588
_080187BC: .4byte gUnknown_03002F08
_080187C0: .4byte sub_080185A0
_080187C4: .4byte sub_080185BC

