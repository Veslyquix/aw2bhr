	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801172C
sub_0801172C: @ 0x0801172C
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r2, #0
	subs r0, #0x20
	cmp r0, #0x5e
	bls _08011744
	b _08011954
_08011744:
	lsls r0, r0, #2
	ldr r1, _08011750 @ =_08011754
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08011750: .4byte _08011754
_08011754: @ jump table
	.4byte _08011996 @ case 0
	.4byte _08011954 @ case 1
	.4byte _08011954 @ case 2
	.4byte _08011954 @ case 3
	.4byte _08011954 @ case 4
	.4byte _08011910 @ case 5
	.4byte _08011954 @ case 6
	.4byte _0801192C @ case 7
	.4byte _080118F0 @ case 8
	.4byte _080118F8 @ case 9
	.4byte _08011954 @ case 10
	.4byte _08011954 @ case 11
	.4byte _080118D0 @ case 12
	.4byte _080118D6 @ case 13
	.4byte _080118D0 @ case 14
	.4byte _08011908 @ case 15
	.4byte _08011954 @ case 16
	.4byte _08011954 @ case 17
	.4byte _08011954 @ case 18
	.4byte _08011954 @ case 19
	.4byte _08011954 @ case 20
	.4byte _08011954 @ case 21
	.4byte _08011954 @ case 22
	.4byte _08011954 @ case 23
	.4byte _08011954 @ case 24
	.4byte _08011954 @ case 25
	.4byte _08011900 @ case 26
	.4byte _08011954 @ case 27
	.4byte _080118F0 @ case 28
	.4byte _080118E0 @ case 29
	.4byte _080118F8 @ case 30
	.4byte _08011918 @ case 31
	.4byte _08011954 @ case 32
	.4byte _08011954 @ case 33
	.4byte _08011954 @ case 34
	.4byte _08011954 @ case 35
	.4byte _08011954 @ case 36
	.4byte _08011954 @ case 37
	.4byte _08011954 @ case 38
	.4byte _08011954 @ case 39
	.4byte _08011954 @ case 40
	.4byte _08011954 @ case 41
	.4byte _08011954 @ case 42
	.4byte _08011954 @ case 43
	.4byte _08011954 @ case 44
	.4byte _08011954 @ case 45
	.4byte _08011954 @ case 46
	.4byte _08011954 @ case 47
	.4byte _08011954 @ case 48
	.4byte _08011954 @ case 49
	.4byte _08011954 @ case 50
	.4byte _08011954 @ case 51
	.4byte _08011954 @ case 52
	.4byte _08011954 @ case 53
	.4byte _08011954 @ case 54
	.4byte _08011954 @ case 55
	.4byte _08011954 @ case 56
	.4byte _08011954 @ case 57
	.4byte _08011954 @ case 58
	.4byte _08011954 @ case 59
	.4byte _08011954 @ case 60
	.4byte _08011954 @ case 61
	.4byte _0801193C @ case 62
	.4byte _080118E8 @ case 63
	.4byte _08011954 @ case 64
	.4byte _08011954 @ case 65
	.4byte _08011954 @ case 66
	.4byte _08011954 @ case 67
	.4byte _08011954 @ case 68
	.4byte _08011954 @ case 69
	.4byte _08011954 @ case 70
	.4byte _08011954 @ case 71
	.4byte _08011954 @ case 72
	.4byte _08011954 @ case 73
	.4byte _08011954 @ case 74
	.4byte _08011954 @ case 75
	.4byte _08011954 @ case 76
	.4byte _08011954 @ case 77
	.4byte _08011954 @ case 78
	.4byte _08011954 @ case 79
	.4byte _08011954 @ case 80
	.4byte _08011954 @ case 81
	.4byte _08011954 @ case 82
	.4byte _08011954 @ case 83
	.4byte _08011954 @ case 84
	.4byte _08011954 @ case 85
	.4byte _08011954 @ case 86
	.4byte _08011954 @ case 87
	.4byte _08011954 @ case 88
	.4byte _08011954 @ case 89
	.4byte _08011954 @ case 90
	.4byte _08011954 @ case 91
	.4byte _08011954 @ case 92
	.4byte _08011954 @ case 93
	.4byte _0801191E @ case 94
_080118D0:
	movs r2, #0xff
	lsls r2, r2, #2
	b _08011978
_080118D6:
	ldr r2, _080118DC @ =0x000003FF
	b _08011978
	.align 2, 0
_080118DC: .4byte 0x000003FF
_080118E0:
	ldr r2, _080118E4 @ =0x000003FD
	b _08011978
	.align 2, 0
_080118E4: .4byte 0x000003FD
_080118E8:
	ldr r2, _080118EC @ =0x000003FD
	b _08011978
	.align 2, 0
_080118EC: .4byte 0x000003FD
_080118F0:
	ldr r2, _080118F4 @ =0x000003FA
	b _08011978
	.align 2, 0
_080118F4: .4byte 0x000003FA
_080118F8:
	ldr r2, _080118FC @ =0x000003FB
	b _08011978
	.align 2, 0
_080118FC: .4byte 0x000003FB
_08011900:
	ldr r2, _08011904 @ =0x000003FD
	b _08011978
	.align 2, 0
_08011904: .4byte 0x000003FD
_08011908:
	ldr r2, _0801190C @ =0x000003FD
	b _08011978
	.align 2, 0
_0801190C: .4byte 0x000003FD
_08011910:
	ldr r2, _08011914 @ =0x000003FE
	b _08011978
	.align 2, 0
_08011914: .4byte 0x000003FE
_08011918:
	movs r2, #0xf7
	lsls r2, r2, #2
	b _08011978
_0801191E:
	subs r1, r3, #7
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _08011928 @ =0x000003DD
	b _08011944
	.align 2, 0
_08011928: .4byte 0x000003DD
_0801192C:
	subs r1, r3, #7
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _08011938 @ =0x000003DE
	b _08011944
	.align 2, 0
_08011938: .4byte 0x000003DE
_0801193C:
	subs r1, r3, #7
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _08011950 @ =0x000003DF
_08011944:
	adds r0, r4, #0
	bl sub_08011704
	movs r0, #0
	b _08011998
	.align 2, 0
_08011950: .4byte 0x000003DF
_08011954:
	adds r0, r2, #0
	subs r0, #0x61
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x19
	bhi _08011968
	ldr r0, _08011964 @ =0x0000037F
	b _08011976
	.align 2, 0
_08011964: .4byte 0x0000037F
_08011968:
	adds r0, r2, #0
	subs r0, #0x41
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x19
	bhi _08011988
	ldr r0, _08011984 @ =0x0000039F
_08011976:
	adds r2, r2, r0
_08011978:
	adds r0, r4, #0
	adds r1, r3, #0
	bl sub_08011704
	b _08011996
	.align 2, 0
_08011984: .4byte 0x0000039F
_08011988:
	movs r0, #0xe8
	lsls r0, r0, #2
	adds r2, r2, r0
	adds r0, r4, #0
	adds r1, r3, #0
	bl sub_08011704
_08011996:
	movs r0, #1
_08011998:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

