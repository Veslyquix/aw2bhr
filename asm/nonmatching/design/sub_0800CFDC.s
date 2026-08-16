	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800CFDC
sub_0800CFDC: @ 0x0800CFDC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r3, _0800D028 @ =gUnknown_0808D88C
	ldr r0, [r3]
	ldr r1, [r0]
	lsls r2, r6, #1
	ldr r4, _0800D02C @ =0x0000417A
	adds r0, r1, r4
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r7, _0800D030 @ =0x00000A22
	adds r1, r1, r7
	adds r1, r1, r0
	ldrh r0, [r1]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800D014
	bl _0800E8BA
_0800D014:
	movs r0, #0
	mov sl, r0
	cmp r5, #0
	ble _0800D034
	subs r0, r5, #1
	adds r1, r6, #0
	bl sub_0800E8CC
	mov r8, r0
	b _0800D038
	.align 2, 0
_0800D028: .4byte gUnknown_0808D88C
_0800D02C: .4byte 0x0000417A
_0800D030: .4byte 0x00000A22
_0800D034:
	movs r1, #0
	mov r8, r1
_0800D038:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800E8CC
	adds r7, r0, #0
	ldr r0, _0800D058 @ =gUnknown_08499590
	ldr r0, [r0]
	ldrh r0, [r0]
	subs r0, #1
	cmp r5, r0
	bge _0800D05C
	adds r0, r5, #1
	adds r1, r6, #0
	bl sub_0800E8CC
	b _0800D05E
	.align 2, 0
_0800D058: .4byte gUnknown_08499590
_0800D05C:
	movs r0, #0
_0800D05E:
	mov r2, r8
	ands r2, r7
	mov r8, r2
	ands r7, r0
	mov r0, r8
	subs r0, #6
	cmp r0, #0x19
	bls _0800D070
	b _0800D3D6
_0800D070:
	lsls r0, r0, #2
	ldr r1, _0800D07C @ =_0800D080
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800D07C: .4byte _0800D080
_0800D080: @ jump table
	.4byte _0800D358 @ case 0
	.4byte _0800D170 @ case 1
	.4byte _0800D3D6 @ case 2
	.4byte _0800D3D6 @ case 3
	.4byte _0800D3D6 @ case 4
	.4byte _0800D3D6 @ case 5
	.4byte _0800D2D0 @ case 6
	.4byte _0800D2D0 @ case 7
	.4byte _0800D3D6 @ case 8
	.4byte _0800D3D6 @ case 9
	.4byte _0800D3D6 @ case 10
	.4byte _0800D3D6 @ case 11
	.4byte _0800D3D6 @ case 12
	.4byte _0800D3D6 @ case 13
	.4byte _0800D3D6 @ case 14
	.4byte _0800D3D6 @ case 15
	.4byte _0800D358 @ case 16
	.4byte _0800D170 @ case 17
	.4byte _0800D3D6 @ case 18
	.4byte _0800D3D6 @ case 19
	.4byte _0800D3D6 @ case 20
	.4byte _0800D3D6 @ case 21
	.4byte _0800D0E8 @ case 22
	.4byte _0800D0E8 @ case 23
	.4byte _0800D0E8 @ case 24
	.4byte _0800D0E8 @ case 25
_0800D0E8:
	cmp r5, #0
	bgt _0800D0EE
	b _0800D3D6
_0800D0EE:
	cmp r6, #0
	bgt _0800D0F4
	b _0800D3D6
_0800D0F4:
	ldr r0, _0800D164 @ =gUnknown_08499590
	ldr r1, [r0]
	subs r3, r6, #1
	mov ip, r3
	lsls r0, r3, #1
	ldr r4, _0800D168 @ =0x0000417A
	adds r3, r1, r4
	adds r0, r3, r0
	ldrh r2, [r0]
	subs r0, r2, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	mov sb, r0
	ldr r0, _0800D16C @ =0x00000A22
	adds r1, r1, r0
	add sb, r1
	mov r4, sb
	ldrh r4, [r4]
	mov sb, r4
	mov r0, sb
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800D128
	b _0800D3D6
_0800D128:
	adds r0, r2, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800D13C
	b _0800D3D6
_0800D13C:
	lsls r0, r6, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	subs r0, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800D158
	b _0800D3D6
_0800D158:
	subs r0, r5, #1
	mov r1, ip
	bl sub_0800EAF4
	b _0800D3DC
	.align 2, 0
_0800D164: .4byte gUnknown_08499590
_0800D168: .4byte 0x0000417A
_0800D16C: .4byte 0x00000A22
_0800D170:
	adds r4, r6, #1
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0800E9F4
	mov sb, r4
	cmp r0, #1
	bne _0800D220
	ldr r0, _0800D214 @ =gUnknown_08499590
	ldr r1, [r0]
	ldrh r0, [r1]
	subs r0, #2
	cmp r5, r0
	blt _0800D18E
	b _0800D3D6
