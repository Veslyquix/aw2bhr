	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803227C
sub_0803227C: @ 0x0803227C
	push {r4, r5, r6, r7, lr}
	ldr r4, _08032330 @ =gUnknown_08090D1C
	ldr r0, [r4]
	ldr r0, [r0]
	ldrh r5, [r0, #4]
	bl sub_0802F534
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r2, _08032334 @ =gUnknown_08090D20
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0x20
	ands r0, r1
	adds r7, r4, #0
	cmp r0, #0
	beq _080322C4
	lsls r0, r6, #0x18
	asrs r0, r0, #8
	ldr r3, _08032338 @ =0xFFFF0000
	adds r1, r0, r3
	ldr r3, _0803233C @ =gUnknown_0300449C
_080322AA:
	lsls r0, r5, #0x10
	ldr r4, _08032338 @ =0xFFFF0000
	adds r0, r0, r4
	lsrs r5, r0, #0x10
	cmp r0, #0
	bge _080322B8
	lsrs r5, r1, #0x10
_080322B8:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _080322AA
_080322C4:
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0x10
	ands r0, r1
	lsls r2, r5, #0x10
	cmp r0, #0
	beq _080322FA
	lsls r0, r6, #0x18
	asrs r3, r0, #0x18
	ldr r4, _0803233C @ =gUnknown_0300449C
_080322DA:
	lsls r0, r5, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r3
	blt _080322EC
	movs r5, #0
_080322EC:
	lsls r0, r5, #0x10
	asrs r1, r0, #0x10
	adds r1, r1, r4
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	beq _080322DA
_080322FA:
	ldr r4, [r7]
	ldr r0, [r4]
	ldrh r1, [r0, #4]
	strh r1, [r0, #6]
	strh r5, [r0, #4]
	lsls r1, r1, #0x10
	cmp r1, r2
	beq _08032310
	movs r0, #0x67
	bl sub_0803B4DC
_08032310:
	ldr r4, [r4]
	movs r2, #4
	ldrsh r1, [r4, r2]
	movs r3, #6
	ldrsh r0, [r4, r3]
	cmp r1, r0
	beq _08032328
	ldrh r0, [r4, #0xa]
	adds r0, #1
	movs r1, #1
	ands r0, r1
	strh r0, [r4, #0xa]
_08032328:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08032330: .4byte gUnknown_08090D1C
_08032334: .4byte gUnknown_08090D20
_08032338: .4byte 0xFFFF0000
_0803233C: .4byte gUnknown_0300449C

