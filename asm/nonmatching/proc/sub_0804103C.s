	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804103C
sub_0804103C: @ 0x0804103C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r5, #0x1f
	ands r5, r4
	adds r0, r4, #0
	bl sub_08024984
	adds r2, r0, #0
	lsrs r4, r4, #5
	ldr r0, _08041074 @ =gUnknown_08499598
	ldr r1, [r0]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r4, [r0, #0x1a]
	subs r0, r5, #6
	cmp r0, #0xe
	bhi _080410C8
	lsls r0, r0, #2
	ldr r1, _08041078 @ =_0804107C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08041074: .4byte gUnknown_08499598
_08041078: .4byte _0804107C
_0804107C: @ jump table
	.4byte _080410C8 @ case 0
	.4byte _080410C8 @ case 1
	.4byte _080410B8 @ case 2
	.4byte _080410C8 @ case 3
	.4byte _080410D8 @ case 4
	.4byte _080410E0 @ case 5
	.4byte _080410C8 @ case 6
	.4byte _080410C8 @ case 7
	.4byte _080410D0 @ case 8
	.4byte _080410C8 @ case 9
	.4byte _080410C8 @ case 10
	.4byte _080410C8 @ case 11
	.4byte _080410C8 @ case 12
	.4byte _080410C8 @ case 13
	.4byte _080410E8 @ case 14
_080410B8:
	ldr r1, _080410C4 @ =gUnknown_081218BC
	subs r0, r2, #1
	lsls r0, r0, #0xa
	adds r3, r0, r1
	b _080410EA
	.align 2, 0
_080410C4: .4byte gUnknown_081218BC
_080410C8:
	ldr r3, _080410CC @ =gUnknown_08122CBC
	b _080410EA
	.align 2, 0
_080410CC: .4byte gUnknown_08122CBC
_080410D0:
	ldr r3, _080410D4 @ =gUnknown_081230BC
	b _080410EA
	.align 2, 0
_080410D4: .4byte gUnknown_081230BC
_080410D8:
	ldr r3, _080410DC @ =gUnknown_081234BC
	b _080410EA
	.align 2, 0
_080410DC: .4byte gUnknown_081234BC
_080410E0:
	ldr r3, _080410E4 @ =gUnknown_081238BC
	b _080410EA
	.align 2, 0
_080410E4: .4byte gUnknown_081238BC
_080410E8:
	ldr r3, _08041118 @ =gUnknown_08123CBC
_080410EA:
	ldr r1, _0804111C @ =0x000003FF
	ands r1, r6
	lsls r1, r1, #5
	ldr r0, _08041120 @ =0x06010000
	adds r1, r1, r0
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r3, #0
	bl sub_08011E54
	ldr r1, _08041124 @ =gUnknown_081213F4
	lsls r0, r4, #5
	adds r0, r0, r1
	adds r1, r7, #0
	adds r1, #0x10
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x10
	movs r2, #0x20
	bl sub_08013618
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041118: .4byte gUnknown_08123CBC
_0804111C: .4byte 0x000003FF
_08041120: .4byte 0x06010000
_08041124: .4byte gUnknown_081213F4

