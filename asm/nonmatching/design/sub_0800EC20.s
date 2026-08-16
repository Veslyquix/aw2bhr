	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800EC20
sub_0800EC20: @ 0x0800EC20
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	mov sb, r1
	ldr r0, _0800EC44 @ =gUnknown_0200B0B0
	ldr r0, [r0]
	ldrh r0, [r0, #0x20]
	subs r0, #0x24
	cmp r0, #0x43
	bls _0800EC3A
	b _0800F2C0
_0800EC3A:
	lsls r0, r0, #2
	ldr r1, _0800EC48 @ =_0800EC4C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800EC44: .4byte gUnknown_0200B0B0
_0800EC48: .4byte _0800EC4C
_0800EC4C: @ jump table
	.4byte _0800F014 @ case 0
	.4byte _0800F014 @ case 1
	.4byte _0800F250 @ case 2
	.4byte _0800EF82 @ case 3
	.4byte _0800F2C0 @ case 4
	.4byte _0800F2C0 @ case 5
	.4byte _0800F2C0 @ case 6
	.4byte _0800F2C0 @ case 7
	.4byte _0800F2C0 @ case 8
	.4byte _0800F2C0 @ case 9
	.4byte _0800F2C0 @ case 10
	.4byte _0800F2C0 @ case 11
	.4byte _0800F2C0 @ case 12
	.4byte _0800F2C0 @ case 13
	.4byte _0800F2C0 @ case 14
	.4byte _0800F2C0 @ case 15
	.4byte _0800F2C0 @ case 16
	.4byte _0800F2C0 @ case 17
	.4byte _0800F2C0 @ case 18
	.4byte _0800F2C0 @ case 19
	.4byte _0800F2C0 @ case 20
	.4byte _0800F2C0 @ case 21
	.4byte _0800F2C0 @ case 22
	.4byte _0800F2C0 @ case 23
	.4byte _0800F2C0 @ case 24
	.4byte _0800F2C0 @ case 25
	.4byte _0800F2C0 @ case 26
	.4byte _0800F2C0 @ case 27
	.4byte _0800F2C0 @ case 28
	.4byte _0800F2C0 @ case 29
	.4byte _0800F2C0 @ case 30
	.4byte _0800F2C0 @ case 31
	.4byte _0800F0D6 @ case 32
	.4byte _0800F0D6 @ case 33
	.4byte _0800ED5C @ case 34
	.4byte _0800F154 @ case 35
	.4byte _0800F2C0 @ case 36
	.4byte _0800F2C0 @ case 37
	.4byte _0800F2C0 @ case 38
	.4byte _0800F2C0 @ case 39
	.4byte _0800F2C0 @ case 40
	.4byte _0800F2C0 @ case 41
	.4byte _0800F2C0 @ case 42
	.4byte _0800F2C0 @ case 43
	.4byte _0800F2C0 @ case 44
	.4byte _0800F2C0 @ case 45
	.4byte _0800F2C0 @ case 46
	.4byte _0800F2C0 @ case 47
	.4byte _0800F2C0 @ case 48
	.4byte _0800F2C0 @ case 49
	.4byte _0800F2C0 @ case 50
	.4byte _0800F2C0 @ case 51
	.4byte _0800F2C0 @ case 52
	.4byte _0800F2C0 @ case 53
	.4byte _0800F2C0 @ case 54
	.4byte _0800F2C0 @ case 55
	.4byte _0800F2C0 @ case 56
	.4byte _0800F2C0 @ case 57
	.4byte _0800F2C0 @ case 58
	.4byte _0800F2C0 @ case 59
	.4byte _0800F2C0 @ case 60
	.4byte _0800F2C0 @ case 61
	.4byte _0800F2C0 @ case 62
	.4byte _0800F2C0 @ case 63
	.4byte _0800EE9E @ case 64
	.4byte _0800EE9E @ case 65
	.4byte _0800F1D0 @ case 66
	.4byte _0800EDB2 @ case 67
_0800ED5C:
	subs r6, r7, #1
	mov r4, sb
	subs r4, #1
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0x87
	bl sub_0800EBFC
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #0x87
	bl sub_0800EBFC
	adds r5, r7, #1
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x87
	bl sub_0800EBFC
	adds r0, r6, #0
	mov r1, sb
	movs r2, #0x87
	bl sub_0800EBFC
	adds r0, r5, #0
	mov r1, sb
	movs r2, #0x87
	bl sub_0800EBFC
	adds r4, #2
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0x87
	bl sub_0800EBFC
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #0x87
	bl sub_0800EBFC
	adds r0, r5, #0
	adds r1, r4, #0
	b _0800F23A
_0800EDB2:
	ldr r0, _0800EE30 @ =gUnknown_08499590
	ldr r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	add r0, sb
	mov r8, r0
	lsls r2, r0, #1
	ldr r3, _0800EE34 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r0, #1
	adds r0, r0, r7
	lsls r0, r0, #1
	ldr r2, _0800EE38 @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r1, [r1]
	cmp r1, #0x46
	bne _0800EE3C
	subs r4, r7, #2
	mov r5, sb
	subs r5, #2
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x25
	bl sub_0800EBFC
	subs r6, r7, #1
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #0x27
	bl MakeTileSimple
	adds r0, r7, #0
	adds r1, r5, #0
	movs r2, #0x87
	bl sub_0800EBFC
	adds r0, r4, #0
	mov r1, r8
	movs r2, #0x65
	bl sub_0800EBFC
	adds r0, r6, #0
	mov r1, r8
	movs r2, #0x67
	bl MakeTileSimple
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x87
	bl sub_0800EBFC
	adds r0, r4, #0
	mov r1, sb
	movs r2, #0x87
	bl sub_0800EBFC
	adds r0, r6, #0
	mov r1, sb
	b _0800F23A
	.align 2, 0
_0800EE30: .4byte gUnknown_08499590
_0800EE34: .4byte 0x0000417A
_0800EE38: .4byte 0x00000A22
_0800EE3C:
	adds r0, r1, #0
	subs r0, #0x44
	cmp r0, #1
	bhi _0800EE78
	subs r5, r7, #1
	mov r4, sb
	subs r4, #2
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x25
	bl sub_0800EBFC
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #0x27
	bl MakeTileSimple
	adds r0, r5, #0
	mov r1, r8
	movs r2, #0x65
	bl sub_0800EBFC
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x67
	bl MakeTileSimple
	adds r0, r5, #0
	mov r1, sb
	b _0800F23A
_0800EE78:
	adds r0, r1, #0
	subs r0, #0x24
	cmp r0, #1
	bls _0800EE82
	b _0800F2C0
_0800EE82:
	subs r4, r7, #1
	adds r0, r4, #0
	mov r1, r8
	movs r2, #0x87
	bl sub_0800EBFC
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x87
	bl sub_0800EBFC
	adds r0, r4, #0
	mov r1, sb
	b _0800F23A
_0800EE9E:
	ldr r0, _0800EF1C @ =gUnknown_08499590
	ldr r1, [r0]
	movs r3, #1
	rsbs r3, r3, #0
	add r3, sb
	mov r8, r3
	lsls r2, r3, #1
	ldr r3, _0800EF20 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, #1
	adds r0, r0, r7
	lsls r0, r0, #1
	ldr r2, _0800EF24 @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r1, [r1]
	cmp r1, #0x46
	bne _0800EF28
	mov r4, sb
	subs r4, #2
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #0x87
	bl sub_0800EBFC
	adds r6, r7, #1
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0x25
	bl sub_0800EBFC
	adds r5, r7, #2
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x27
	bl MakeTileSimple
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x87
	bl sub_0800EBFC
	adds r0, r6, #0
	mov r1, r8
	movs r2, #0x65
	bl sub_0800EBFC
	adds r0, r5, #0
	mov r1, r8
	movs r2, #0x67
	bl MakeTileSimple
	adds r0, r6, #0
	mov r1, sb
	movs r2, #0x87
	bl sub_0800EBFC
	adds r0, r5, #0
	mov r1, sb
	b _0800F23A
	.align 2, 0
_0800EF1C: .4byte gUnknown_08499590
_0800EF20: .4byte 0x0000417A
_0800EF24: .4byte 0x00000A22
_0800EF28:
	cmp r1, #0x47
	bne _0800EF60
	mov r5, sb
	subs r5, #2
	adds r0, r7, #0
	adds r1, r5, #0
	movs r2, #0x25
	bl sub_0800EBFC
	adds r4, r7, #1
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x27
	bl MakeTileSimple
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x65
	bl sub_0800EBFC
	adds r0, r4, #0
	mov r1, r8
	movs r2, #0x67
	bl MakeTileSimple
	adds r0, r4, #0
	mov r1, sb
	b _0800F23A
_0800EF60:
	cmp r1, #0x27
	beq _0800EF66
	b _0800F2C0
_0800EF66:
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x87
	bl sub_0800EBFC
	adds r4, r7, #1
	adds r0, r4, #0
	mov r1, r8
	movs r2, #0x87
	bl sub_0800EBFC
	adds r0, r4, #0
	mov r1, sb
	b _0800F23A
_0800EF82:
	ldr r0, _0800EFE4 @ =gUnknown_08499590
	ldr r1, [r0]
	mov r5, sb
	adds r5, #1
	lsls r2, r5, #1
	ldr r3, _0800EFE8 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r0, #1
	adds r0, r0, r7
	lsls r0, r0, #1
	ldr r2, _0800EFEC @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r1, [r1]
	cmp r1, #0x46
	bne _0800EFF0
	subs r4, r7, #1
	adds r0, r4, #0
	mov r1, sb
	movs r2, #0x27
	bl MakeTileSimple
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x67
	bl MakeTileSimple
	subs r6, r7, #2
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #0x65
	bl sub_0800EBFC
	adds r0, r7, #0
	adds r1, r5, #0
	movs r2, #0x87
	bl sub_0800EBFC
	adds r5, #1
	adds r0, r7, #0
	adds r1, r5, #0
	movs r2, #0x87
	bl sub_0800EBFC
	adds r0, r6, #0
	adds r1, r5, #0
	b _0800F230
	.align 2, 0
_0800EFE4: .4byte gUnknown_08499590
_0800EFE8: .4byte 0x0000417A
_0800EFEC: .4byte 0x00000A22
_0800EFF0:
	adds r0, r1, #0
	subs r0, #0x64
	cmp r0, #1
	bls _0800EFFA
	b _0800F2C0
_0800EFFA:
	subs r4, r7, #1
	adds r0, r4, #0
	mov r1, sb
	movs r2, #0x87
	bl sub_0800EBFC
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x87
	bl sub_0800EBFC
	adds r0, r7, #0
	b _0800F238
_0800F014:
	ldr r0, _0800F054 @ =gUnknown_08499590
	ldr r1, [r0]
	mov r6, sb
	adds r6, #1
	lsls r2, r6, #1
	ldr r3, _0800F058 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, #1
	adds r0, r0, r7
	lsls r0, r0, #1
	ldr r2, _0800F05C @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r1, [r1]
	cmp r1, #0x67
	bne _0800F060
	adds r4, r7, #1
	adds r0, r4, #0
	mov r1, sb
	movs r2, #0x87
	bl sub_0800EBFC
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0x87
	bl sub_0800EBFC
	adds r0, r4, #0
	adds r1, r6, #0
	b _0800F23A
	.align 2, 0
_0800F054: .4byte gUnknown_08499590
_0800F058: .4byte 0x0000417A
_0800F05C: .4byte 0x00000A22
_0800F060:
	cmp r1, #0x47
	bne _0800F086
	adds r4, r7, #1
	adds r0, r4, #0
	mov r1, sb
	movs r2, #0x87
	bl sub_0800EBFC
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0x25
	bl sub_0800EBFC
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0x27
	bl MakeTileSimple
	b _0800F2C0
_0800F086:
	cmp r1, #0x46
	beq _0800F08C
	b _0800F2C0
_0800F08C:
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0x87
	bl sub_0800EBFC
	mov r4, sb
	adds r4, #2
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #0x87
	bl sub_0800EBFC
	adds r5, r7, #1
	adds r0, r5, #0
	mov r1, sb
	movs r2, #0x25
	bl sub_0800EBFC
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x65
	bl sub_0800EBFC
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x87
	bl sub_0800EBFC
	adds r5, r7, #2
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x67
	bl MakeTileSimple
	adds r0, r5, #0
	adds r1, r4, #0
	b _0800F23A
_0800F0D6:
	ldr r0, _0800F148 @ =gUnknown_08499590
	ldr r1, [r0]
	mov r3, sb
	lsls r2, r3, #1
	ldr r3, _0800F14C @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, #1
	adds r0, r0, r7
	lsls r0, r0, #1
	ldr r2, _0800F150 @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r1, [r1]
	cmp r1, #0x46
	beq _0800F0FA
	b _0800F2C0
_0800F0FA:
	adds r5, r7, #1
	mov r4, sb
	subs r4, #1
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x25
	bl sub_0800EBFC
	adds r0, r5, #0
	mov r1, sb
	movs r2, #0x65
	bl sub_0800EBFC
	adds r6, r7, #2
	adds r0, r6, #0
	mov r1, sb
	movs r2, #0x67
	bl MakeTileSimple
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #0x87
	bl sub_0800EBFC
	adds r4, #2
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #0x87
	bl sub_0800EBFC
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x87
	bl sub_0800EBFC
	adds r0, r6, #0
	adds r1, r4, #0
	b _0800F23A
	.align 2, 0
_0800F148: .4byte gUnknown_08499590
_0800F14C: .4byte 0x0000417A
_0800F150: .4byte 0x00000A22
_0800F154:
	ldr r0, _0800F1C4 @ =gUnknown_08499590
	ldr r1, [r0]
	mov r3, sb
	lsls r2, r3, #1
	ldr r3, _0800F1C8 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r0, #1
	adds r0, r0, r7
	lsls r0, r0, #1
	ldr r2, _0800F1CC @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r1, [r1]
	cmp r1, #0x46
	beq _0800F178
	b _0800F2C0
_0800F178:
	subs r5, r7, #1
	mov r4, sb
	subs r4, #1
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x27
	bl MakeTileSimple
	adds r0, r5, #0
	mov r1, sb
	movs r2, #0x67
	bl MakeTileSimple
	subs r6, r7, #2
	adds r0, r6, #0
	mov r1, sb
	movs r2, #0x65
	bl sub_0800EBFC
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #0x87
	bl sub_0800EBFC
	adds r4, #2
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #0x87
	bl sub_0800EBFC
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x87
	bl sub_0800EBFC
	adds r0, r6, #0
	adds r1, r4, #0
	b _0800F23A
	.align 2, 0
_0800F1C4: .4byte gUnknown_08499590
_0800F1C8: .4byte 0x0000417A
_0800F1CC: .4byte 0x00000A22
_0800F1D0:
	ldr r0, _0800F244 @ =gUnknown_08499590
	ldr r1, [r0]
	mov r6, sb
	subs r6, #1
	lsls r2, r6, #1
	ldr r3, _0800F248 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r7
	lsls r0, r0, #1
	ldr r2, _0800F24C @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r1, [r1]
	cmp r1, #0x46
	bne _0800F2C0
	mov r5, sb
	subs r5, #2
	adds r0, r7, #0
	adds r1, r5, #0
	movs r2, #0x27
	bl MakeTileSimple
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0x67
	bl MakeTileSimple
	subs r4, r7, #1
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0x65
	bl sub_0800EBFC
	adds r0, r4, #0
	mov r1, sb
	movs r2, #0x87
	bl sub_0800EBFC
	adds r4, r7, #1
	adds r0, r4, #0
	mov r1, sb
	movs r2, #0x87
	bl sub_0800EBFC
	adds r0, r4, #0
	adds r1, r6, #0
_0800F230:
	movs r2, #0x87
	bl sub_0800EBFC
	adds r0, r4, #0
_0800F238:
	adds r1, r5, #0
_0800F23A:
	movs r2, #0x87
	bl sub_0800EBFC
	b _0800F2C0
	.align 2, 0
_0800F244: .4byte gUnknown_08499590
_0800F248: .4byte 0x0000417A
_0800F24C: .4byte 0x00000A22
_0800F250:
	ldr r0, _0800F2D4 @ =gUnknown_08499590
	ldr r1, [r0]
	mov r6, sb
	adds r6, #1
	lsls r2, r6, #1
	ldr r3, _0800F2D8 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r7
	lsls r0, r0, #1
	ldr r2, _0800F2DC @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r1, [r1]
	cmp r1, #0x46
	bne _0800F2C0
	subs r4, r7, #1
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0x25
	bl sub_0800EBFC
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0x27
	bl MakeTileSimple
	mov r5, sb
	adds r5, #2
	adds r0, r7, #0
	adds r1, r5, #0
	movs r2, #0x67
	bl MakeTileSimple
	adds r0, r4, #0
	mov r1, sb
	movs r2, #0x87
	bl sub_0800EBFC
	adds r4, r7, #1
	adds r0, r4, #0
	mov r1, sb
	movs r2, #0x87
	bl sub_0800EBFC
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0x87
	bl sub_0800EBFC
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x87
	bl sub_0800EBFC
_0800F2C0:
	adds r0, r7, #0
	mov r1, sb
	bl sub_0800CEF8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800F2D4: .4byte gUnknown_08499590
_0800F2D8: .4byte 0x0000417A
_0800F2DC: .4byte 0x00000A22

