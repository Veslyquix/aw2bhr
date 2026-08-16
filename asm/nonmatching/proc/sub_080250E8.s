	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080250E8
sub_080250E8: @ 0x080250E8
	push {r4, r5, lr}
	ldr r5, _080251A0 @ =gUnknown_030013D0
	movs r1, #8
	ldrsh r0, [r5, r1]
	ldr r4, _080251A4 @ =gUnknown_08090A40
	cmp r0, #0
	bgt _0802513E
	ldr r0, [r4]
	ldr r2, _080251A8 @ =gUnknown_08499594
	ldr r1, [r0]
	ldr r2, [r2]
	subs r1, r1, r2
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
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, [r5]
	subs r2, r3, r2
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r2, r1, #4
	adds r1, r1, r2
	lsls r2, r1, #8
	adds r1, r1, r2
	lsls r2, r1, #0x10
	adds r1, r1, r2
	rsbs r1, r1, #0
	asrs r1, r1, #8
	adds r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrb r2, [r3]
	bl sub_08026588
_0802513E:
	ldr r4, [r4]
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bgt _0802518E
	ldr r0, _080251A8 @ =gUnknown_08499594
	ldr r1, [r5]
	ldr r2, [r0]
	subs r1, r1, r2
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
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, [r4]
	subs r2, r3, r2
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r2, r1, #4
	adds r1, r1, r2
	lsls r2, r1, #8
	adds r1, r1, r2
	lsls r2, r1, #0x10
	adds r1, r1, r2
	rsbs r1, r1, #0
	asrs r1, r1, #8
	adds r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrb r2, [r3]
	bl sub_08026588
_0802518E:
	adds r0, r5, #0
	bl sub_0802505C
	adds r0, r4, #0
	bl sub_0802505C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080251A0: .4byte gUnknown_030013D0
_080251A4: .4byte gUnknown_08090A40
_080251A8: .4byte gUnknown_08499594

