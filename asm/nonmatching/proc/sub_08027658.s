	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08027658
sub_08027658: @ 0x08027658
	push {r4, lr}
	ldr r3, _0802768C @ =gUnknown_030033E4
	ldrh r0, [r3]
	lsls r0, r0, #4
	ldr r1, _08027690 @ =gUnknown_08499590
	ldr r2, [r1]
	ldrh r1, [r2, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldrh r0, [r3, #2]
	lsls r0, r0, #4
	ldrh r1, [r2, #6]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x4f
	bgt _080276A4
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x7f
	bgt _08027698
	bl sub_080275B4
	ldr r4, _08027694 @ =gUnknown_08090AA4
	b _080276C0
	.align 2, 0
_0802768C: .4byte gUnknown_030033E4
_08027690: .4byte gUnknown_08499590
_08027694: .4byte gUnknown_08090AA4
_08027698:
	bl sub_08027608
	ldr r4, _080276A0 @ =gUnknown_08090AA4
	b _080276C0
	.align 2, 0
_080276A0: .4byte gUnknown_08090AA4
_080276A4:
	ldr r0, _080276B8 @ =gUnknown_08090AA4
	ldr r1, [r0]
	ldrb r1, [r1]
	adds r4, r0, #0
	cmp r1, #1
	bne _080276BC
	bl sub_080275B4
	b _080276C0
	.align 2, 0
_080276B8: .4byte gUnknown_08090AA4
_080276BC:
	bl sub_08027608
_080276C0:
	ldr r0, [r4]
	ldr r0, [r0, #4]
	bl sub_0804360C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

