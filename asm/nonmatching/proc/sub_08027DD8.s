	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08027DD8
sub_08027DD8: @ 0x08027DD8
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _08027E04 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0xb
	ands r0, r1
	cmp r0, #0
	beq _08027E14
	ldr r0, _08027E08 @ =gUnknown_08499E18
	bl Proc_EndEach
	ldr r0, _08027E0C @ =gUnknown_08499D90
	bl sub_0801537C
	ldr r1, _08027E10 @ =gUnknown_03002F1C
	movs r0, #1
	strh r0, [r1]
	movs r0, #0
	str r0, [r5, #8]
	b _08027FB4
	.align 2, 0
_08027E04: .4byte gpKeySt
_08027E08: .4byte gUnknown_08499E18
_08027E0C: .4byte gUnknown_08499D90
_08027E10: .4byte gUnknown_03002F1C
_08027E14:
	movs r1, #0x1e
	ldrsh r0, [r5, r1]
	cmp r0, #0x4b
	bls _08027E1E
	b _08027FAE
_08027E1E:
	lsls r0, r0, #2
	ldr r1, _08027E28 @ =_08027E2C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08027E28: .4byte _08027E2C
_08027E2C: @ jump table
	.4byte _08027F80 @ case 0
	.4byte _08027FAE @ case 1
	.4byte _08027FAE @ case 2
	.4byte _08027FAE @ case 3
	.4byte _08027FAE @ case 4
	.4byte _08027F80 @ case 5
	.4byte _08027FAE @ case 6
	.4byte _08027FAE @ case 7
	.4byte _08027FAE @ case 8
	.4byte _08027FAE @ case 9
	.4byte _08027F80 @ case 10
	.4byte _08027FAE @ case 11
	.4byte _08027FAE @ case 12
	.4byte _08027FAE @ case 13
	.4byte _08027FAE @ case 14
	.4byte _08027F78 @ case 15
	.4byte _08027FAE @ case 16
	.4byte _08027FAE @ case 17
	.4byte _08027FAE @ case 18
	.4byte _08027FAE @ case 19
	.4byte _08027F5C @ case 20
	.4byte _08027FAE @ case 21
	.4byte _08027FAE @ case 22
	.4byte _08027FAE @ case 23
	.4byte _08027FAE @ case 24
	.4byte _08027F6A @ case 25
	.4byte _08027FAE @ case 26
	.4byte _08027FAE @ case 27
	.4byte _08027FAE @ case 28
	.4byte _08027FAE @ case 29
	.4byte _08027F80 @ case 30
	.4byte _08027FAE @ case 31
	.4byte _08027FAE @ case 32
	.4byte _08027FAE @ case 33
	.4byte _08027FAE @ case 34
	.4byte _08027FAE @ case 35
	.4byte _08027FAE @ case 36
	.4byte _08027FAE @ case 37
	.4byte _08027FAE @ case 38
	.4byte _08027FAE @ case 39
	.4byte _08027FAE @ case 40
	.4byte _08027FAE @ case 41
	.4byte _08027FAE @ case 42
	.4byte _08027FAE @ case 43
	.4byte _08027FAE @ case 44
	.4byte _08027FAE @ case 45
	.4byte _08027FAE @ case 46
	.4byte _08027FAE @ case 47
	.4byte _08027FAE @ case 48
	.4byte _08027FAE @ case 49
	.4byte _08027FAE @ case 50
	.4byte _08027FAE @ case 51
	.4byte _08027FAE @ case 52
	.4byte _08027FAE @ case 53
	.4byte _08027FAE @ case 54
	.4byte _08027FAE @ case 55
	.4byte _08027FAE @ case 56
	.4byte _08027FAE @ case 57
	.4byte _08027FAE @ case 58
	.4byte _08027FAE @ case 59
	.4byte _08027FAE @ case 60
	.4byte _08027FAE @ case 61
	.4byte _08027FAE @ case 62
	.4byte _08027FAE @ case 63
	.4byte _08027FAE @ case 64
	.4byte _08027FAE @ case 65
	.4byte _08027FAE @ case 66
	.4byte _08027FAE @ case 67
	.4byte _08027FAE @ case 68
	.4byte _08027FAE @ case 69
	.4byte _08027FAE @ case 70
	.4byte _08027FAE @ case 71
	.4byte _08027FAE @ case 72
	.4byte _08027FAE @ case 73
	.4byte _08027FAE @ case 74
	.4byte _08027FAA @ case 75
_08027F5C:
	ldrh r0, [r5, #0x20]
	adds r0, #0x10
	strh r0, [r5, #0x20]
	ldr r0, _08027F74 @ =gUnknown_03004080
	ldrh r0, [r0]
	cmp r0, #0x63
	bls _08027FAE
_08027F6A:
	ldr r0, _08027F74 @ =gUnknown_03004080
	ldrh r0, [r0]
	cmp r0, #9
	bls _08027FAE
	b _08027F80
	.align 2, 0
_08027F74: .4byte gUnknown_03004080
_08027F78:
	bl sub_0802813C
	cmp r0, #4
	bne _08027FAE
_08027F80:
	movs r0, #0x20
	ldrsh r4, [r5, r0]
	movs r1, #0x1e
	ldrsh r0, [r5, r1]
	movs r1, #5
	bl __divsi3
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r2, r3, #4
	movs r0, #3
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x50
	bl sub_08027B10
	ldrh r0, [r5, #0x20]
	adds r0, #0x18
	strh r0, [r5, #0x20]
	b _08027FAE
_08027FAA:
	movs r0, #0
	str r0, [r5, #8]
_08027FAE:
	ldrh r0, [r5, #0x1e]
	adds r0, #1
	strh r0, [r5, #0x1e]
_08027FB4:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

