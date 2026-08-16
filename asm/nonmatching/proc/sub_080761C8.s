	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080761C8
sub_080761C8: @ 0x080761C8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _08076218 @ =gUnknown_08614458
	ldr r1, [r7, #0x40]
	adds r1, r1, r0
	movs r6, #0
	ldrsb r6, [r1, r6]
	adds r0, r7, #0
	adds r0, #0x3a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08076230
	ldr r0, _0807621C @ =gUnknown_08551A00
	ldr r4, _08076220 @ =0x0000014D
	subs r4, r4, r6
	lsls r4, r4, #1
	ldr r0, [r0]
	adds r0, r0, r4
	ldr r1, _08076224 @ =gUnknown_08499578
	ldr r1, [r1]
	movs r5, #0x80
	lsls r5, r5, #3
	adds r1, r1, r5
	adds r2, r6, #0
	movs r3, #4
	bl sub_08071900
	ldr r0, _08076228 @ =gUnknown_08551A04
	ldr r0, [r0]
	adds r0, r0, r4
	ldr r1, _0807622C @ =gUnknown_08499580
	ldr r1, [r1]
	adds r1, r1, r5
	adds r2, r6, #0
	movs r3, #4
	bl sub_08071900
	b _08076262
	.align 2, 0
_08076218: .4byte gUnknown_08614458
_0807621C: .4byte gUnknown_08551A00
_08076220: .4byte 0x0000014D
_08076224: .4byte gUnknown_08499578
_08076228: .4byte gUnknown_08551A04
_0807622C: .4byte gUnknown_08499580
_08076230:
	ldr r0, _08076284 @ =gUnknown_08551A00
	ldr r0, [r0]
	movs r5, #0xa0
	lsls r5, r5, #2
	adds r0, r0, r5
	ldr r1, _08076288 @ =gUnknown_08499578
	ldr r4, _0807628C @ =0x0000021E
	subs r4, r4, r6
	lsls r4, r4, #1
	ldr r1, [r1]
	adds r1, r1, r4
	adds r2, r6, #0
	movs r3, #4
	bl sub_08071900
	ldr r0, _08076290 @ =gUnknown_08551A04
	ldr r0, [r0]
	adds r0, r0, r5
	ldr r1, _08076294 @ =gUnknown_08499580
	ldr r1, [r1]
	adds r1, r1, r4
	adds r2, r6, #0
	movs r3, #4
	bl sub_08071900
_08076262:
	bl sub_08013AEC
	bl sub_08013B0C
	ldr r0, [r7, #0x40]
	adds r0, #1
	str r0, [r7, #0x40]
	cmp r0, #4
	bne _0807627E
	movs r0, #0
	str r0, [r7, #0x40]
	adds r0, r7, #0
	bl Proc_Break
_0807627E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076284: .4byte gUnknown_08551A00
_08076288: .4byte gUnknown_08499578
_0807628C: .4byte 0x0000021E
_08076290: .4byte gUnknown_08551A04
_08076294: .4byte gUnknown_08499580

