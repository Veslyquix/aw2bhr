	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08068BE4
sub_08068BE4: @ 0x08068BE4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r1, [r5, #0x2c]
	movs r0, #0xcc
	subs r6, r0, r1
	asrs r0, r6, #1
	cmp r0, #0x66
	bls _08068BF6
	b _08068E24
_08068BF6:
	lsls r0, r0, #2
	ldr r1, _08068C00 @ =_08068C04
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08068C00: .4byte _08068C04
_08068C04: @ jump table
	.4byte _08068DB8 @ case 0
	.4byte _08068E24 @ case 1
	.4byte _08068E24 @ case 2
	.4byte _08068E24 @ case 3
	.4byte _08068E24 @ case 4
	.4byte _08068E24 @ case 5
	.4byte _08068E24 @ case 6
	.4byte _08068E24 @ case 7
	.4byte _08068E24 @ case 8
	.4byte _08068E24 @ case 9
	.4byte _08068E24 @ case 10
	.4byte _08068E24 @ case 11
	.4byte _08068E24 @ case 12
	.4byte _08068E24 @ case 13
	.4byte _08068E24 @ case 14
	.4byte _08068DA0 @ case 15
	.4byte _08068DB8 @ case 16
	.4byte _08068E24 @ case 17
	.4byte _08068DA0 @ case 18
	.4byte _08068DB8 @ case 19
	.4byte _08068E24 @ case 20
	.4byte _08068DA0 @ case 21
	.4byte _08068DB8 @ case 22
	.4byte _08068E24 @ case 23
	.4byte _08068E24 @ case 24
	.4byte _08068E24 @ case 25
	.4byte _08068E24 @ case 26
	.4byte _08068E24 @ case 27
	.4byte _08068E24 @ case 28
	.4byte _08068E24 @ case 29
	.4byte _08068E24 @ case 30
	.4byte _08068DA0 @ case 31
	.4byte _08068DB8 @ case 32
	.4byte _08068E24 @ case 33
	.4byte _08068DA0 @ case 34
	.4byte _08068DB8 @ case 35
	.4byte _08068E24 @ case 36
	.4byte _08068DA0 @ case 37
	.4byte _08068DB8 @ case 38
	.4byte _08068E24 @ case 39
	.4byte _08068E24 @ case 40
	.4byte _08068E24 @ case 41
	.4byte _08068E24 @ case 42
	.4byte _08068E24 @ case 43
	.4byte _08068E24 @ case 44
	.4byte _08068E24 @ case 45
	.4byte _08068E24 @ case 46
	.4byte _08068E24 @ case 47
	.4byte _08068E24 @ case 48
	.4byte _08068E24 @ case 49
	.4byte _08068E24 @ case 50
	.4byte _08068E24 @ case 51
	.4byte _08068DD0 @ case 52
	.4byte _08068DE8 @ case 53
	.4byte _08068E24 @ case 54
	.4byte _08068DD0 @ case 55
	.4byte _08068DE8 @ case 56
	.4byte _08068E24 @ case 57
	.4byte _08068DD0 @ case 58
	.4byte _08068DE8 @ case 59
	.4byte _08068E24 @ case 60
	.4byte _08068E24 @ case 61
	.4byte _08068E24 @ case 62
	.4byte _08068E24 @ case 63
	.4byte _08068E24 @ case 64
	.4byte _08068E24 @ case 65
	.4byte _08068E24 @ case 66
	.4byte _08068E24 @ case 67
	.4byte _08068E24 @ case 68
	.4byte _08068E24 @ case 69
	.4byte _08068E24 @ case 70
	.4byte _08068E24 @ case 71
	.4byte _08068E24 @ case 72
	.4byte _08068E24 @ case 73
	.4byte _08068E24 @ case 74
	.4byte _08068E24 @ case 75
	.4byte _08068E24 @ case 76
	.4byte _08068E24 @ case 77
	.4byte _08068E24 @ case 78
	.4byte _08068E24 @ case 79
	.4byte _08068E24 @ case 80
	.4byte _08068E24 @ case 81
	.4byte _08068E24 @ case 82
	.4byte _08068E24 @ case 83
	.4byte _08068E24 @ case 84
	.4byte _08068E24 @ case 85
	.4byte _08068E24 @ case 86
	.4byte _08068E24 @ case 87
	.4byte _08068E24 @ case 88
	.4byte _08068E24 @ case 89
	.4byte _08068E24 @ case 90
	.4byte _08068E24 @ case 91
	.4byte _08068E24 @ case 92
	.4byte _08068E24 @ case 93
	.4byte _08068E24 @ case 94
	.4byte _08068E24 @ case 95
	.4byte _08068E24 @ case 96
	.4byte _08068E24 @ case 97
	.4byte _08068E24 @ case 98
	.4byte _08068E24 @ case 99
	.4byte _08068E24 @ case 100
	.4byte _08068E24 @ case 101
	.4byte _08068E08 @ case 102
_08068DA0:
	ldr r0, _08068DB0 @ =gUnknown_08499584
	ldr r0, [r0]
	movs r1, #0x83
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r1, _08068DB4 @ =gUnknown_0817D910
	b _08068DF4
	.align 2, 0
_08068DB0: .4byte gUnknown_08499584
_08068DB4: .4byte gUnknown_0817D910
_08068DB8:
	ldr r0, _08068DC8 @ =gUnknown_08499584
	ldr r0, [r0]
	movs r1, #0x83
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r1, _08068DCC @ =gUnknown_0817D874
	b _08068DF4
	.align 2, 0
_08068DC8: .4byte gUnknown_08499584
_08068DCC: .4byte gUnknown_0817D874
_08068DD0:
	ldr r0, _08068DE0 @ =gUnknown_08499584
	ldr r0, [r0]
	movs r1, #0x82
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r1, _08068DE4 @ =gUnknown_0817D7B8
	b _08068DF4
	.align 2, 0
_08068DE0: .4byte gUnknown_08499584
_08068DE4: .4byte gUnknown_0817D7B8
_08068DE8:
	ldr r0, _08068E00 @ =gUnknown_08499584
	ldr r0, [r0]
	movs r1, #0x82
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r1, _08068E04 @ =gUnknown_0817D6FC
_08068DF4:
	movs r2, #0
	bl sub_080718F8
	bl sub_08013B1C
	b _08068E24
	.align 2, 0
_08068E00: .4byte gUnknown_08499584
_08068E04: .4byte gUnknown_0817D6FC
_08068E08:
	movs r0, #0x20
	movs r1, #1
	adds r2, r5, #0
	bl sub_080673B0
	ldr r1, _08068E58 @ =0x04000050
	movs r0, #0xff
	strh r0, [r1]
	adds r1, #4
	movs r0, #0x1f
	strh r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_08068E24:
	ldr r4, _08068E5C @ =gUnknown_08581414
	adds r0, r6, #0
	movs r1, #5
	bl __modsi3
	adds r1, r0, r4
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, #1
	adds r0, r0, r4
	movs r2, #0
	ldrsb r2, [r0, r2]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #3
	bl sub_08072C40
	ldr r0, [r5, #0x2c]
	subs r0, #1
	str r0, [r5, #0x2c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08068E58: .4byte 0x04000050
_08068E5C: .4byte gUnknown_08581414

