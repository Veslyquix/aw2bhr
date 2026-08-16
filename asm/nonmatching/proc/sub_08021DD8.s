	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08021DD8
sub_08021DD8: @ 0x08021DD8
	push {lr}
	bl sub_08011BD4
	lsls r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #0x15
	cmp r0, r1
	ble _08021DEA
	b _08022042
_08021DEA:
	ldr r0, _08021E10 @ =gUnknown_030043F0
	ldr r1, [r0]
	adds r1, #1
	str r1, [r0]
	ldr r0, [r0]
	movs r1, #0x70
	bl __umodsi3
	cmp r0, #0x2a
	beq _08021E4A
	cmp r0, #0x2a
	bhi _08021E1A
	cmp r0, #0xe
	beq _08021E3A
	cmp r0, #0xe
	bhi _08021E14
	cmp r0, #0
	beq _08021E32
	b _08021E72
	.align 2, 0
_08021E10: .4byte gUnknown_030043F0
_08021E14:
	cmp r0, #0x1c
	beq _08021E42
	b _08021E72
_08021E1A:
	cmp r0, #0x46
	beq _08021E5A
	cmp r0, #0x46
	bhi _08021E28
	cmp r0, #0x38
	beq _08021E52
	b _08021E72
_08021E28:
	cmp r0, #0x54
	beq _08021E62
	cmp r0, #0x62
	beq _08021E6A
	b _08021E72
_08021E32:
	movs r0, #0
	bl sub_08021DA0
	b _08022042
_08021E3A:
	movs r0, #1
	bl sub_08021DA0
	b _08022042
_08021E42:
	movs r0, #2
	bl sub_08021DA0
	b _08022042
_08021E4A:
	movs r0, #3
	bl sub_08021DA0
	b _08022042
_08021E52:
	movs r0, #4
	bl sub_08021DA0
	b _08022042
_08021E5A:
	movs r0, #5
	bl sub_08021DA0
	b _08022042
_08021E62:
	movs r0, #6
	bl sub_08021DA0
	b _08022042
_08021E6A:
	movs r0, #7
	bl sub_08021DA0
	b _08022042
_08021E72:
	ldr r0, _08021E94 @ =gUnknown_03004078
	ldr r1, [r0]
	adds r1, #1
	str r1, [r0]
	ldr r0, [r0]
	movs r1, #0x64
	bl __umodsi3
	cmp r0, #0x57
	bls _08021E88
	b _08022042
_08021E88:
	lsls r0, r0, #2
	ldr r1, _08021E98 @ =_08021E9C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08021E94: .4byte gUnknown_03004078
_08021E98: .4byte _08021E9C
_08021E9C: @ jump table
	.4byte _08021FFC @ case 0
	.4byte _08022004 @ case 1
	.4byte _08022042 @ case 2
	.4byte _08022042 @ case 3
	.4byte _08022042 @ case 4
	.4byte _08022042 @ case 5
	.4byte _08022042 @ case 6
	.4byte _08022042 @ case 7
	.4byte _08022042 @ case 8
	.4byte _08022042 @ case 9
	.4byte _08022042 @ case 10
	.4byte _08022042 @ case 11
	.4byte _08022042 @ case 12
	.4byte _08022042 @ case 13
	.4byte _08022042 @ case 14
	.4byte _08022042 @ case 15
	.4byte _08022042 @ case 16
	.4byte _08022042 @ case 17
	.4byte _08022042 @ case 18
	.4byte _08022042 @ case 19
	.4byte _08022042 @ case 20
	.4byte _08022042 @ case 21
	.4byte _08022034 @ case 22
	.4byte _0802200C @ case 23
	.4byte _08022042 @ case 24
	.4byte _08022042 @ case 25
	.4byte _08022042 @ case 26
	.4byte _08022042 @ case 27
	.4byte _08022042 @ case 28
	.4byte _08022042 @ case 29
	.4byte _08022042 @ case 30
	.4byte _08022042 @ case 31
	.4byte _08022042 @ case 32
	.4byte _08022042 @ case 33
	.4byte _08022042 @ case 34
	.4byte _08022042 @ case 35
	.4byte _08022024 @ case 36
	.4byte _0802202C @ case 37
	.4byte _08022042 @ case 38
	.4byte _08022042 @ case 39
	.4byte _08022042 @ case 40
	.4byte _08022042 @ case 41
	.4byte _08022042 @ case 42
	.4byte _08022042 @ case 43
	.4byte _08022042 @ case 44
	.4byte _08022042 @ case 45
	.4byte _08022042 @ case 46
	.4byte _08022042 @ case 47
	.4byte _08022042 @ case 48
	.4byte _08022042 @ case 49
	.4byte _08022014 @ case 50
	.4byte _0802201C @ case 51
	.4byte _08022042 @ case 52
	.4byte _08022042 @ case 53
	.4byte _08022042 @ case 54
	.4byte _08022042 @ case 55
	.4byte _08022042 @ case 56
	.4byte _08022042 @ case 57
	.4byte _08022042 @ case 58
	.4byte _08022042 @ case 59
	.4byte _08022042 @ case 60
	.4byte _08022042 @ case 61
	.4byte _08022042 @ case 62
	.4byte _08022042 @ case 63
	.4byte _08022042 @ case 64
	.4byte _08022042 @ case 65
	.4byte _08022042 @ case 66
	.4byte _08022042 @ case 67
	.4byte _08022042 @ case 68
	.4byte _08022042 @ case 69
	.4byte _08022042 @ case 70
	.4byte _08022042 @ case 71
	.4byte _08022024 @ case 72
	.4byte _0802202C @ case 73
	.4byte _08022042 @ case 74
	.4byte _08022042 @ case 75
	.4byte _08022042 @ case 76
	.4byte _08022042 @ case 77
	.4byte _08022042 @ case 78
	.4byte _08022042 @ case 79
	.4byte _08022042 @ case 80
	.4byte _08022042 @ case 81
	.4byte _08022042 @ case 82
	.4byte _08022042 @ case 83
	.4byte _08022042 @ case 84
	.4byte _08022042 @ case 85
	.4byte _08022034 @ case 86
	.4byte _0802203C @ case 87
_08021FFC:
	movs r0, #0
	bl sub_08021D64
	b _08022042
_08022004:
	movs r0, #1
	bl sub_08021D64
	b _08022042
_0802200C:
	movs r0, #3
	bl sub_08021D64
	b _08022042
_08022014:
	movs r0, #6
	bl sub_08021D64
	b _08022042
_0802201C:
	movs r0, #7
	bl sub_08021D64
	b _08022042
_08022024:
	movs r0, #4
	bl sub_08021D64
	b _08022042
_0802202C:
	movs r0, #5
	bl sub_08021D64
	b _08022042
_08022034:
	movs r0, #2
	bl sub_08021D64
	b _08022042
_0802203C:
	movs r0, #3
	bl sub_08021D64
_08022042:
	pop {r0}
	bx r0
	.align 2, 0

