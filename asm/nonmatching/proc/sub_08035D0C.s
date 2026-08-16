	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08035D0C
sub_08035D0C: @ 0x08035D0C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08035C90
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08035D1E
_08035D1A:
	movs r0, #0x2d
	b _08035DEE
_08035D1E:
	adds r0, r4, #0
	bl sub_08035CF4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08035D2E
	movs r0, #0x43
	b _08035DEE
_08035D2E:
	ldr r0, _08035D84 @ =gUnknown_08499590
	ldr r3, [r0]
	adds r0, r4, #0
	adds r0, #0x44
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, r1, #0
	adds r0, #8
	cmp r0, #0
	bge _08035D44
	adds r0, #0xf
_08035D44:
	asrs r0, r0, #4
	lsls r0, r0, #1
	ldr r2, _08035D88 @ =0x0000417A
	adds r1, r3, r2
	adds r1, r1, r0
	ldrh r2, [r1]
	adds r0, r4, #0
	adds r0, #0x42
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r0, #0
	adds r1, #8
	cmp r1, #0
	bge _08035D62
	adds r1, #0xf
_08035D62:
	asrs r1, r1, #4
	adds r1, r2, r1
	ldr r2, _08035D8C @ =0x00001432
	adds r0, r3, r2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x1f
	ands r0, r1
	subs r0, #1
	cmp r0, #0x12
	bhi _08035DEC
	lsls r0, r0, #2
	ldr r1, _08035D90 @ =_08035D94
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08035D84: .4byte gUnknown_08499590
_08035D88: .4byte 0x0000417A
_08035D8C: .4byte 0x00001432
_08035D90: .4byte _08035D94
_08035D94: @ jump table
	.4byte _08035DE8 @ case 0
	.4byte _08035D1A @ case 1
	.4byte _08035DE0 @ case 2
	.4byte _08035DE4 @ case 3
	.4byte _08035DE8 @ case 4
	.4byte _08035DE8 @ case 5
	.4byte _08035D1A @ case 6
	.4byte _08035DE8 @ case 7
	.4byte _08035DEC @ case 8
	.4byte _08035DE8 @ case 9
	.4byte _08035DE8 @ case 10
	.4byte _08035DE8 @ case 11
	.4byte _08035DE4 @ case 12
	.4byte _08035DE8 @ case 13
	.4byte _08035DEC @ case 14
	.4byte _08035DEC @ case 15
	.4byte _08035DEC @ case 16
	.4byte _08035DEC @ case 17
	.4byte _08035D1A @ case 18
_08035DE0:
	movs r0, #0x4b
	b _08035DEE
_08035DE4:
	movs r0, #0x47
	b _08035DEE
_08035DE8:
	movs r0, #0x29
	b _08035DEE
_08035DEC:
	movs r0, #0
_08035DEE:
	pop {r4}
	pop {r1}
	bx r1

