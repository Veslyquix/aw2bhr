	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08073E0C
sub_08073E0C: @ 0x08073E0C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	ldr r3, _08073EF8 @ =gUnknown_081CC034
	ldr r4, [r3]
	ldr r0, _08073EFC @ =gUnknown_0202F8DC
	str r0, [r4]
	ldr r2, _08073F00 @ =gDispIo
	ldrb r0, [r2, #1]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r0, _08073F04 @ =gUnknown_03002B68
	movs r1, #0
	strb r1, [r0]
	ldr r0, _08073F08 @ =gUnknown_03002B30
	strb r1, [r0]
	ldr r1, _08073F0C @ =gUnknown_030024E4
	movs r0, #0xf0
	strb r0, [r1]
	ldr r1, _08073F10 @ =gUnknown_030020B8
	movs r0, #0xa0
	strb r0, [r1]
	movs r0, #0
	mov sl, r0
	mov r8, r0
	movs r1, #0xff
	mov sb, r1
	mov ip, r1
	ldr r0, _08073F14 @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08073F30
	movs r7, #0
_08073E5A:
	ldr r5, [r6, #0x58]
	cmp r7, #0x9f
	bgt _08073EC4
	ldr r3, _08073F18 @ =gUnknown_086141FC
	ldr r2, [r3]
	movs r4, #0xc6
	lsls r4, r4, #3
	adds r0, r5, r4
	movs r1, #0xd4
	lsls r1, r1, #2
	adds r2, r2, r1
	adds r0, r2, r0
	ldrb r1, [r0]
	subs r1, #0x80
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	adds r2, r2, r5
	ldrb r0, [r2]
	subs r0, #0x80
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r2, _08073F1C @ =gUnknown_0202FDE4
	ldr r0, [r2]
	lsls r2, r7, #1
	adds r2, r2, r0
	lsrs r1, r1, #0x19
	subs r1, #0x20
	lsls r1, r1, #8
	movs r0, #0xf0
	orrs r1, r0
	strh r1, [r2]
	adds r0, r3, #0
	adds r2, r3, #0
	cmp r2, r8
	bhs _08073EA2
	mov r0, r8
_08073EA2:
	mov r8, r0
	adds r1, r3, #0
	cmp r2, ip
	bls _08073EAC
	mov r1, ip
_08073EAC:
	mov ip, r1
	adds r0, r4, #0
	adds r1, r4, #0
	cmp r1, sl
	bhs _08073EB8
	mov r0, sl
_08073EB8:
	mov sl, r0
	adds r0, r4, #0
	cmp r1, sb
	bls _08073EC2
	mov r0, sb
_08073EC2:
	mov sb, r0
_08073EC4:
	adds r1, r5, #1
	str r1, [r6, #0x58]
	ldr r0, _08073F20 @ =0x0000062F
	cmp r1, r0
	ble _08073ED4
	ldr r3, _08073F24 @ =0xFFFFF9D1
	adds r0, r5, r3
	str r0, [r6, #0x58]
_08073ED4:
	adds r7, #1
	cmp r7, #0xdf
	ble _08073E5A
	ldr r1, _08073F28 @ =gUnknown_0202FDE8
	mov r4, r8
	mov r2, ip
	subs r0, r4, r2
	movs r2, #0xff
	ands r0, r2
	strh r0, [r1]
	ldr r1, _08073F2C @ =gUnknown_0202FDEA
	mov r3, sl
	mov r4, sb
	subs r0, r3, r4
	ands r0, r2
	strh r0, [r1]
	b _08073F44
	.align 2, 0
_08073EF8: .4byte gUnknown_081CC034
_08073EFC: .4byte gUnknown_0202F8DC
_08073F00: .4byte gDispIo
_08073F04: .4byte gUnknown_03002B68
_08073F08: .4byte gUnknown_03002B30
_08073F0C: .4byte gUnknown_030024E4
_08073F10: .4byte gUnknown_030020B8
_08073F14: .4byte gUnknown_03004008
_08073F18: .4byte gUnknown_086141FC
_08073F1C: .4byte gUnknown_0202FDE4
_08073F20: .4byte 0x0000062F
_08073F24: .4byte 0xFFFFF9D1
_08073F28: .4byte gUnknown_0202FDE8
_08073F2C: .4byte gUnknown_0202FDEA
_08073F30:
	ldr r2, [r6, #0x58]
	adds r1, r2, #0
	adds r1, #0xe0
	str r1, [r6, #0x58]
	ldr r0, _08073F74 @ =0x0000062F
	cmp r1, r0
	ble _08073F44
	ldr r1, _08073F78 @ =0xFFFFFAB0
	adds r0, r2, r1
	str r0, [r6, #0x58]
_08073F44:
	ldr r2, _08073F7C @ =0x040000BA
	movs r0, #0
	strh r0, [r2]
	ldr r1, _08073F80 @ =0x040000B0
	ldr r0, _08073F84 @ =gUnknown_0202FDE4
	ldr r0, [r0]
	str r0, [r1]
	adds r1, #4
	ldr r0, _08073F88 @ =0x04000042
	str r0, [r1]
	adds r1, #4
	movs r0, #1
	strh r0, [r1]
	ldr r3, _08073F8C @ =0x0000A240
	adds r0, r3, #0
	strh r0, [r2]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073F74: .4byte 0x0000062F
_08073F78: .4byte 0xFFFFFAB0
_08073F7C: .4byte 0x040000BA
_08073F80: .4byte 0x040000B0
_08073F84: .4byte gUnknown_0202FDE4
_08073F88: .4byte 0x04000042
_08073F8C: .4byte 0x0000A240

