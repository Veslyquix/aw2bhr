	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08050528
sub_08050528: @ 0x08050528
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	ldr r1, _08050594 @ =gUnknown_084C3F70
	lsls r2, r0, #2
	adds r1, r2, r1
	ldr r3, [r1]
	ldr r1, _08050598 @ =gUnknown_084C3F78
	adds r2, r2, r1
	ldr r4, [r2]
	ldrh r3, [r3]
	ldr r2, _0805059C @ =gUnknown_085D6A48
	ldr r1, _080505A0 @ =gUnknown_03004580
	lsls r0, r0, #4
	adds r1, #2
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r1, r0, r2
	ldrh r0, [r1, #8]
	cmp r0, #3
	bne _08050566
	movs r3, #0
_08050566:
	ldrh r0, [r1, #2]
	cmp r0, #2
	bne _0805056E
	movs r3, #0
_0805056E:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	lsls r2, r3, #0x10
	asrs r2, r2, #0x10
	subs r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r4]
	subs r2, r7, r2
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl sub_080155C0
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050594: .4byte gUnknown_084C3F70
_08050598: .4byte gUnknown_084C3F78
_0805059C: .4byte gUnknown_085D6A48
_080505A0: .4byte gUnknown_03004580