_0800D18E:
	ldrh r0, [r1, #2]
	subs r0, #2
	cmp r6, r0
	blt _0800D198
	b _0800D3D6
_0800D198:
	lsls r0, r6, #1
	ldr r2, _0800D218 @ =0x0000417A
	adds r3, r1, r2
	adds r0, r3, r0
	ldrh r2, [r0]
	adds r0, r2, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r4, _0800D21C @ =0x00000A22
	adds r1, r1, r4
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800D1BC
	b _0800D3D6
_0800D1BC:
	adds r0, r2, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800D1D2
	b _0800D3D6
_0800D1D2:
	mov r2, sb
	lsls r0, r2, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	adds r0, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800D1F0
	b _0800D3D6
_0800D1F0:
	adds r0, r6, #2
	lsls r0, r0, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	adds r0, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800D20E
	b _0800D3D6
_0800D20E:
	adds r0, r5, #0
	b _0800D2BC
	.align 2, 0
_0800D214: .4byte gUnknown_08499590
_0800D218: .4byte 0x0000417A
_0800D21C: .4byte 0x00000A22
_0800D220:
	cmp r0, #2
	beq _0800D226
	b _0800D3D6
_0800D226:
	cmp r5, #0
	bgt _0800D22C
	b _0800D3D6
_0800D22C:
	ldr r0, _0800D2C4 @ =gUnknown_08499590
	ldr r1, [r0]
	ldrh r0, [r1]
	subs r0, #1
	cmp r5, r0
	blt _0800D23A
	b _0800D3D6
_0800D23A:
	ldrh r0, [r1, #2]
	subs r0, #2
	cmp r6, r0
	blt _0800D244
	b _0800D3D6
_0800D244:
	lsls r0, r6, #1
	ldr r4, _0800D2C8 @ =0x0000417A
	adds r3, r1, r4
	adds r0, r3, r0
	ldrh r2, [r0]
	subs r0, r2, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r4, _0800D2CC @ =0x00000A22
	adds r1, r1, r4
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800D268
	b _0800D3D6
_0800D268:
	adds r0, r2, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800D27E
	b _0800D3D6
_0800D27E:
	mov r2, sb
	lsls r0, r2, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	adds r0, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800D29C
	b _0800D3D6
_0800D29C:
	adds r0, r6, #2
	lsls r0, r0, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	adds r0, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800D2BA
	b _0800D3D6
_0800D2BA:
	subs r0, r5, #1
_0800D2BC:
	adds r1, r6, #0
	bl sub_0800EB5C
	b _0800D3DC
	.align 2, 0
_0800D2C4: .4byte gUnknown_08499590
_0800D2C8: .4byte 0x0000417A
_0800D2CC: .4byte 0x00000A22
_0800D2D0:
	cmp r5, #0
	bgt _0800D2D6
	b _0800D3D6
_0800D2D6:
	cmp r6, #0
	ble _0800D3D6
	ldr r0, _0800D34C @ =gUnknown_08499590
	ldr r1, [r0]
	lsls r0, r6, #1
	ldr r3, _0800D350 @ =0x0000417A
	adds r4, r1, r3
	adds r0, r4, r0
	ldrh r2, [r0]
	subs r0, r2, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r3, _0800D354 @ =0x00000A22
	adds r1, r1, r3
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800D3D6
	adds r0, r2, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800D3D6
	subs r3, r6, #1
	lsls r0, r3, #1
	adds r0, r4, r0
	ldrh r2, [r0]
	subs r0, r2, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800D3D6
	adds r0, r2, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800D3D6
	subs r0, r5, #1
	adds r1, r3, #0
	bl sub_0800EAF4
	b _0800D3DC
	.align 2, 0
_0800D34C: .4byte gUnknown_08499590
_0800D350: .4byte 0x0000417A
_0800D354: .4byte 0x00000A22
_0800D358:
	cmp r5, #0
	ble _0800D3D6
	ldr r0, _0800D3FC @ =gUnknown_08499590
	ldr r1, [r0]
	ldrh r0, [r1, #2]
	subs r0, #1
	cmp r6, r0
	bge _0800D3D6
	lsls r0, r6, #1
	ldr r4, _0800D400 @ =0x0000417A
	adds r3, r1, r4
	adds r0, r3, r0
	ldrh r2, [r0]
	adds r0, r2, r5
	lsls r0, r0, #1
	ldr r4, _0800D404 @ =0x00000A22
	adds r1, r1, r4
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800D3D6
	subs r0, r2, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800D3D6
	adds r0, r6, #1
	lsls r0, r0, #1
	adds r0, r3, r0
	ldrh r2, [r0]
	subs r0, r2, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800D3D6
	adds r0, r2, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800D3D6
	subs r0, r5, #1
	adds r1, r6, #0
	bl sub_0800EAF4
	movs r0, #1
	mov sl, r0
_0800D3D6:
	mov r1, sl
	cmp r1, #0
	beq _0800D3E4
_0800D3DC:
	cmp r8, r7
	bne _0800D3E4
	bl _0800E8BA
_0800D3E4:
	subs r0, r7, #6
	lsls r2, r6, #1
	mov r8, r2
	cmp r0, #0x19
	bls _0800D3F0
	b _0800D9D4
_0800D3F0:
	lsls r0, r0, #2
	ldr r1, _0800D408 @ =_0800D40C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800D3FC: .4byte gUnknown_08499590
_0800D400: .4byte 0x0000417A
_0800D404: .4byte 0x00000A22
_0800D408: .4byte _0800D40C
_0800D40C: @ jump table
	.4byte _0800D954 @ case 0
	.4byte _0800D740 @ case 1
	.4byte _0800D9D4 @ case 2
	.4byte _0800D9D4 @ case 3
	.4byte _0800D9D4 @ case 4
	.4byte _0800D9D4 @ case 5
	.4byte _0800D8CC @ case 6
	.4byte _0800D8CC @ case 7
	.4byte _0800D9D4 @ case 8
	.4byte _0800D580 @ case 9
	.4byte _0800D9D4 @ case 10
	.4byte _0800D9D4 @ case 11
	.4byte _0800D9D4 @ case 12
	.4byte _0800D9D4 @ case 13
	.4byte _0800D9D4 @ case 14
	.4byte _0800D9D4 @ case 15
	.4byte _0800D954 @ case 16
	.4byte _0800D740 @ case 17
	.4byte _0800D9D4 @ case 18
	.4byte _0800D9D4 @ case 19
	.4byte _0800D9D4 @ case 20
	.4byte _0800D9D4 @ case 21
	.4byte _0800D474 @ case 22
	.4byte _0800D474 @ case 23
	.4byte _0800D6A4 @ case 24
	.4byte _0800D580 @ case 25
_0800D474:
	ldr r0, _0800D574 @ =gUnknown_08499590
	ldr r1, [r0]
	ldrh r0, [r1]
	subs r0, #2
	lsls r3, r6, #1
	mov r8, r3
	cmp r5, r0
	bge _0800D506
	cmp r6, #1
	ble _0800D506
	ldr r7, _0800D578 @ =0x0000417A
	adds r4, r1, r7
	adds r0, r4, r3
	ldrh r3, [r0]
	adds r0, r3, r5
	lsls r0, r0, #1
	ldr r7, _0800D57C @ =0x00000A22
	adds r2, r1, r7
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800D506
	adds r0, r3, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	cmp r0, #0x65
	bne _0800D506
	subs r0, r6, #1
	lsls r0, r0, #1
	adds r0, r4, r0
	ldrh r1, [r0]
	adds r0, r1, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	cmp r0, #0x45
	bne _0800D506
	adds r0, r3, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	cmp r0, #0x67
	bne _0800D506
	adds r0, r1, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800D506
	subs r1, r6, #2
	lsls r0, r1, #1
	adds r0, r4, r0
	ldrh r0, [r0]
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800D506
	b _0800D612
_0800D506:
	ldr r0, _0800D574 @ =gUnknown_08499590
	ldr r1, [r0]
	ldrh r0, [r1]
	subs r0, #1
	cmp r5, r0
	blt _0800D514
	b _0800D9D4
_0800D514:
	cmp r6, #0
	bgt _0800D51A
	b _0800D9D4
_0800D51A:
	ldr r0, _0800D578 @ =0x0000417A
	adds r3, r1, r0
	mov r2, r8
	adds r0, r3, r2
	ldrh r4, [r0]
	adds r0, r4, r5
	lsls r0, r0, #1
	ldr r7, _0800D57C @ =0x00000A22
	adds r2, r1, r7
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800D53C
	b _0800D9D4
_0800D53C:
	subs r1, r6, #1
	lsls r0, r1, #1
	adds r0, r3, r0
	ldrh r3, [r0]
	adds r0, r3, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800D55A
	b _0800D9D4
_0800D55A:
	adds r0, r3, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800D56E
	b _0800D9D4
_0800D56E:
	adds r0, r4, #1
	adds r0, r0, r5
	b _0800D930
	.align 2, 0
_0800D574: .4byte gUnknown_08499590
_0800D578: .4byte 0x0000417A
_0800D57C: .4byte 0x00000A22
_0800D580:
	ldr r0, _0800D61C @ =gUnknown_08499590
	ldr r1, [r0]
	ldrh r0, [r1]
	subs r0, #2
	lsls r2, r6, #1
	mov r8, r2
	cmp r5, r0
	bge _0800D628
	cmp r6, #1
	ble _0800D628
	ldr r3, _0800D620 @ =0x0000417A
	adds r2, r1, r3
	mov r4, r8
	adds r0, r2, r4
	ldrh r0, [r0]
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r7, _0800D624 @ =0x00000A22
	adds r3, r1, r7
	adds r0, r3, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800D628
	subs r1, r6, #2
	lsls r0, r1, #1
	adds r0, r2, r0
	ldrh r4, [r0]
	adds r0, r4, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	cmp r0, #0x27
	bne _0800D628
	subs r0, r6, #1
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r2, [r0]
	adds r0, r2, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	cmp r0, #0x47
	bne _0800D628
	adds r0, r4, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	cmp r0, #0x25
	bne _0800D628
	adds r0, r4, r5
	lsls r0, r0, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800D628
	adds r0, r2, r5
	lsls r0, r0, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800D628
_0800D612:
	adds r0, r5, #0
	bl sub_0800EB5C
	b _0800D9D4
	.align 2, 0
_0800D61C: .4byte gUnknown_08499590
_0800D620: .4byte 0x0000417A
_0800D624: .4byte 0x00000A22
_0800D628:
	ldr r0, _0800D698 @ =gUnknown_08499590
	ldr r1, [r0]
	ldrh r0, [r1]
	subs r0, #1
	cmp r5, r0
	blt _0800D636
	b _0800D9D4
_0800D636:
	cmp r6, #0
	bgt _0800D63C
	b _0800D9D4
_0800D63C:
	ldr r0, _0800D69C @ =0x0000417A
	adds r3, r1, r0
	mov r2, r8
	adds r0, r3, r2
	ldrh r4, [r0]
	adds r0, r4, r5
	lsls r0, r0, #1
	ldr r7, _0800D6A0 @ =0x00000A22
	adds r2, r1, r7
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800D65E
	b _0800D9D4
_0800D65E:
	subs r1, r6, #1
	lsls r0, r1, #1
	adds r0, r3, r0
	ldrh r3, [r0]
	adds r0, r3, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800D67A
	b _0800D9D4
_0800D67A:
	adds r0, r3, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800D690
	b _0800D9D4
_0800D690:
	adds r0, r4, #1
	adds r0, r0, r5
	b _0800D930
	.align 2, 0
_0800D698: .4byte gUnknown_08499590
_0800D69C: .4byte 0x0000417A
_0800D6A0: .4byte 0x00000A22
_0800D6A4:
	ldr r0, _0800D734 @ =gUnknown_08499590
	ldr r1, [r0]
	ldrh r0, [r1]
	subs r0, #1
	lsls r2, r6, #1
	mov r8, r2
	cmp r5, r0
	blt _0800D6B6
	b _0800D9D4
_0800D6B6:
	ldrh r0, [r1, #2]
	subs r0, #1
	cmp r6, r0
	blt _0800D6C0
	b _0800D9D4
_0800D6C0:
	ldr r4, _0800D738 @ =0x0000417A
	adds r3, r1, r4
	adds r0, r3, r2
	ldrh r2, [r0]
	adds r0, r2, r5
	lsls r0, r0, #1
	ldr r7, _0800D73C @ =0x00000A22
	adds r1, r1, r7
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800D6E0
	b _0800D9D4
_0800D6E0:
	adds r0, r2, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800D6F6
	b _0800D9D4
_0800D6F6:
	adds r0, r6, #1
	lsls r0, r0, #1
	adds r0, r3, r0
	ldrh r2, [r0]
	adds r0, r2, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800D712
	b _0800D9D4
_0800D712:
	adds r0, r2, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800D728
	b _0800D9D4
_0800D728:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800EAF4
	b _0800D9D4
	.align 2, 0
_0800D734: .4byte gUnknown_08499590
_0800D738: .4byte 0x0000417A
_0800D73C: .4byte 0x00000A22
_0800D740:
	adds r4, r6, #1
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0800E9F4
	mov sb, r4
	cmp r0, #1
	bne _0800D804
	ldr r0, _0800D7F8 @ =gUnknown_08499590
	ldr r1, [r0]
	ldrh r0, [r1]
	subs r0, #2
	lsls r2, r6, #1
	mov r8, r2
	cmp r5, r0
	blt _0800D762
	b _0800D9D4
_0800D762:
	ldrh r0, [r1, #2]
	subs r0, #2
	cmp r6, r0
	blt _0800D76C
	b _0800D9D4
_0800D76C:
	ldr r4, _0800D7FC @ =0x0000417A
	adds r3, r1, r4
	adds r0, r3, r2
	ldrh r2, [r0]
	adds r0, r2, r5
	lsls r0, r0, #1
	ldr r7, _0800D800 @ =0x00000A22
	adds r1, r1, r7
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800D78C
	b _0800D9D4
_0800D78C:
	adds r0, r2, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800D7A2
	b _0800D9D4
_0800D7A2:
	adds r0, r2, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800D7B8
	b _0800D9D4
_0800D7B8:
	mov r2, sb
	lsls r0, r2, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	adds r0, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800D7D6
	b _0800D9D4
_0800D7D6:
	adds r0, r6, #2
	lsls r0, r0, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	adds r0, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800D7F4
	b _0800D9D4
_0800D7F4:
	adds r0, r5, #0
	b _0800D8B8
	.align 2, 0
_0800D7F8: .4byte gUnknown_08499590
_0800D7FC: .4byte 0x0000417A
_0800D800: .4byte 0x00000A22
_0800D804:
	lsls r3, r6, #1
	mov r8, r3
	cmp r0, #2
	beq _0800D80E
	b _0800D9D4
_0800D80E:
	cmp r5, #0
	bgt _0800D814
	b _0800DAC6
_0800D814:
	ldr r0, _0800D8C0 @ =gUnknown_08499590
	ldr r1, [r0]
	ldrh r0, [r1]
	subs r0, #1
	cmp r5, r0
	blt _0800D822
	b _0800D9D4
_0800D822:
	ldrh r0, [r1, #2]
	subs r0, #2
	cmp r6, r0
	blt _0800D82C
	b _0800D9D4
_0800D82C:
	ldr r4, _0800D8C4 @ =0x0000417A
	adds r3, r1, r4
	mov r7, r8
	adds r0, r3, r7
	ldrh r2, [r0]
	adds r0, r2, r5
	lsls r0, r0, #1
	ldr r4, _0800D8C8 @ =0x00000A22
	adds r1, r1, r4
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800D84E
	b _0800D9D4
_0800D84E:
	subs r0, r2, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800D864
	b _0800D9D4
_0800D864:
	adds r0, r2, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800D87A
	b _0800D9D4
_0800D87A:
	mov r7, sb
	lsls r0, r7, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	adds r0, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800D898
	b _0800D9D4
_0800D898:
	adds r0, r6, #2
	lsls r0, r0, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	adds r0, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800D8B6
	b _0800D9D4
_0800D8B6:
	subs r0, r5, #1
_0800D8B8:
	adds r1, r6, #0
	bl sub_0800EB5C
	b _0800D9D4
	.align 2, 0
_0800D8C0: .4byte gUnknown_08499590
_0800D8C4: .4byte 0x0000417A
_0800D8C8: .4byte 0x00000A22
_0800D8CC:
	ldr r0, _0800D948 @ =gUnknown_08499590
	ldr r1, [r0]
	ldrh r0, [r1]
	subs r0, #1
	lsls r2, r6, #1
	mov r8, r2
	cmp r5, r0
	bge _0800D9D4
	cmp r6, #0
	ble _0800D9D4
	ldr r3, _0800D94C @ =0x0000417A
	adds r4, r1, r3
	adds r0, r4, r2
	ldrh r3, [r0]
	adds r0, r3, r5
	lsls r0, r0, #1
	ldr r7, _0800D950 @ =0x00000A22
	adds r2, r1, r7
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800D9D4
	adds r0, r3, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800D9D4
	subs r1, r6, #1
	lsls r0, r1, #1
	adds r0, r4, r0
	ldrh r3, [r0]
	adds r0, r3, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800D9D4
	adds r0, r3, r5
_0800D930:
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800D9D4
	adds r0, r5, #0
	bl sub_0800EAF4
	b _0800D9D4
	.align 2, 0
_0800D948: .4byte gUnknown_08499590
_0800D94C: .4byte 0x0000417A
_0800D950: .4byte 0x00000A22
_0800D954:
	ldr r0, _0800DBA4 @ =gUnknown_08499590
	ldr r1, [r0]
	ldrh r0, [r1]
	subs r0, #1
	lsls r2, r6, #1
	mov r8, r2
	cmp r5, r0
	bge _0800D9D4
	ldrh r0, [r1, #2]
	subs r0, #1
	cmp r6, r0
	bge _0800D9D4
	ldr r4, _0800DBA8 @ =0x0000417A
	adds r3, r1, r4
	adds r0, r3, r2
	ldrh r2, [r0]
	adds r0, r2, r5
	lsls r0, r0, #1
	ldr r7, _0800DBAC @ =0x00000A22
	adds r1, r1, r7
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800D9D4
	adds r0, r2, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800D9D4
	adds r0, r6, #1
	lsls r0, r0, #1
	adds r0, r3, r0
	ldrh r2, [r0]
	adds r0, r2, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800D9D4
	adds r0, r2, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800D9D4
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800EAF4
_0800D9D4:
	cmp r5, #0
	ble _0800DAC6
	ldr r0, _0800DBA4 @ =gUnknown_08499590
	ldr r1, [r0]
	ldrh r0, [r1]
	subs r0, #1
	cmp r5, r0
	bge _0800DAC6
	cmp r6, #0
	ble _0800DAC6
	ldrh r0, [r1, #2]
	subs r0, #1
	cmp r6, r0
	bge _0800DAC6
	ldr r0, _0800DBA8 @ =0x0000417A
	adds r7, r1, r0
	mov r2, r8
	adds r0, r7, r2
	ldrh r4, [r0]
	adds r0, r4, r5
	lsls r0, r0, #1
	ldr r2, _0800DBAC @ =0x00000A22
	adds r3, r1, r2
	adds r0, r3, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800DA14
	bl _0800E8BA
_0800DA14:
	subs r1, r6, #1
	lsls r0, r1, #1
	adds r0, r7, r0
	ldrh r2, [r0]
	subs r0, r2, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800DAC6
	adds r0, r2, r5
	lsls r0, r0, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800DAC6
	adds r0, r2, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800DAC6
	subs r0, r4, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800DAC6
	adds r0, r4, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800DAC6
	adds r0, r6, #1
	lsls r0, r0, #1
	adds r0, r7, r0
	ldrh r2, [r0]
	subs r0, r2, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800DAC6
	adds r0, r2, r5
	lsls r0, r0, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800DAC6
	adds r0, r2, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800DAC6
	subs r0, r5, #1
	bl sub_0800EB5C
_0800DAC6:
	ldr r0, _0800DBA4 @ =gUnknown_08499590
	ldr r3, [r0]
	ldr r7, _0800DBA8 @ =0x0000417A
	adds r4, r3, r7
	mov r1, r8
	adds r0, r4, r1
	ldrh r0, [r0]
	mov ip, r0
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r7, _0800DBAC @ =0x00000A22
	adds r2, r3, r7
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800DAF0
	bl _0800E8BA
_0800DAF0:
	subs r0, r6, #1
	lsls r1, r0, #1
	adds r1, r4, r1
	ldrh r7, [r1]
	adds r1, r7, r5
	lsls r1, r1, #1
	adds r1, r2, r1
	ldrh r1, [r1]
	mov sl, r0
	cmp r1, #0x64
	bge _0800DB08
	b _0800DC32
_0800DB08:
	cmp r1, #0x65
	ble _0800DBB0
	cmp r1, #0x67
	beq _0800DB12
	b _0800DC32
_0800DB12:
	cmp r5, #0
	bgt _0800DB18
	b _0800DC32
_0800DB18:
	ldrh r0, [r3]
	subs r0, #1
	cmp r5, r0
	blt _0800DB22
	b _0800DC32
_0800DB22:
	cmp r6, #1
	bgt _0800DB28
	b _0800DC32
_0800DB28:
	subs r3, r6, #2
	lsls r0, r3, #1
	adds r0, r4, r0
	ldrh r1, [r0]
	subs r0, r1, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x24
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800DC32
	adds r0, r1, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800DC32
	adds r0, r7, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800DC32
	mov r0, ip
	adds r0, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800DC32
	mov r0, ip
	subs r0, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800DC32
	subs r0, r5, #1
	adds r1, r3, #0
	bl sub_0800EB5C
	b _0800DC32
	.align 2, 0
_0800DBA4: .4byte gUnknown_08499590
_0800DBA8: .4byte 0x0000417A
_0800DBAC: .4byte 0x00000A22
_0800DBB0:
	cmp r5, #0
	ble _0800DC32
	ldrh r0, [r3]
	subs r0, #1
	cmp r5, r0
	bge _0800DC32
	cmp r6, #1
	ble _0800DC32
	subs r3, r6, #2
	lsls r0, r3, #1
	adds r0, r4, r0
	ldrh r1, [r0]
	adds r0, r1, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	cmp r0, #0x27
	bne _0800DC32
	subs r0, r1, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800DC32
	subs r0, r7, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800DC32
	mov r0, ip
	subs r0, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800DC32
	mov r0, ip
	adds r0, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800DC32
	subs r0, r5, #1
	adds r1, r3, #0
	bl sub_0800EB5C
_0800DC32:
	ldr r0, _0800DC9C @ =gUnknown_08499590
	ldr r1, [r0]
	mov r2, sl
	lsls r0, r2, #1
	ldr r4, _0800DCA0 @ =0x0000417A
	adds r3, r1, r4
	adds r0, r3, r0
	ldrh r7, [r0]
	adds r0, r7, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r4, _0800DCA4 @ =0x00000A22
	adds r2, r1, r4
	adds r0, r2, r0
	ldrh r0, [r0]
	cmp r0, #0x65
	bgt _0800DCA8
	cmp r0, #0x64
	bge _0800DD3A
	cmp r0, #0x25
	ble _0800DC5E
	b _0800DE3A
_0800DC5E:
	cmp r0, #0x24
	bge _0800DC64
	b _0800DE3A
_0800DC64:
	ldrh r0, [r1]
	subs r0, #2
	cmp r5, r0
	blt _0800DC6E
	b _0800DE3A
_0800DC6E:
	cmp r6, #1
	bgt _0800DC74
	b _0800DE3A
_0800DC74:
	ldr r0, _0800DC9C @ =gUnknown_08499590
	ldr r1, [r0]
	ldr r7, _0800DCA0 @ =0x0000417A
	adds r4, r1, r7
	mov r2, r8
	adds r0, r4, r2
	ldrh r3, [r0]
	adds r0, r3, r5
	lsls r0, r0, #1
	ldr r7, _0800DCA4 @ =0x00000A22
	adds r2, r1, r7
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800DC9A
	b _0800DE3A
_0800DC9A:
	b _0800DDC8
	.align 2, 0
_0800DC9C: .4byte gUnknown_08499590
_0800DCA0: .4byte 0x0000417A
_0800DCA4: .4byte 0x00000A22
_0800DCA8:
	cmp r0, #0x67
	beq _0800DCAE
	b _0800DE3A
_0800DCAE:
	ldrh r0, [r1]
	subs r0, #2
	cmp r5, r0
	blt _0800DCB8
	b _0800DE3A
_0800DCB8:
	cmp r6, #1
	bgt _0800DCBE
	b _0800DE3A
_0800DCBE:
	mov r1, r8
	adds r0, r3, r1
	ldrh r4, [r0]
	adds r0, r4, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800DCD8
	b _0800DE3A
_0800DCD8:
	subs r1, r6, #2
	lsls r0, r1, #1
	adds r0, r3, r0
	ldrh r3, [r0]
	adds r0, r3, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x24
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800DCF4
	b _0800DE3A
_0800DCF4:
	adds r0, r3, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800DD0A
	b _0800DE3A
_0800DD0A:
	adds r0, r7, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800DD20
	b _0800DE3A
_0800DD20:
	adds r0, r4, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800DD36
	b _0800DE3A
_0800DD36:
	adds r0, r4, #1
	b _0800DDAE
_0800DD3A:
	ldrh r0, [r1]
	subs r0, #2
	cmp r5, r0
	bge _0800DE3A
	cmp r6, #1
	ble _0800DE3A
	mov r4, r8
	adds r0, r3, r4
	ldrh r4, [r0]
	adds r0, r4, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800DE3A
	subs r1, r6, #2
	lsls r0, r1, #1
	adds r0, r3, r0
	ldrh r3, [r0]
	adds r0, r3, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	cmp r0, #0x27
	bne _0800DE3A
	adds r0, r3, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800DE3A
	adds r0, r7, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800DE3A
	adds r0, r4, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800DE3A
	adds r0, r4, #2
_0800DDAE:
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800DE3A
	adds r0, r5, #0
	bl sub_0800EB5C
	b _0800DE3A
_0800DDC8:
	adds r0, r3, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	cmp r0, #0x67
	bne _0800DE3A
	mov r7, sl
	lsls r0, r7, #1
	adds r0, r4, r0
	ldrh r0, [r0]
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800DE3A
	subs r3, r6, #2
	lsls r0, r3, #1
	adds r0, r4, r0
	ldrh r1, [r0]
	adds r0, r1, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800DE3A
	adds r0, r1, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800DE3A
	adds r0, r1, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800DE3A
	adds r0, r5, #0
	adds r1, r3, #0
	bl sub_0800EB5C
_0800DE3A:
	ldr r0, _0800DF08 @ =gUnknown_08499590
	ldr r1, [r0]
	ldr r0, _0800DF0C @ =0x0000417A
	adds r4, r1, r0
	mov r2, r8
	adds r0, r4, r2
	ldrh r3, [r0]
	adds r0, r3, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r7, _0800DF10 @ =0x00000A22
	adds r2, r1, r7
	adds r0, r2, r0
	ldrh r0, [r0]
	adds r7, r6, #1
	mov sb, r7
	cmp r0, #0x24
	bge _0800DE60
	b _0800DFB4
_0800DE60:
	cmp r0, #0x25
	bgt _0800DF14
	ldrh r0, [r1]
	subs r0, #2
	cmp r5, r0
	blt _0800DE6E
	b _0800DFB4
_0800DE6E:
	cmp r6, #0
	bgt _0800DE74
	b _0800DFB4
_0800DE74:
	ldrh r0, [r1, #2]
	subs r0, #1
	cmp r6, r0
	blt _0800DE7E
	b _0800DFB4
_0800DE7E:
	adds r0, r3, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800DE92
	b _0800DFB4
_0800DE92:
	lsls r0, r7, #1
	adds r0, r4, r0
	ldrh r1, [r0]
	adds r0, r1, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	cmp r0, #0x67
	beq _0800DEA8
	b _0800DFB4
_0800DEA8:
	adds r0, r1, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800DFB4
	mov r1, sl
	lsls r0, r1, #1
	adds r0, r4, r0
	ldrh r1, [r0]
	adds r0, r1, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800DFB4
	adds r0, r1, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800DFB4
	adds r0, r1, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800DFB4
	adds r0, r5, #0
	mov r1, sl
	bl sub_0800EB5C
	b _0800DFB4
	.align 2, 0
_0800DF08: .4byte gUnknown_08499590
_0800DF0C: .4byte 0x0000417A
_0800DF10: .4byte 0x00000A22
_0800DF14:
	cmp r0, #0x65
	bgt _0800DFB4
	cmp r0, #0x64
	blt _0800DFB4
	ldrh r0, [r1]
	subs r0, #2
	cmp r5, r0
	bge _0800DFB4
	cmp r6, #0
	ble _0800DFB4
	ldrh r0, [r1, #2]
	subs r0, #1
	cmp r6, r0
	bge _0800DFB4
	adds r0, r3, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800DFB4
	mov r3, sl
	lsls r0, r3, #1
	adds r0, r4, r0
	ldrh r1, [r0]
	adds r0, r1, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	cmp r0, #0x27
	bne _0800DFB4
	adds r0, r1, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800DFB4
	mov r7, sb
	lsls r0, r7, #1
	adds r0, r4, r0
	ldrh r1, [r0]
	adds r0, r1, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800DFB4
	adds r0, r1, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800DFB4
	adds r0, r1, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800DFB4
	adds r0, r5, #0
	mov r1, sl
	bl sub_0800EB5C
_0800DFB4:
	ldr r0, _0800E080 @ =gUnknown_08499590
	ldr r1, [r0]
	mov r2, sb
	lsls r0, r2, #1
	ldr r4, _0800E084 @ =0x0000417A
	adds r3, r1, r4
	adds r0, r3, r0
	ldrh r7, [r0]
	adds r0, r7, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r4, _0800E088 @ =0x00000A22
	adds r2, r1, r4
	adds r0, r2, r0
	ldrh r0, [r0]
	cmp r0, #0x65
	ble _0800DFD8
	b _0800E1B6
_0800DFD8:
	cmp r0, #0x64
	blt _0800DFDE
	b _0800E124
_0800DFDE:
	cmp r0, #0x24
	bge _0800DFE4
	b _0800E1B6
_0800DFE4:
	cmp r0, #0x25
	ble _0800E08C
	cmp r0, #0x27
	beq _0800DFEE
	b _0800E1B6
_0800DFEE:
	ldrh r0, [r1]
	subs r0, #2
	cmp r5, r0
	blt _0800DFF8
	b _0800E1B6
_0800DFF8:
	ldrh r0, [r1, #2]
	subs r0, #2
	cmp r6, r0
	blt _0800E002
	b _0800E1B6
_0800E002:
	mov r1, r8
	adds r0, r3, r1
	ldrh r1, [r0]
	adds r0, r1, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800E01C
	b _0800E1B6
_0800E01C:
	adds r0, r6, #2
	lsls r0, r0, #1
	adds r0, r3, r0
	ldrh r3, [r0]
	adds r0, r3, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x64
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800E038
	b _0800E1B6
_0800E038:
	adds r0, r1, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800E04E
	b _0800E1B6
_0800E04E:
	adds r0, r1, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800E064
	b _0800E1B6
_0800E064:
	adds r0, r7, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800E07A
	b _0800E1B6
_0800E07A:
	adds r0, r3, #2
	adds r0, r0, r5
	b _0800E10A
	.align 2, 0
_0800E080: .4byte gUnknown_08499590
_0800E084: .4byte 0x0000417A
_0800E088: .4byte 0x00000A22
_0800E08C:
	ldrh r0, [r1]
	subs r0, #2
	cmp r5, r0
	blt _0800E096
	b _0800E1B6
_0800E096:
	ldrh r0, [r1, #2]
	subs r0, #2
	cmp r6, r0
	blt _0800E0A0
	b _0800E1B6
_0800E0A0:
	mov r4, r8
	adds r0, r3, r4
	ldrh r1, [r0]
	adds r0, r1, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E1B6
	adds r0, r6, #2
	lsls r0, r0, #1
	adds r0, r3, r0
	ldrh r3, [r0]
	adds r0, r3, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	cmp r0, #0x67
	bne _0800E1B6
	adds r0, r1, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E1B6
	adds r0, r1, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E1B6
	adds r0, r7, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E1B6
	adds r0, r3, r5
_0800E10A:
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E1B6
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800EB5C
	b _0800E1B6
_0800E124:
	ldrh r0, [r1]
	subs r0, #2
	cmp r5, r0
	bge _0800E1B6
	ldrh r0, [r1, #2]
	subs r0, #2
	cmp r6, r0
	bge _0800E1B6
	mov r1, r8
	adds r0, r3, r1
	ldrh r1, [r0]
	adds r0, r1, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E1B6
	adds r0, r1, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	cmp r0, #0x27
	bne _0800E1B6
	adds r0, r7, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E1B6
	adds r0, r6, #2
	lsls r0, r0, #1
	adds r0, r3, r0
	ldrh r1, [r0]
	adds r0, r1, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E1B6
	adds r0, r1, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E1B6
	adds r0, r1, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E1B6
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800EB5C
_0800E1B6:
	ldr r0, _0800E290 @ =gUnknown_08499590
	ldr r1, [r0]
	mov r2, sb
	lsls r0, r2, #1
	ldr r4, _0800E294 @ =0x0000417A
	adds r3, r1, r4
	adds r0, r3, r0
	ldrh r7, [r0]
	adds r0, r7, r5
	lsls r0, r0, #1
	ldr r4, _0800E298 @ =0x00000A22
	adds r2, r1, r4
	adds r0, r2, r0
	ldrh r0, [r0]
	cmp r0, #0x24
	bge _0800E1D8
	b _0800E336
_0800E1D8:
	cmp r0, #0x25
	ble _0800E29C
	cmp r0, #0x27
	beq _0800E1E2
	b _0800E336
_0800E1E2:
	cmp r5, #0
	bgt _0800E1E8
	b _0800E336
_0800E1E8:
	ldrh r0, [r1]
	subs r0, #1
	cmp r5, r0
	blt _0800E1F2
	b _0800E336
_0800E1F2:
	ldrh r0, [r1, #2]
	subs r0, #2
	cmp r6, r0
	blt _0800E1FC
	b _0800E336
_0800E1FC:
	mov r1, r8
	adds r0, r3, r1
	ldrh r1, [r0]
	adds r0, r1, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800E216
	b _0800E336
_0800E216:
	adds r0, r6, #2
	lsls r0, r0, #1
	adds r0, r3, r0
	ldrh r3, [r0]
	subs r0, r3, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x64
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800E234
	b _0800E336
_0800E234:
	subs r0, r1, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E336
	adds r0, r1, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E336
	adds r0, r7, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E336
	adds r0, r3, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E336
	subs r0, r5, #1
	adds r1, r6, #0
	bl sub_0800EB5C
	b _0800E336
	.align 2, 0
_0800E290: .4byte gUnknown_08499590
_0800E294: .4byte 0x0000417A
_0800E298: .4byte 0x00000A22
_0800E29C:
	cmp r5, #0
	ble _0800E336
	ldrh r0, [r1]
	subs r0, #1
	cmp r5, r0
	bge _0800E336
	ldrh r0, [r1, #2]
	subs r0, #2
	cmp r6, r0
	bge _0800E336
	mov r4, r8
	adds r0, r3, r4
	ldrh r1, [r0]
	adds r0, r1, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E336
	adds r0, r6, #2
	lsls r0, r0, #1
	adds r0, r3, r0
	ldrh r3, [r0]
	adds r0, r3, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	cmp r0, #0x67
	bne _0800E336
	subs r0, r1, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E336
	adds r0, r1, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E336
	subs r0, r7, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E336
	subs r0, r3, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E336
	subs r0, r5, #1
	adds r1, r6, #0
	bl sub_0800EB5C
_0800E336:
	ldr r0, _0800E39C @ =gUnknown_08499590
	ldr r1, [r0]
	mov r7, sb
	lsls r0, r7, #1
	ldr r2, _0800E3A0 @ =0x0000417A
	adds r3, r1, r2
	adds r0, r3, r0
	ldrh r7, [r0]
	subs r0, r7, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r4, _0800E3A4 @ =0x00000A22
	adds r2, r1, r4
	adds r0, r2, r0
	ldrh r0, [r0]
	cmp r0, #0x27
	beq _0800E3AE
	cmp r0, #0x27
	bgt _0800E3A8
	cmp r0, #0x25
	ble _0800E362
	b _0800E546
_0800E362:
	cmp r0, #0x24
	bge _0800E368
	b _0800E546
_0800E368:
	cmp r5, #1
	bgt _0800E36E
	b _0800E546
_0800E36E:
	ldrh r0, [r1, #2]
	subs r0, #2
	cmp r6, r0
	blt _0800E378
	b _0800E546
_0800E378:
	ldr r7, _0800E3A0 @ =0x0000417A
	adds r3, r1, r7
	mov r2, r8
	adds r0, r3, r2
	ldrh r2, [r0]
	adds r0, r2, r5
	lsls r0, r0, #1
	adds r1, r1, r4
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800E398
	b _0800E546
_0800E398:
	b _0800E4D2
	.align 2, 0
_0800E39C: .4byte gUnknown_08499590
_0800E3A0: .4byte 0x0000417A
_0800E3A4: .4byte 0x00000A22
_0800E3A8:
	cmp r0, #0x67
	beq _0800E43A
	b _0800E546
_0800E3AE:
	cmp r5, #1
	bgt _0800E3B4
	b _0800E546
_0800E3B4:
	ldrh r0, [r1, #2]
	subs r0, #2
	cmp r6, r0
	blt _0800E3BE
	b _0800E546
_0800E3BE:
	mov r4, r8
	adds r0, r3, r4
	ldrh r1, [r0]
	adds r0, r1, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800E3D8
	b _0800E546
_0800E3D8:
	adds r0, r6, #2
	lsls r0, r0, #1
	adds r0, r3, r0
	ldrh r3, [r0]
	subs r0, r3, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x64
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800E3F6
	b _0800E546
_0800E3F6:
	subs r0, r1, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800E40C
	b _0800E546
_0800E40C:
	subs r0, r1, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800E422
	b _0800E546
_0800E422:
	adds r0, r7, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800E436
	b _0800E546
_0800E436:
	adds r0, r3, r5
	b _0800E4B8
_0800E43A:
	cmp r5, #1
	bgt _0800E440
	b _0800E546
_0800E440:
	ldrh r0, [r1, #2]
	subs r0, #2
	cmp r6, r0
	bge _0800E546
	mov r1, r8
	adds r0, r3, r1
	ldrh r1, [r0]
	adds r0, r1, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E546
	subs r0, r1, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x24
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E546
	adds r0, r7, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E546
	adds r0, r6, #2
	lsls r0, r0, #1
	adds r0, r3, r0
	ldrh r1, [r0]
	adds r0, r1, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E546
	subs r0, r1, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E546
	subs r0, r1, #2
	adds r0, r0, r5
_0800E4B8:
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E546
	subs r0, r5, #2
	adds r1, r6, #0
	bl sub_0800EB5C
	b _0800E546
_0800E4D2:
	adds r0, r6, #2
	lsls r0, r0, #1
	adds r0, r3, r0
	ldrh r7, [r0]
	adds r0, r7, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	cmp r0, #0x67
	bne _0800E546
	subs r0, r2, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E546
	subs r0, r2, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E546
	mov r2, sb
	lsls r0, r2, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	subs r0, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E546
	subs r0, r7, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E546
	subs r0, r5, #2
	adds r1, r6, #0
	bl sub_0800EB5C
_0800E546:
	ldr r0, _0800E56C @ =gUnknown_08499590
	ldr r1, [r0]
	ldr r3, _0800E570 @ =0x0000417A
	adds r4, r1, r3
	mov r7, r8
	adds r0, r4, r7
	ldrh r3, [r0]
	subs r0, r3, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r7, _0800E574 @ =0x00000A22
	adds r2, r1, r7
	adds r0, r2, r0
	ldrh r0, [r0]
	cmp r0, #0x27
	beq _0800E578
	cmp r0, #0x67
	beq _0800E61C
	b _0800E6B6
	.align 2, 0
_0800E56C: .4byte gUnknown_08499590
_0800E570: .4byte 0x0000417A
_0800E574: .4byte 0x00000A22
_0800E578:
	cmp r5, #1
	bgt _0800E57E
	b _0800E6B6
_0800E57E:
	cmp r6, #0
	bgt _0800E584
	b _0800E6B6
_0800E584:
	ldrh r0, [r1, #2]
	subs r0, #1
	cmp r6, r0
	blt _0800E58E
	b _0800E6B6
_0800E58E:
	adds r0, r3, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800E5A2
	b _0800E6B6
_0800E5A2:
	mov r1, sb
	lsls r0, r1, #1
	adds r0, r4, r0
	ldrh r3, [r0]
	subs r0, r3, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x64
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E6B6
	mov r7, sl
	lsls r0, r7, #1
	adds r0, r4, r0
	ldrh r1, [r0]
	subs r0, r1, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E6B6
	subs r0, r1, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E6B6
	adds r0, r1, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E6B6
	adds r0, r3, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E6B6
	subs r0, r5, #2
	mov r1, sl
	bl sub_0800EB5C
	b _0800E6B6
_0800E61C:
	cmp r5, #1
	ble _0800E6B6
	cmp r6, #0
	ble _0800E6B6
	ldrh r0, [r1, #2]
	subs r0, #1
	cmp r6, r0
	bge _0800E6B6
	adds r0, r3, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E6B6
	mov r1, sl
	lsls r0, r1, #1
	adds r0, r4, r0
	ldrh r1, [r0]
	subs r0, r1, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x24
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E6B6
	adds r0, r1, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E6B6
	mov r3, sb
	lsls r0, r3, #1
	adds r0, r4, r0
	ldrh r4, [r0]
	adds r0, r4, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E6B6
	subs r0, r4, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E6B6
	subs r0, r4, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E6B6
	subs r0, r5, #2
	mov r1, sl
	bl sub_0800EB5C
_0800E6B6:
	ldr r0, _0800E6E4 @ =gUnknown_08499590
	ldr r1, [r0]
	mov r4, sl
	lsls r0, r4, #1
	ldr r7, _0800E6E8 @ =0x0000417A
	adds r2, r1, r7
	adds r0, r2, r0
	ldrh r7, [r0]
	subs r0, r7, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r3, _0800E6EC @ =0x00000A22
	adds r1, r1, r3
	adds r0, r1, r0
	ldrh r0, [r0]
	cmp r0, #0x65
	bgt _0800E6F0
	cmp r0, #0x64
	blt _0800E6DE
	b _0800E82E
_0800E6DE:
	cmp r0, #0x27
	beq _0800E6F6
	b _0800E8BA
	.align 2, 0
_0800E6E4: .4byte gUnknown_08499590
_0800E6E8: .4byte 0x0000417A
_0800E6EC: .4byte 0x00000A22
_0800E6F0:
	cmp r0, #0x67
	beq _0800E798
	b _0800E8BA
_0800E6F6:
	cmp r5, #1
	bgt _0800E6FC
	b _0800E8BA
_0800E6FC:
	cmp r6, #1
	bgt _0800E702
	b _0800E8BA
_0800E702:
	mov r4, r8
	adds r0, r2, r4
	ldrh r3, [r0]
	adds r0, r3, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800E71C
	b _0800E8BA
_0800E71C:
	subs r0, r3, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x64
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800E732
	b _0800E8BA
_0800E732:
	subs r4, r6, #2
	lsls r0, r4, #1
	adds r0, r2, r0
	ldrh r3, [r0]
	subs r0, r3, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800E750
	b _0800E8BA
_0800E750:
	subs r0, r3, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800E766
	b _0800E8BA
_0800E766:
	adds r0, r3, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800E77A
	b _0800E8BA
_0800E77A:
	adds r0, r7, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800E78E
	b _0800E8BA
_0800E78E:
	subs r0, r5, #2
	adds r1, r4, #0
	bl sub_0800EB5C
	b _0800E8BA
_0800E798:
	cmp r5, #1
	bgt _0800E79E
	b _0800E8BA
_0800E79E:
	cmp r6, #1
	bgt _0800E7A4
	b _0800E8BA
_0800E7A4:
	mov r3, r8
	adds r0, r2, r3
	ldrh r4, [r0]
	adds r0, r4, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E8BA
	subs r6, #2
	lsls r0, r6, #1
	adds r0, r2, r0
	ldrh r3, [r0]
	subs r0, r3, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x24
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E8BA
	adds r0, r3, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E8BA
	adds r0, r7, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E8BA
	subs r0, r4, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E8BA
	subs r0, r4, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E8BA
	subs r0, r5, #2
	adds r1, r6, #0
	bl sub_0800EB5C
	b _0800E8BA
_0800E82E:
	cmp r5, #1
	ble _0800E8BA
	cmp r6, #1
	ble _0800E8BA
	mov r4, r8
	adds r0, r2, r4
	ldrh r4, [r0]
	adds r0, r4, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E8BA
	subs r6, #2
	lsls r0, r6, #1
	adds r0, r2, r0
	ldrh r3, [r0]
	adds r0, r3, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	cmp r0, #0x27
	bne _0800E8BA
	subs r0, r3, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E8BA
	subs r0, r7, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E8BA
	subs r0, r4, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E8BA
	subs r0, r4, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800E8BA
	subs r0, r5, #2
	adds r1, r6, #0
	bl sub_0800EB5C
_0800E8BA:
	movs r0, #0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

