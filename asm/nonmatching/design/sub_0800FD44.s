	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800FD44
sub_0800FD44: @ 0x0800FD44
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	movs r7, #0
	cmp r2, #0
	bne _0800FD98
	ldr r0, _0800FD88 @ =gUnknown_08499590
	ldr r1, [r0]
	lsls r2, r6, #1
	ldr r3, _0800FD8C @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r2, _0800FD90 @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldr r3, _0800FD94 @ =0xFFFFFE9E
	adds r0, r3, #0
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800FD98
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08010604
	bl _080105FA
	.align 2, 0
_0800FD88: .4byte gUnknown_08499590
_0800FD8C: .4byte 0x0000417A
_0800FD90: .4byte 0x00000A22
_0800FD94: .4byte 0xFFFFFE9E
_0800FD98:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800F8D4
	cmp r0, #0
	beq _0800FDD0
	ldr r0, _0800FDC4 @ =gUnknown_08499590
	ldr r1, [r0]
	lsls r2, r6, #1
	ldr r3, _0800FDC8 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r2, _0800FDCC @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r0, [r1]
	bl _080105FA
	.align 2, 0
_0800FDC4: .4byte gUnknown_08499590
_0800FDC8: .4byte 0x0000417A
_0800FDCC: .4byte 0x00000A22
_0800FDD0:
	movs r4, #0
_0800FDD2:
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_0800F564
	mov r3, sp
	adds r1, r3, r4
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800FDEA
	adds r7, #1
_0800FDEA:
	adds r4, #1
	cmp r4, #3
	ble _0800FDD2
	cmp r7, #0
	bne _0800FDF8
	bl _080105F0
_0800FDF8:
	cmp r7, #1
	bne _0800FE14
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800FE06
	b _080105F0
_0800FE06:
	mov r0, sp
	adds r0, #1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800FE12
	b _080105F0
_0800FE12:
	b _080105E8
_0800FE14:
	cmp r7, #2
	beq _0800FE1A
	b _0800FF4C
_0800FE1A:
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800FE2E
	mov r0, sp
	adds r0, #1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800FE2E
	b _080105F0
_0800FE2E:
	mov r0, sp
	adds r0, #2
	ldrb r1, [r0]
	adds r7, r0, #0
	cmp r1, #0
	beq _0800FE44
	adds r0, #1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800FE44
	b _080105E8
_0800FE44:
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800FED2
	ldrb r0, [r7]
	cmp r0, #0
	beq _0800FE92
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	bl sub_0800F77C
	cmp r0, #1
	bgt _0800FE70
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
	bl sub_0800F77C
	cmp r0, #1
	bgt _0800FE70
	b _08010540
_0800FE70:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
_0800FE76:
	bl sub_0800F77C
	cmp r0, #1
	bgt _0800FE80
	b _080105F0
_0800FE80:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
_0800FE86:
	bl sub_0800F77C
	cmp r0, #1
	bgt _0800FE90
	b _080105E8
_0800FE90:
	b _080105F0
_0800FE92:
	mov r0, sp
	adds r0, #3
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800FED2
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	bl sub_0800F77C
	cmp r0, #1
	bgt _0800FEBA
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_0800F77C
	cmp r0, #1
	bgt _0800FEBA
	b _08010564
_0800FEBA:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	bl sub_0800F77C
	cmp r0, #1
	bgt _0800FECA
	b _080105F0
_0800FECA:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #3
	b _0800FE86
_0800FED2:
	mov r0, sp
	adds r0, #1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800FEDE
	b _080100A4
_0800FEDE:
	ldrb r0, [r7]
	cmp r0, #0
	beq _0800FF0A
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_0800F77C
	cmp r0, #1
	bgt _0800FF02
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
	bl sub_0800F77C
	cmp r0, #1
	bgt _0800FF02
	b _08010588
_0800FF02:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	b _0800FE76
_0800FF0A:
	mov r0, sp
	adds r0, #3
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800FF16
	b _080100A4
_0800FF16:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_0800F77C
	cmp r0, #1
	bgt _0800FF34
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_0800F77C
	cmp r0, #1
	bgt _0800FF34
	b _080105AA
_0800FF34:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_0800F77C
	cmp r0, #1
	bgt _0800FF44
	b _080105F0
_0800FF44:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #3
	b _0800FE86
_0800FF4C:
	cmp r7, #3
	beq _0800FF52
	b _08010324
_0800FF52:
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #2
	bne _0800FF66
	mov r0, sp
	adds r0, #1
	ldrb r0, [r0]
	cmp r0, #2
	bne _0800FF66
	b _080105F0
