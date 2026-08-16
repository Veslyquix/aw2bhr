	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08085410
sub_08085410: @ 0x08085410
	push {lr}
	adds r2, r1, #0
	ldr r1, _0808543C @ =gUnknown_08499598
	ldr r3, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r1, #0x1d]
	ldrb r1, [r1, #0x1e]
	bl sub_080430B0
	adds r0, #0x1e
	cmp r0, #0x6e
	bls _08085430
	b _0808560C
_08085430:
	lsls r0, r0, #2
	ldr r1, _08085440 @ =_08085444
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808543C: .4byte gUnknown_08499598
_08085440: .4byte _08085444
_08085444: @ jump table
	.4byte _08085608 @ case 0
	.4byte _0808560C @ case 1
	.4byte _0808560C @ case 2
	.4byte _0808560C @ case 3
	.4byte _0808560C @ case 4
	.4byte _0808560C @ case 5
	.4byte _0808560C @ case 6
	.4byte _0808560C @ case 7
	.4byte _0808560C @ case 8
	.4byte _0808560C @ case 9
	.4byte _08085604 @ case 10
	.4byte _0808560C @ case 11
	.4byte _0808560C @ case 12
	.4byte _0808560C @ case 13
	.4byte _0808560C @ case 14
	.4byte _0808560C @ case 15
	.4byte _0808560C @ case 16
	.4byte _0808560C @ case 17
	.4byte _0808560C @ case 18
	.4byte _0808560C @ case 19
	.4byte _08085600 @ case 20
	.4byte _0808560C @ case 21
	.4byte _0808560C @ case 22
	.4byte _0808560C @ case 23
	.4byte _0808560C @ case 24
	.4byte _0808560C @ case 25
	.4byte _0808560C @ case 26
	.4byte _0808560C @ case 27
	.4byte _0808560C @ case 28
	.4byte _0808560C @ case 29
	.4byte _0808560C @ case 30
	.4byte _0808560C @ case 31
	.4byte _0808560C @ case 32
	.4byte _0808560C @ case 33
	.4byte _0808560C @ case 34
	.4byte _0808560C @ case 35
	.4byte _0808560C @ case 36
	.4byte _0808560C @ case 37
	.4byte _0808560C @ case 38
	.4byte _0808560C @ case 39
	.4byte _08085610 @ case 40
	.4byte _0808560C @ case 41
	.4byte _0808560C @ case 42
	.4byte _0808560C @ case 43
	.4byte _0808560C @ case 44
	.4byte _08085614 @ case 45
	.4byte _0808560C @ case 46
	.4byte _0808560C @ case 47
	.4byte _0808560C @ case 48
	.4byte _0808560C @ case 49
	.4byte _08085618 @ case 50
	.4byte _0808560C @ case 51
	.4byte _0808560C @ case 52
	.4byte _0808560C @ case 53
	.4byte _0808560C @ case 54
	.4byte _0808560C @ case 55
	.4byte _0808560C @ case 56
	.4byte _0808560C @ case 57
	.4byte _0808560C @ case 58
	.4byte _0808560C @ case 59
	.4byte _0808561C @ case 60
	.4byte _0808560C @ case 61
	.4byte _0808560C @ case 62
	.4byte _0808560C @ case 63
	.4byte _0808560C @ case 64
	.4byte _0808560C @ case 65
	.4byte _0808560C @ case 66
	.4byte _0808560C @ case 67
	.4byte _0808560C @ case 68
	.4byte _0808560C @ case 69
	.4byte _08085620 @ case 70
	.4byte _0808560C @ case 71
	.4byte _0808560C @ case 72
	.4byte _0808560C @ case 73
	.4byte _0808560C @ case 74
	.4byte _0808560C @ case 75
	.4byte _0808560C @ case 76
	.4byte _0808560C @ case 77
	.4byte _0808560C @ case 78
	.4byte _0808560C @ case 79
	.4byte _08085624 @ case 80
	.4byte _0808560C @ case 81
	.4byte _0808560C @ case 82
	.4byte _0808560C @ case 83
	.4byte _0808560C @ case 84
	.4byte _0808560C @ case 85
	.4byte _0808560C @ case 86
	.4byte _0808560C @ case 87
	.4byte _0808560C @ case 88
	.4byte _0808560C @ case 89
	.4byte _08085628 @ case 90
	.4byte _0808560C @ case 91
	.4byte _0808560C @ case 92
	.4byte _0808560C @ case 93
	.4byte _0808560C @ case 94
	.4byte _0808560C @ case 95
	.4byte _0808560C @ case 96
	.4byte _0808560C @ case 97
	.4byte _0808560C @ case 98
	.4byte _0808560C @ case 99
	.4byte _0808560C @ case 100
	.4byte _0808560C @ case 101
	.4byte _0808560C @ case 102
	.4byte _0808560C @ case 103
	.4byte _0808560C @ case 104
	.4byte _0808562C @ case 105
	.4byte _0808560C @ case 106
	.4byte _0808560C @ case 107
	.4byte _0808560C @ case 108
	.4byte _0808560C @ case 109
	.4byte _08085630 @ case 110
_08085600:
	movs r0, #0x9b
	b _08085632
_08085604:
	movs r0, #0x9c
	b _08085632
_08085608:
	movs r0, #0x9d
	b _08085632
_0808560C:
	movs r0, #0x9e
	b _08085632
_08085610:
	movs r0, #0x9f
	b _08085632
_08085614:
	movs r0, #0xa0
	b _08085632
_08085618:
	movs r0, #0xa1
	b _08085632
_0808561C:
	movs r0, #0xa2
	b _08085632
_08085620:
	movs r0, #0xa3
	b _08085632
_08085624:
	movs r0, #0xa4
	b _08085632
_08085628:
	movs r0, #0xa5
	b _08085632
_0808562C:
	movs r0, #0xa6
	b _08085632
_08085630:
	movs r0, #0xa7
_08085632:
	pop {r1}
	bx r1
	.align 2, 0

