	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806171C
sub_0806171C: @ 0x0806171C
	push {lr}
	bl sub_08019260
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08061782
	ldr r0, _08061740 @ =gUnknown_03004780
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	bhi _08061782
	lsls r0, r0, #2
	ldr r1, _08061744 @ =_08061748
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08061740: .4byte gUnknown_03004780
_08061744: .4byte _08061748
_08061748: @ jump table
	.4byte _08061760 @ case 0
	.4byte _08061766 @ case 1
	.4byte _0806176C @ case 2
	.4byte _08061772 @ case 3
	.4byte _0806177E @ case 4
	.4byte _08061778 @ case 5
_08061760:
	bl sub_08061868
	b _08061782
_08061766:
	bl sub_08061B00
	b _08061782
_0806176C:
	bl sub_0805D438
	b _08061782
_08061772:
	bl sub_0805FD64
	b _08061782
_08061778:
	bl sub_080606D0
	b _08061782
_0806177E:
	bl sub_08061AC4
_08061782:
	pop {r0}
	bx r0
	.align 2, 0