_0800FF66:
	mov r0, sp
	adds r0, #2
	ldrb r1, [r0]
	adds r7, r0, #0
	cmp r1, #2
	bne _0800FF7C
	adds r0, #1
	ldrb r0, [r0]
	cmp r0, #2
	bne _0800FF7C
	b _080105E8
_0800FF7C:
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #2
	bne _0800FF98
	ldrb r0, [r7]
	cmp r0, #2
	bne _0800FF8C
	b _08010540
_0800FF8C:
	mov r0, sp
	adds r0, #3
	ldrb r0, [r0]
	cmp r0, #2
	bne _0800FF98
	b _08010564
_0800FF98:
	mov r0, sp
	adds r0, #1
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #2
	bne _0800FFB8
	ldrb r0, [r7]
	cmp r0, #2
	bne _0800FFAC
	b _08010588
_0800FFAC:
	mov r0, sp
	adds r0, #3
	ldrb r0, [r0]
	cmp r0, #2
	bne _0800FFB8
	b _080105AA
_0800FFB8:
	mov r0, sp
	ldrb r1, [r0]
	cmp r1, #2
	bne _08010056
	ldrb r0, [r4]
	cmp r0, #0
	beq _0801000A
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_0800F77C
	cmp r0, #1
	bgt _0800FFD6
	b _080105F0
_0800FFD6:
	ldrb r0, [r7]
	cmp r0, #0
	beq _0800FFEE
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
	bl sub_0800F77C
	cmp r0, #1
	bgt _0800FFEC
	b _08010540
_0800FFEC:
	b _080105F0
_0800FFEE:
	mov r0, sp
	adds r0, #3
	ldrb r0, [r0]
	cmp r0, #0
	beq _080100A4
_0800FFF8:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_0800F77C
	cmp r0, #1
	bgt _08010008
	b _08010564
_08010008:
	b _080105F0
_0801000A:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
	bl sub_0800F77C
	cmp r0, #1
	bgt _08010044
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_0800F77C
	cmp r0, #1
	bgt _08010044
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
	bl sub_0800F77C
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_0800F77C
	cmp r4, r0
	bge _08010042
	b _08010540
_08010042:
	b _08010564
_08010044:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
	bl sub_0800F77C
	cmp r0, #1
	bgt _08010054
	b _08010540
_08010054:
	b _0800FFF8
_08010056:
	ldrb r0, [r4]
	cmp r0, #2
	bne _080100F6
	cmp r1, #0
	beq _080100AA
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	bl sub_0800F77C
	cmp r0, #1
	bgt _08010070
	b _080105F0
_08010070:
	ldrb r0, [r7]
	cmp r0, #0
	beq _08010088
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
	bl sub_0800F77C
	cmp r0, #1
	bgt _08010086
	b _08010588
_08010086:
	b _080105F0
_08010088:
	mov r0, sp
	adds r0, #3
	ldrb r0, [r0]
	cmp r0, #0
	beq _080100A4
_08010092:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_0800F77C
	cmp r0, #1
	bgt _080100A2
	b _080105AA
_080100A2:
	b _080105F0
_080100A4:
	movs r0, #0x91
	lsls r0, r0, #1
	b _080105FA
_080100AA:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
	bl sub_0800F77C
	cmp r0, #1
	bgt _080100E4
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_0800F77C
	cmp r0, #1
	bgt _080100E4
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
	bl sub_0800F77C
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_0800F77C
	cmp r4, r0
	bge _080100E2
	b _08010588
_080100E2:
	b _080105AA
_080100E4:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
	bl sub_0800F77C
	cmp r0, #1
	bgt _080100F4
	b _08010588
_080100F4:
	b _08010092
_080100F6:
	ldrb r1, [r7]
	cmp r1, #2
	bne _08010194
	mov r0, sp
	adds r0, #3
	ldrb r0, [r0]
	cmp r0, #0
	beq _08010148
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_0800F77C
	cmp r0, #1
	bgt _08010116
	b _080105E8
_08010116:
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	beq _08010130
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	bl sub_0800F77C
	cmp r0, #1
	bgt _0801012E
	b _08010540
_0801012E:
	b _080105E8
_08010130:
	ldrb r0, [r4]
	cmp r0, #0
	beq _080101E4
_08010136:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_0800F77C
	cmp r0, #1
	bgt _08010146
	b _08010588
_08010146:
	b _080105E8
