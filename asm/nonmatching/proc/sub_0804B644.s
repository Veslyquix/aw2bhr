	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804B644
sub_0804B644: @ 0x0804B644
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	cmp r0, r1
	bne _0804B73E
	subs r0, r2, #3
	cmp r0, #0x2a
	bhi _0804B73E
	lsls r0, r0, #2
	ldr r1, _0804B660 @ =_0804B664
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804B660: .4byte _0804B664
_0804B664: @ jump table
	.4byte _0804B730 @ case 0
	.4byte _0804B738 @ case 1
	.4byte _0804B73E @ case 2
	.4byte _0804B73E @ case 3
	.4byte _0804B73E @ case 4
	.4byte _0804B73E @ case 5
	.4byte _0804B73E @ case 6
	.4byte _0804B73E @ case 7
	.4byte _0804B73E @ case 8
	.4byte _0804B73E @ case 9
	.4byte _0804B73E @ case 10
	.4byte _0804B73E @ case 11
	.4byte _0804B73E @ case 12
	.4byte _0804B73E @ case 13
	.4byte _0804B73E @ case 14
	.4byte _0804B73E @ case 15
	.4byte _0804B73E @ case 16
	.4byte _0804B73E @ case 17
	.4byte _0804B73E @ case 18
	.4byte _0804B73E @ case 19
	.4byte _0804B73E @ case 20
	.4byte _0804B73E @ case 21
	.4byte _0804B73E @ case 22
	.4byte _0804B73E @ case 23
	.4byte _0804B73E @ case 24
	.4byte _0804B73E @ case 25
	.4byte _0804B73E @ case 26
	.4byte _0804B73E @ case 27
	.4byte _0804B73E @ case 28
	.4byte _0804B73E @ case 29
	.4byte _0804B710 @ case 30
	.4byte _0804B714 @ case 31
	.4byte _0804B718 @ case 32
	.4byte _0804B71C @ case 33
	.4byte _0804B728 @ case 34
	.4byte _0804B72C @ case 35
	.4byte _0804B720 @ case 36
	.4byte _0804B724 @ case 37
	.4byte _0804B73E @ case 38
	.4byte _0804B73E @ case 39
	.4byte _0804B73E @ case 40
	.4byte _0804B734 @ case 41
	.4byte _0804B73C @ case 42
_0804B710:
	movs r2, #0x22
	b _0804B73E
_0804B714:
	movs r2, #0x21
	b _0804B73E
_0804B718:
	movs r2, #0x24
	b _0804B73E
_0804B71C:
	movs r2, #0x23
	b _0804B73E
_0804B720:
	movs r2, #0x28
	b _0804B73E
_0804B724:
	movs r2, #0x27
	b _0804B73E
_0804B728:
	movs r2, #0x26
	b _0804B73E
_0804B72C:
	movs r2, #0x25
	b _0804B73E
_0804B730:
	movs r2, #0x2c
	b _0804B73E
_0804B734:
	movs r2, #3
	b _0804B73E
_0804B738:
	movs r2, #0x2d
	b _0804B73E
_0804B73C:
	movs r2, #4
_0804B73E:
	adds r0, r2, #0
	bx lr
	.align 2, 0

