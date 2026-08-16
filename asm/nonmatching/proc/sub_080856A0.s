	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080856A0
sub_080856A0: @ 0x080856A0
	push {lr}
	adds r2, r1, #0
	ldr r1, _080856C8 @ =gUnknown_08499598
	ldr r3, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r1, #0x1d]
	ldrb r1, [r1, #0x1e]
	bl sub_08043200
	adds r0, #3
	cmp r0, #6
	bhi _080856F8
	lsls r0, r0, #2
	ldr r1, _080856CC @ =_080856D0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080856C8: .4byte gUnknown_08499598
_080856CC: .4byte _080856D0
_080856D0: @ jump table
	.4byte _080856F4 @ case 0
	.4byte _080856F0 @ case 1
	.4byte _080856EC @ case 2
	.4byte _080856F8 @ case 3
	.4byte _080856F8 @ case 4
	.4byte _080856FC @ case 5
	.4byte _08085700 @ case 6
_080856EC:
	movs r0, #0x95
	b _08085702
_080856F0:
	movs r0, #0x96
	b _08085702
_080856F4:
	movs r0, #0x97
	b _08085702
_080856F8:
	movs r0, #0x98
	b _08085702
_080856FC:
	movs r0, #0x99
	b _08085702
_08085700:
	movs r0, #0x9a
_08085702:
	pop {r1}
	bx r1
	.align 2, 0