_08010148:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	bl sub_0800F77C
	cmp r0, #1
	bgt _08010182
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_0800F77C
	cmp r0, #1
	bgt _08010182
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	bl sub_0800F77C
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_0800F77C
	cmp r4, r0
	bge _08010180
	b _08010540
_08010180:
	b _08010588
_08010182:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	bl sub_0800F77C
	cmp r0, #1
	bgt _08010192
	b _08010540
_08010192:
	b _08010136
_08010194:
	mov r0, sp
	adds r0, #3
	ldrb r0, [r0]
	cmp r0, #2
	bne _08010238
	cmp r1, #0
	beq _080101EC
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
	bl sub_0800F77C
	cmp r0, #1
	bgt _080101B2
	b _080105E8
_080101B2:
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	beq _080101CC
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	bl sub_0800F77C
	cmp r0, #1
	bgt _080101CA
	b _08010564
_080101CA:
	b _080105E8
_080101CC:
	ldrb r0, [r4]
	cmp r0, #0
	beq _080101E4
_080101D2:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_0800F77C
	cmp r0, #1
	bgt _080101E2
	b _080105AA
_080101E2:
	b _080105E8
_080101E4:
	ldr r0, _080101E8 @ =0x00000123
	b _080105FA
	.align 2, 0
_080101E8: .4byte 0x00000123
_080101EC:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	bl sub_0800F77C
	cmp r0, #1
	bgt _08010226
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_0800F77C
	cmp r0, #1
	bgt _08010226
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	bl sub_0800F77C
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_0800F77C
	cmp r4, r0
	bge _08010224
	b _08010564
_08010224:
	b _080105AA
_08010226:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	bl sub_0800F77C
	cmp r0, #1
	bgt _08010236
	b _08010564
_08010236:
	b _080101D2
_08010238:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	bl sub_0800F77C
	cmp r0, #1
	bgt _08010256
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_0800F77C
	cmp r0, #1
	bgt _08010256
	b _080105F0
_08010256:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
	bl sub_0800F77C
	cmp r0, #1
	bgt _08010274
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_0800F77C
	cmp r0, #1
	bgt _08010274
	b _080105E8
_08010274:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	bl sub_0800F77C
	cmp r0, #1
	bgt _08010292
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
	bl sub_0800F77C
	cmp r0, #1
	bgt _08010292
	b _08010540
_08010292:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	bl sub_0800F77C
	cmp r0, #1
	bgt _080102B0
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_0800F77C
	cmp r0, #1
	bgt _080102B0
	b _08010564
_080102B0:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_0800F77C
	cmp r0, #1
	bgt _080102CE
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
	bl sub_0800F77C
	cmp r0, #1
	bgt _080102CE
	b _08010588
_080102CE:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_0800F77C
	cmp r0, #1
	bgt _080102EC
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_0800F77C
	cmp r0, #1
	bgt _080102EC
	b _080105AA
_080102EC:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	bl sub_0800F77C
	cmp r0, #1
	bgt _080102FC
	b _080105F0
_080102FC:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_0800F77C
	cmp r0, #1
	bgt _0801030C
	b _080105F0
_0801030C:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
	bl sub_0800F77C
	cmp r0, #1
	bgt _0801031C
	b _080105E8
_0801031C:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #3
	b _0800FE86
_08010324:
	cmp r7, #4
	beq _0801032A
	b _080105F6
_0801032A:
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #2
	bne _0801033E
	mov r0, sp
	adds r0, #1
	ldrb r0, [r0]
	cmp r0, #2
	bne _0801033E
	b _080105F0
_0801033E:
	mov r0, sp
	adds r0, #2
	ldrb r1, [r0]
	adds r7, r0, #0
	cmp r1, #2
	bne _08010354
	adds r0, #1
	ldrb r0, [r0]
	cmp r0, #2
	bne _08010354
	b _080105E8
_08010354:
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #2
	bne _08010370
	ldrb r0, [r7]
	cmp r0, #2
	bne _08010364
	b _08010540
_08010364:
	mov r0, sp
	adds r0, #3
	ldrb r0, [r0]
	cmp r0, #2
	bne _08010370
	b _08010564
_08010370:
	mov r0, sp
	adds r0, #1
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #2
	bne _08010390
	ldrb r0, [r7]
	cmp r0, #2
	bne _08010384
	b _08010588
_08010384:
	mov r0, sp
	adds r0, #3
	ldrb r0, [r0]
	cmp r0, #2
	bne _08010390
	b _080105AA
_08010390:
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #2
	bne _080103EA
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_0800F77C
	cmp r0, #0
	bgt _080103A8
	b _080105F0
