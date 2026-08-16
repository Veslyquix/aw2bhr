	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807166C
sub_0807166C: @ 0x0807166C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r1, [r6, #0x40]
	ldrb r5, [r1]
	adds r2, r1, #1
	str r2, [r6, #0x40]
	ldr r0, [r4, #0x18]
	ldrb r1, [r1, #1]
	adds r3, r1, r0
	adds r0, r2, #1
	str r0, [r6, #0x40]
	ldrb r2, [r2, #1]
	adds r0, #1
	str r0, [r6, #0x40]
	cmp r5, #0x11
	bls _08071690
	b _080717BE
_08071690:
	lsls r0, r5, #2
	ldr r1, _0807169C @ =_080716A0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807169C: .4byte _080716A0
_080716A0: @ jump table
	.4byte _080716E8 @ case 0
	.4byte _080716EC @ case 1
	.4byte _080716F4 @ case 2
	.4byte _080716FC @ case 3
	.4byte _08071706 @ case 4
	.4byte _08071714 @ case 5
	.4byte _08071722 @ case 6
	.4byte _0807172A @ case 7
	.4byte _08071732 @ case 8
	.4byte _0807173A @ case 9
	.4byte _08071742 @ case 10
	.4byte _0807174A @ case 11
	.4byte _08071752 @ case 12
	.4byte _08071760 @ case 13
	.4byte _0807176E @ case 14
	.4byte _0807177C @ case 15
	.4byte _0807178A @ case 16
	.4byte _08071798 @ case 17
_080716E8:
	strb r2, [r3]
	b _080717BE
_080716EC:
	ldrb r1, [r3]
	adds r0, r1, r2
	strb r0, [r3]
	b _080717BE
_080716F4:
	ldrb r1, [r3]
	subs r0, r1, r2
	strb r0, [r3]
	b _080717BE
_080716FC:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r0, [r0]
	strb r0, [r3]
	b _080717BE
_08071706:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r1, [r3]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r3]
	b _080717BE
_08071714:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r1, [r3]
	ldrb r0, [r0]
	subs r0, r1, r0
	strb r0, [r3]
	b _080717BE
_08071722:
	ldrb r3, [r3]
	cmp r3, r2
	beq _080717A4
	b _080717B8
_0807172A:
	ldrb r3, [r3]
	cmp r3, r2
	bne _080717A4
	b _080717B8
_08071732:
	ldrb r3, [r3]
	cmp r3, r2
	bhi _080717A4
	b _080717B8
_0807173A:
	ldrb r3, [r3]
	cmp r3, r2
	bhs _080717A4
	b _080717B8
_08071742:
	ldrb r3, [r3]
	cmp r3, r2
	bls _080717A4
	b _080717B8
_0807174A:
	ldrb r3, [r3]
	cmp r3, r2
	blo _080717A4
	b _080717B8
_08071752:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	beq _080717A4
	b _080717B8
_08071760:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bne _080717A4
	b _080717B8
_0807176E:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bhi _080717A4
	b _080717B8
_0807177C:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bhs _080717A4
	b _080717B8
_0807178A:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bls _080717A4
	b _080717B8
_08071798:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bhs _080717B8
_080717A4:
	ldr r0, _080717B4 @ =gUnknown_03005744
	ldr r2, [r0]
	adds r0, r4, #0
	adds r1, r6, #0
	bl _call_via_r2
	b _080717BE
	.align 2, 0
_080717B4: .4byte gUnknown_03005744
_080717B8:
	ldr r0, [r6, #0x40]
	adds r0, #4
	str r0, [r6, #0x40]
_080717BE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

