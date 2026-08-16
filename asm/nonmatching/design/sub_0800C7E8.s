	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800C7E8
sub_0800C7E8: @ 0x0800C7E8
	movs r2, #0
	movs r1, #0x1f
	ands r1, r0
	subs r0, r1, #6
	cmp r0, #0xb
	bhi _0800C83A
	lsls r0, r0, #2
	ldr r1, _0800C800 @ =_0800C804
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800C800: .4byte _0800C804
_0800C804: @ jump table
	.4byte _0800C838 @ case 0
	.4byte _0800C83A @ case 1
	.4byte _0800C834 @ case 2
	.4byte _0800C83A @ case 3
	.4byte _0800C838 @ case 4
	.4byte _0800C838 @ case 5
	.4byte _0800C83A @ case 6
	.4byte _0800C83A @ case 7
	.4byte _0800C838 @ case 8
	.4byte _0800C83A @ case 9
	.4byte _0800C838 @ case 10
	.4byte _0800C838 @ case 11
_0800C834:
	movs r2, #2
	b _0800C83A
_0800C838:
	movs r2, #1
_0800C83A:
	adds r0, r2, #0
	bx lr
	.align 2, 0