_080103A8:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
	bl sub_0800F77C
	cmp r0, #0
	bgt _080103B8
	b _08010540
_080103B8:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_0800F77C
	cmp r0, #0
	bgt _080103C8
	b _08010564
_080103C8:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_0800F77C
	cmp r0, #1
	bgt _080103D8
	b _080105F0
_080103D8:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
	bl sub_0800F77C
	cmp r0, #1
	bgt _080103E8
	b _08010540
_080103E8:
	b _0800FFF8
_080103EA:
	ldrb r0, [r4]
	cmp r0, #2
	bne _08010442
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	bl sub_0800F77C
	cmp r0, #0
	bgt _08010400
	b _080105F0
_08010400:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
	bl sub_0800F77C
	cmp r0, #0
	bgt _08010410
	b _08010588
_08010410:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_0800F77C
	cmp r0, #0
	bgt _08010420
	b _080105AA
_08010420:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	bl sub_0800F77C
	cmp r0, #1
	bgt _08010430
	b _080105F0
_08010430:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
	bl sub_0800F77C
	cmp r0, #1
	bgt _08010440
	b _08010588
_08010440:
	b _08010092
_08010442:
	ldrb r0, [r7]
	cmp r0, #2
	bne _08010496
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_0800F77C
	cmp r0, #0
	bgt _08010458
	b _080105E8
_08010458:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	bl sub_0800F77C
	cmp r0, #0
	ble _08010540
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_0800F77C
	cmp r0, #0
	bgt _08010476
	b _08010588
_08010476:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_0800F77C
	cmp r0, #1
	bgt _08010486
	b _080105E8
_08010486:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	bl sub_0800F77C
	cmp r0, #1
	ble _08010540
	b _08010136
_08010496:
	mov r0, sp
	adds r0, #3
	ldrb r0, [r0]
	cmp r0, #2
	bne _080104EC
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
	bl sub_0800F77C
	cmp r0, #0
	bgt _080104B0
	b _080105E8
_080104B0:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	bl sub_0800F77C
	cmp r0, #0
	ble _08010564
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_0800F77C
	cmp r0, #0
	ble _080105AA
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
	bl sub_0800F77C
	cmp r0, #1
	bgt _080104DC
	b _080105E8
_080104DC:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	bl sub_0800F77C
	cmp r0, #1
	ble _08010564
	b _080101D2
_080104EC:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	bl sub_0800F77C
	cmp r0, #1
	bgt _08010508
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_0800F77C
	cmp r0, #1
	ble _080105F0
_08010508:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
	bl sub_0800F77C
	cmp r0, #1
	bgt _08010524
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_0800F77C
	cmp r0, #1
	ble _080105E8
_08010524:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	bl sub_0800F77C
	cmp r0, #1
	bgt _08010548
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
	bl sub_0800F77C
	cmp r0, #1
	bgt _08010548
_08010540:
	ldr r0, _08010544 @ =0x00000161
	b _080105FA
	.align 2, 0
_08010544: .4byte 0x00000161
_08010548:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	bl sub_0800F77C
	cmp r0, #1
	bgt _0801056C
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_0800F77C
	cmp r0, #1
	bgt _0801056C
_08010564:
	ldr r0, _08010568 @ =0x00000141
	b _080105FA
	.align 2, 0
_08010568: .4byte 0x00000141
_0801056C:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_0800F77C
	cmp r0, #1
	bgt _0801058E
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
	bl sub_0800F77C
	cmp r0, #1
	bgt _0801058E
_08010588:
	movs r0, #0xb0
	lsls r0, r0, #1
	b _080105FA
_0801058E:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_0800F77C
	cmp r0, #1
	bgt _080105B0
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_0800F77C
	cmp r0, #1
	bgt _080105B0
_080105AA:
	movs r0, #0xa0
	lsls r0, r0, #1
	b _080105FA
_080105B0:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	bl sub_0800F77C
	cmp r0, #1
	ble _080105F0
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_0800F77C
	cmp r0, #1
	ble _080105F0
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
	bl sub_0800F77C
	cmp r0, #1
	ble _080105E8
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_0800F77C
	cmp r0, #1
	bgt _080105F0
_080105E8:
	ldr r0, _080105EC @ =0x00000143
	b _080105FA
	.align 2, 0
_080105EC: .4byte 0x00000143
_080105F0:
	movs r0, #0xa1
	lsls r0, r0, #1
	b _080105FA
_080105F6:
	movs r0, #1
	rsbs r0, r0, #0
_080105FA:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

