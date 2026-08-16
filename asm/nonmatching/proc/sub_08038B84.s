	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08038B84
sub_08038B84: @ 0x08038B84
	push {r4, r5, lr}
	sub sp, #8
	ldr r0, _08038BD4 @ =gUnknown_03003F38
	ldrb r0, [r0]
	lsrs r0, r0, #6
	adds r0, #1
	ldr r1, _08038BD8 @ =gUnknown_0849D5F8
	ldr r4, [r1]
	adds r1, r4, #0
	adds r1, #0x45
	movs r5, #0
	ldrsb r5, [r1, r5]
	subs r1, #0x25
	adds r1, r1, r5
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, r4, #0
	adds r2, #0x2c
	adds r2, r2, r5
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	ldr r3, _08038BDC @ =gUnknown_030040D8
	ldr r3, [r3]
	ldrb r3, [r3]
	adds r4, #0x38
	adds r4, r4, r5
	ldrb r4, [r4]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	str r4, [sp]
	movs r4, #1
	str r4, [sp, #4]
	bl sub_0802026C
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08038BD4: .4byte gUnknown_03003F38
_08038BD8: .4byte gUnknown_0849D5F8
_08038BDC: .4byte gUnknown_030040D8

