	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805FFA0
sub_0805FFA0: @ 0x0805FFA0
	push {r4, lr}
	ldr r1, _0805FFFC @ =gUnknown_0816DACC
	ldr r0, [r1]
	ldrb r0, [r0]
	adds r4, r1, #0
	cmp r0, #1
	beq _0805FFE8
	cmp r0, #0xe
	beq _0805FFE8
	cmp r0, #0xd
	beq _0805FFE8
	cmp r0, #0xf
	beq _0805FFE8
	cmp r0, #0x10
	beq _0805FFE8
	cmp r0, #0x11
	beq _0805FFE8
	cmp r0, #0x12
	beq _0805FFE8
	cmp r0, #0x13
	beq _0805FFE8
	ldr r2, _08060000 @ =gUnknown_030040D8
	ldr r3, [r2]
	ldrb r1, [r3, #1]
	movs r0, #1
	orrs r0, r1
	strb r0, [r3, #1]
	ldr r1, [r2]
	ldr r3, _08060004 @ =gUnknown_03003100
	ldrh r0, [r3]
	strb r0, [r1, #2]
	ldr r1, [r2]
	ldrh r0, [r3, #2]
	strb r0, [r1, #3]
	bl sub_080258CC
_0805FFE8:
	ldr r0, [r4]
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #0x13
	bhi _080600D6
	lsls r0, r0, #2
	ldr r1, _08060008 @ =_0806000C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805FFFC: .4byte gUnknown_0816DACC
_08060000: .4byte gUnknown_030040D8
_08060004: .4byte gUnknown_03003100
_08060008: .4byte _0806000C
_0806000C: @ jump table
	.4byte _0806005C @ case 0
	.4byte _0806007E @ case 1
	.4byte _0806007A @ case 2
	.4byte _08060084 @ case 3
	.4byte _0806008A @ case 4
	.4byte _080600B2 @ case 5
	.4byte _08060090 @ case 6
	.4byte _08060096 @ case 7
	.4byte _080600D6 @ case 8
	.4byte _080600AC @ case 9
	.4byte _080600B8 @ case 10
	.4byte _080600BE @ case 11
	.4byte _08060068 @ case 12
	.4byte _08060062 @ case 13
	.4byte _0806006E @ case 14
	.4byte _08060074 @ case 15
	.4byte _080600D6 @ case 16
	.4byte _080600C4 @ case 17
	.4byte _080600CA @ case 18
	.4byte _080600D0 @ case 19
_0806005C:
	bl sub_080600F0
	b _080600D6
_08060062:
	bl sub_08060110
	b _080600D6
_08060068:
	bl sub_08060170
	b _080600D6
_0806006E:
	bl sub_080601C8
	b _080600D6
_08060074:
	bl sub_080601DC
	b _080600D6
_0806007A:
	bl sub_08042650
_0806007E:
	bl sub_080424FC
	b _080600D6
_08060084:
	bl sub_080601F0
	b _080600E2
_0806008A:
	bl sub_08060264
	b _080600E2
_08060090:
	bl sub_08042864
	b _0806007E
_08060096:
	movs r0, #1
	bl sub_0806056C
	movs r0, #0
	bl sub_0806056C
	ldr r1, _080600A8 @ =gUnknown_030045D4
	movs r0, #0xa
	b _080600E0
	.align 2, 0
_080600A8: .4byte gUnknown_030045D4
_080600AC:
	bl sub_08042998
	b _0806007E
_080600B2:
	bl sub_08042B84
	b _080600D6
_080600B8:
	bl sub_08060684
	b _0806007E
_080600BE:
	bl sub_080606A0
	b _0806007E
_080600C4:
	bl sub_080606BC
	b _080600D6
_080600CA:
	bl sub_0802C16C
	b _080600D6
_080600D0:
	bl sub_080602C4
	b _080600E2
_080600D6:
	ldr r1, _080600E8 @ =gUnknown_03004780
	movs r0, #2
	strh r0, [r1]
	ldr r1, _080600EC @ =gUnknown_030045D4
	movs r0, #0
_080600E0:
	strh r0, [r1]
_080600E2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080600E8: .4byte gUnknown_03004780
_080600EC: .4byte gUnknown_030045D4

