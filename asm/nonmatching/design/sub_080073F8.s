	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080073F8
sub_080073F8: @ 0x080073F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	mov ip, r0
	str r1, [sp]
	movs r0, #1
	rsbs r0, r0, #0
	mov sb, r0
	movs r1, #0
	str r1, [sp, #4]
	mov r7, ip
	cmp r7, #0
	beq _0800741A
	b _08007690
_0800741A:
	ldr r0, [sp]
	subs r0, #6
	cmp r0, #0x88
	bls _08007424
	b _0800768A
_08007424:
	lsls r0, r0, #2
	ldr r1, _08007430 @ =_08007434
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08007430: .4byte _08007434
_08007434: @ jump table
	.4byte _08007658 @ case 0
	.4byte _0800768A @ case 1
	.4byte _08007658 @ case 2
	.4byte _0800768A @ case 3
	.4byte _08007658 @ case 4
	.4byte _08007658 @ case 5
	.4byte _0800768A @ case 6
	.4byte _0800768A @ case 7
	.4byte _08007658 @ case 8
	.4byte _0800768A @ case 9
	.4byte _0800768A @ case 10
	.4byte _0800768A @ case 11
	.4byte _0800768A @ case 12
	.4byte _0800768A @ case 13
	.4byte _0800768A @ case 14
	.4byte _0800768A @ case 15
	.4byte _0800768A @ case 16
	.4byte _0800768A @ case 17
	.4byte _0800768A @ case 18
	.4byte _0800768A @ case 19
	.4byte _0800768A @ case 20
	.4byte _0800768A @ case 21
	.4byte _0800768A @ case 22
	.4byte _0800768A @ case 23
	.4byte _0800768A @ case 24
	.4byte _0800768A @ case 25
	.4byte _0800768A @ case 26
	.4byte _0800768A @ case 27
	.4byte _0800768A @ case 28
	.4byte _0800768A @ case 29
	.4byte _0800768A @ case 30
	.4byte _0800768A @ case 31
	.4byte _08007662 @ case 32
	.4byte _0800768A @ case 33
	.4byte _08007662 @ case 34
	.4byte _0800768A @ case 35
	.4byte _08007662 @ case 36
	.4byte _08007662 @ case 37
	.4byte _0800768A @ case 38
	.4byte _0800768A @ case 39
	.4byte _08007662 @ case 40
	.4byte _0800768A @ case 41
	.4byte _0800768A @ case 42
	.4byte _0800768A @ case 43
	.4byte _0800768A @ case 44
	.4byte _0800768A @ case 45
	.4byte _0800768A @ case 46
	.4byte _0800768A @ case 47
	.4byte _0800768A @ case 48
	.4byte _0800768A @ case 49
	.4byte _0800768A @ case 50
	.4byte _0800768A @ case 51
	.4byte _0800768A @ case 52
	.4byte _0800768A @ case 53
	.4byte _0800768A @ case 54
	.4byte _0800768A @ case 55
	.4byte _0800768A @ case 56
	.4byte _0800768A @ case 57
	.4byte _0800768A @ case 58
	.4byte _0800768A @ case 59
	.4byte _0800768A @ case 60
	.4byte _0800768A @ case 61
	.4byte _0800768A @ case 62
	.4byte _0800768A @ case 63
	.4byte _0800766C @ case 64
	.4byte _0800768A @ case 65
	.4byte _0800766C @ case 66
	.4byte _0800768A @ case 67
	.4byte _0800766C @ case 68
	.4byte _0800766C @ case 69
	.4byte _0800768A @ case 70
	.4byte _0800768A @ case 71
	.4byte _0800766C @ case 72
	.4byte _0800768A @ case 73
	.4byte _0800768A @ case 74
	.4byte _0800768A @ case 75
	.4byte _0800768A @ case 76
	.4byte _0800768A @ case 77
	.4byte _0800768A @ case 78
	.4byte _0800768A @ case 79
	.4byte _0800768A @ case 80
	.4byte _0800768A @ case 81
	.4byte _0800768A @ case 82
	.4byte _0800768A @ case 83
	.4byte _0800768A @ case 84
	.4byte _0800768A @ case 85
	.4byte _0800768A @ case 86
	.4byte _0800768A @ case 87
	.4byte _0800768A @ case 88
	.4byte _0800768A @ case 89
	.4byte _0800768A @ case 90
	.4byte _0800768A @ case 91
	.4byte _0800768A @ case 92
	.4byte _0800768A @ case 93
	.4byte _0800768A @ case 94
	.4byte _0800768A @ case 95
	.4byte _08007676 @ case 96
	.4byte _0800768A @ case 97
	.4byte _08007676 @ case 98
	.4byte _0800768A @ case 99
	.4byte _08007676 @ case 100
	.4byte _08007676 @ case 101
	.4byte _0800768A @ case 102
	.4byte _0800768A @ case 103
	.4byte _08007676 @ case 104
	.4byte _0800768A @ case 105
	.4byte _0800768A @ case 106
	.4byte _0800768A @ case 107
	.4byte _0800768A @ case 108
	.4byte _0800768A @ case 109
	.4byte _0800768A @ case 110
	.4byte _0800768A @ case 111
	.4byte _0800768A @ case 112
	.4byte _0800768A @ case 113
	.4byte _0800768A @ case 114
	.4byte _0800768A @ case 115
	.4byte _0800768A @ case 116
	.4byte _0800768A @ case 117
	.4byte _0800768A @ case 118
	.4byte _0800768A @ case 119
	.4byte _0800768A @ case 120
	.4byte _0800768A @ case 121
	.4byte _0800768A @ case 122
	.4byte _0800768A @ case 123
	.4byte _0800768A @ case 124
	.4byte _0800768A @ case 125
	.4byte _0800768A @ case 126
	.4byte _0800768A @ case 127
	.4byte _08007680 @ case 128
	.4byte _0800768A @ case 129
	.4byte _08007680 @ case 130
	.4byte _0800768A @ case 131
	.4byte _08007680 @ case 132
	.4byte _08007680 @ case 133
	.4byte _0800768A @ case 134
	.4byte _0800768A @ case 135
	.4byte _08007680 @ case 136
_08007658:
	movs r0, #0
	mov sb, r0
	movs r1, #0
	str r1, [sp, #4]
	b _08007690
_08007662:
	movs r7, #0x20
	mov sb, r7
	movs r0, #1
	str r0, [sp, #4]
	b _08007690
_0800766C:
	movs r1, #0x40
	mov sb, r1
	movs r7, #2
	str r7, [sp, #4]
	b _08007690
_08007676:
	movs r0, #0x60
	mov sb, r0
	movs r1, #3
	str r1, [sp, #4]
	b _08007690
_08007680:
	movs r7, #0x80
	mov sb, r7
	movs r0, #4
	str r0, [sp, #4]
	b _08007690
_0800768A:
	movs r1, #1
	rsbs r1, r1, #0
	mov sb, r1
_08007690:
	movs r2, #2
	rsbs r2, r2, #0
	ldr r1, _080076B8 @ =gUnknown_0200B0D0
	movs r6, #9
_08007698:
	ldr r0, [r1]
	ands r0, r2
	str r0, [r1]
	adds r1, #0x1c
	subs r6, #1
	cmp r6, #0
	bge _08007698
	ldr r0, _080076BC @ =gUnknown_0200B0B0
	ldr r0, [r0]
	movs r7, #0x3a
	ldrsh r5, [r0, r7]
	mov r1, ip
	cmp r1, #0
	bne _080076C0
	adds r0, #0x36
	b _080076C2
	.align 2, 0
_080076B8: .4byte gUnknown_0200B0D0
_080076BC: .4byte gUnknown_0200B0B0
_080076C0:
	adds r0, #0x38
_080076C2:
	movs r4, #0
	ldrsb r4, [r0, r4]
	movs r7, #8
	str r7, [sp, #8]
	mov r0, ip
	cmp r0, #0
	bne _080076D4
	movs r1, #0xa
	str r1, [sp, #8]
_080076D4:
	movs r7, #7
	str r7, [sp, #0xc]
	mov r0, ip
	cmp r0, #0
	bne _080076E2
	movs r1, #9
	str r1, [sp, #0xc]
_080076E2:
	movs r6, #0
	ldr r7, [sp, #0xc]
	cmp r6, r7
	bge _080077C2
	ldr r0, _0800774C @ =gUnknown_084886F8
	mov sl, r0
	mov r1, ip
	lsls r0, r1, #2
	add r0, ip
	lsls r0, r0, #3
	mov r8, r0
	mov r7, r8
	add r7, sl
	str r7, [sp, #0x14]
	mov r0, sl
	adds r0, #0x10
	add r0, r8
	str r0, [sp, #0x10]
	ldr r1, _08007750 @ =gUnknown_0200B224
	lsls r0, r4, #2
	adds r3, r0, r1
_0800770C:
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	ldr r1, _08007754 @ =gUnknown_0200B0D0
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	strh r6, [r2, #6]
	movs r0, #8
	orrs r1, r0
	str r1, [r2]
	movs r0, #0x82
	lsls r0, r0, #8
	str r0, [r2, #0x10]
	ldr r7, _08007758 @ =gUnknown_0200B0B0
	ldr r0, [r7]
	movs r1, #7
	ldrsb r1, [r0, r1]
	cmp r1, #0
	bne _0800775C
	ldr r7, [sp, #0x10]
	ldr r0, [r7]
	lsls r0, r0, #8
	str r0, [r2, #0xc]
	ldr r7, [sp, #0x14]
	ldr r0, [r7]
	strh r0, [r2, #8]
	str r1, [r2, #0x14]
	b _08007772
	.align 2, 0
_0800774C: .4byte gUnknown_084886F8
_08007750: .4byte gUnknown_0200B224
_08007754: .4byte gUnknown_0200B0D0
_08007758: .4byte gUnknown_0200B0B0
_0800775C:
	mov r0, sl
	adds r0, #0xc
	add r0, r8
	ldr r0, [r0]
	lsls r0, r0, #8
	str r0, [r2, #0xc]
	ldr r1, [sp, #0x14]
	ldr r0, [r1]
	strh r0, [r2, #8]
	movs r7, #0
	str r7, [r2, #0x14]
_08007772:
	ldrh r0, [r3]
	strh r0, [r2, #4]
	mov r0, ip
	cmp r0, #0
	bne _0800778E
	mov r1, sb
	cmp r1, #0
	blt _0800778E
	ldrh r1, [r2, #4]
	movs r0, #0x1f
	ands r0, r1
	mov r7, sb
	orrs r0, r7
	strh r0, [r2, #4]
_0800778E:
	adds r3, #4
	adds r4, #1
	mov r0, ip
	cmp r0, #0
	bne _080077A2
	cmp r4, #0x10
	ble _080077AA
	subs r3, #0x44
	subs r4, #0x11
	b _080077AA
_080077A2:
	cmp r4, #0x13
	ble _080077AA
	subs r3, #0x50
	subs r4, #0x14
_080077AA:
	adds r5, #1
	ldr r1, [sp, #8]
	cmp r5, r1
	blt _080077B4
	subs r5, r5, r1
_080077B4:
	ldr r7, [sp, #0x14]
	adds r7, #4
	str r7, [sp, #0x14]
	adds r6, #1
	ldr r0, [sp, #0xc]
	cmp r6, r0
	blt _0800770C
_080077C2:
	mov r1, ip
	cmp r1, #0
	bne _080077DA
	mov r7, sb
	cmp r7, #0
	blt _080077DA
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl sub_080077EC
	bl sub_08007B74
_080077DA:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

