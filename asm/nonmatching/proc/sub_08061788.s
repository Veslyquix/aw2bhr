	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08061788
sub_08061788: @ 0x08061788
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r2, _080617E0 @ =gUnknown_085C77A0
	ldr r0, _080617E4 @ =gUnknown_03003FC0
	ldrb r1, [r0, #2]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	adds r3, r0, #0
	adds r3, #0x27
	ldrb r0, [r3]
	cmp r0, #0
	beq _080617F8
	ldr r5, _080617E8 @ =gUnknown_0816DB00
	ldr r0, [r5]
	ldr r6, _080617EC @ =gUnknown_085771C4
	ldr r4, _080617F0 @ =gUnknown_0857690C
	ldr r1, _080617F4 @ =gUnknown_08499598
	ldr r1, [r1]
	lsls r2, r7, #4
	subs r2, r2, r7
	lsls r2, r2, #2
	adds r2, r2, r1
	ldrb r3, [r3]
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #2
	subs r1, r1, r3
	ldrb r2, [r2, #0x1d]
	adds r1, r1, r2
	adds r1, r1, r4
	ldrb r2, [r1]
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #2
	subs r1, r1, r2
	lsls r1, r1, #4
	adds r1, r1, r6
	bl sub_08061A40
	adds r4, r5, #0
	b _08061846
	.align 2, 0
_080617E0: .4byte gUnknown_085C77A0
_080617E4: .4byte gUnknown_03003FC0
_080617E8: .4byte gUnknown_0816DB00
_080617EC: .4byte gUnknown_085771C4
_080617F0: .4byte gUnknown_0857690C
_080617F4: .4byte gUnknown_08499598
_080617F8:
	ldr r2, _08061808 @ =gUnknown_030046B8
	ldrb r0, [r2]
	cmp r0, #3
	bhi _08061810
	ldr r1, _0806180C @ =gUnknown_08576908
	adds r0, r0, r1
	ldrb r6, [r0]
	b _08061812
	.align 2, 0
_08061808: .4byte gUnknown_030046B8
_0806180C: .4byte gUnknown_08576908
_08061810:
	movs r6, #4
_08061812:
	ldr r4, _08061854 @ =gUnknown_0816DB00
	ldr r0, [r4]
	ldr r5, _08061858 @ =gUnknown_085771C4
	ldr r3, _0806185C @ =gUnknown_0857690C
	ldr r1, _08061860 @ =gUnknown_08499598
	ldr r1, [r1]
	lsls r2, r7, #4
	subs r2, r2, r7
	lsls r2, r2, #2
	adds r2, r2, r1
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #2
	subs r1, r1, r6
	ldrb r2, [r2, #0x1d]
	adds r1, r1, r2
	adds r1, r1, r3
	ldrb r2, [r1]
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #2
	subs r1, r1, r2
	lsls r1, r1, #4
	adds r1, r1, r5
	bl sub_08061A40
_08061846:
	ldr r0, _08061864 @ =gUnknown_02029D84
	ldr r1, [r4]
	bl sub_08061A40
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08061854: .4byte gUnknown_0816DB00
_08061858: .4byte gUnknown_085771C4
_0806185C: .4byte gUnknown_0857690C
_08061860: .4byte gUnknown_08499598
_08061864: .4byte gUnknown_02029D84

