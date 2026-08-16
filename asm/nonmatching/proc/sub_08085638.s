	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08085638
sub_08085638: @ 0x08085638
	push {lr}
	adds r2, r1, #0
	ldr r1, _08085660 @ =gUnknown_08499598
	ldr r3, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r1, #0x1d]
	ldrb r1, [r1, #0x1e]
	bl sub_08043190
	adds r0, #3
	cmp r0, #6
	bhi _08085690
	lsls r0, r0, #2
	ldr r1, _08085664 @ =_08085668
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08085660: .4byte gUnknown_08499598
_08085664: .4byte _08085668
_08085668: @ jump table
	.4byte _0808568C @ case 0
	.4byte _08085688 @ case 1
	.4byte _08085684 @ case 2
	.4byte _08085690 @ case 3
	.4byte _08085690 @ case 4
	.4byte _08085694 @ case 5
	.4byte _08085698 @ case 6
_08085684:
	movs r0, #0x95
	b _0808569A
_08085688:
	movs r0, #0x96
	b _0808569A
_0808568C:
	movs r0, #0x97
	b _0808569A
_08085690:
	movs r0, #0x98
	b _0808569A
_08085694:
	movs r0, #0x99
	b _0808569A
_08085698:
	movs r0, #0x9a
_0808569A:
	pop {r1}
	bx r1
	.align 2, 0

