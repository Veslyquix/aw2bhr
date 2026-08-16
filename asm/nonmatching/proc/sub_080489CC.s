	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080489CC
sub_080489CC: @ 0x080489CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	movs r0, #0x97
	lsls r0, r0, #1
	bl sub_0803B524
	ldr r0, _08048D44 @ =gUnknown_02028E1C
	mov r8, r0
	bl sub_0803C784
	ldr r6, _08048D48 @ =gUnknown_0812A14C
	ldr r5, [r6]
	ldr r0, [r5]
	adds r0, #0x30
	movs r4, #0
	strb r4, [r0]
	ldr r0, [r5]
	ldr r1, _08048D4C @ =0x00000834
	adds r0, r0, r1
	strb r4, [r0]
	ldr r0, [r5]
	ldr r2, _08048D50 @ =0x0000083C
	adds r0, r0, r2
	strb r4, [r0]
	ldr r1, [r5]
	ldr r3, _08048D54 @ =0x00000832
	adds r2, r1, r3
	movs r3, #0
	ldr r0, _08048D58 @ =0x0000FFC8
	strh r0, [r2]
	ldr r0, _08048D5C @ =0x00000838
	adds r1, r1, r0
	strb r3, [r1]
	movs r0, #0
	bl sub_0801A5B0
	movs r0, #0
	movs r1, #1
	bl sub_0802D5CC
	bl sub_08022A34
	ldr r1, [r5]
	strh r4, [r1, #0x20]
	strh r4, [r1, #0x1e]
	ldr r0, _08048D60 @ =gUnknown_0200C420
	ldr r0, [r0]
	str r0, [r1, #0x2c]
	str r0, [r1, #0x28]
	movs r0, #0
	bl sub_0801B780
	movs r7, #0
	mov r1, r8
	ldrb r0, [r1]
	mov sl, r6
	cmp r0, #0xff
	beq _08048A56
_08048A48:
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _08048A48
_08048A56:
	mov r2, sl
	ldr r0, [r2]
	ldr r0, [r0]
	ldr r3, _08048D64 @ =0x00000837
	adds r1, r0, r3
	strb r7, [r1]
	ldr r5, _08048D68 @ =0x00000836
	adds r0, r0, r5
	strb r7, [r0]
	bl sub_08013C00
	bl sub_08013C54
	bl sub_08013CA8
	ldr r0, _08048D6C @ =gUnknown_0823A3D4
	ldr r1, _08048D70 @ =gUnknown_0300251C
	ldr r1, [r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl Decompress
	ldr r0, _08048D74 @ =gUnknown_08239FA4
	ldr r1, _08048D78 @ =gUnknown_08499584
	ldr r1, [r1]
	bl Decompress
	ldr r0, _08048D7C @ =gUnknown_0823BE00
	movs r1, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	bl sub_08013B1C
	movs r0, #0
	movs r1, #3
	bl sub_0802D5CC
	ldr r0, _08048D80 @ =gUnknown_0823E7D4
	ldr r4, _08048D84 @ =gUnknown_08499580
	ldr r1, [r4]
	bl Decompress
	movs r7, #0
	movs r0, #0x9b
	lsls r0, r0, #5
	adds r3, r0, #0
	ldr r2, _08048D88 @ =0x000003FF
_08048ABE:
	ldr r1, [r4]
	lsls r0, r7, #1
	adds r0, r0, r1
	ldrh r5, [r0]
	adds r1, r3, r5
	strh r1, [r0]
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, r2
	bls _08048ABE
	ldr r1, _08048D8C @ =gUnknown_03001400
	ldr r2, _08048D90 @ =0x0000FFD0
	adds r0, r2, #0
	strh r0, [r1]
	bl sub_08013B0C
	ldr r0, _08048D94 @ =gUnknown_085802B4
	ldr r4, _08048D98 @ =gUnknown_0200FC50
	movs r1, #1
	str r1, [sp]
	str r1, [sp, #4]
	movs r1, #3
	str r1, [sp, #8]
	adds r1, r4, #0
	movs r2, #0
	movs r3, #5
	bl sub_08073304
	ldr r1, _08048D9C @ =0x06011560
	movs r0, #0xf
	movs r2, #0x16
	bl sub_08043E3C
	ldr r0, _08048DA0 @ =gUnknown_0823EA40
	adds r1, r4, #0
	bl Decompress
	movs r7, #0
	mov sb, r4
	ldr r6, _08048D88 @ =0x000003FF
	ldr r3, _08048DA4 @ =0x06010000
	mov r8, r3
_08048B14:
	lsls r4, r7, #5
	adds r0, r4, #0
	ands r0, r6
	lsls r0, r0, #5
	add r0, sb
	lsls r5, r7, #3
	adds r1, r5, #0
	adds r1, #0xeb
	ands r1, r6
	lsls r1, r1, #5
	add r1, r8
	movs r2, #0x40
	bl CpuFastSet
	adds r0, r4, #0
	adds r0, #8
	ands r0, r6
	lsls r0, r0, #5
	add r0, sb
	ldr r2, _08048DA8 @ =0x0000012B
	adds r1, r5, r2
	ands r1, r6
	lsls r1, r1, #5
	add r1, r8
	movs r2, #0x40
	bl CpuFastSet
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r4, r3
	ands r0, r6
	lsls r0, r0, #5
	add r0, sb
	ldr r2, _08048DAC @ =0x0000016B
	adds r1, r5, r2
	ands r1, r6
	lsls r1, r1, #5
	add r1, r8
	movs r2, #0x40
	bl CpuFastSet
	movs r3, #0x84
	lsls r3, r3, #1
	adds r0, r4, r3
	ands r0, r6
	lsls r0, r0, #5
	add r0, sb
	ldr r2, _08048DB0 @ =0x000001AB
	adds r1, r5, r2
	ands r1, r6
	lsls r1, r1, #5
	add r1, r8
	movs r2, #0x40
	bl CpuFastSet
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #7
	bls _08048B14
	movs r0, #0xf
	bl GetLoadedCoPalette
	ldr r1, _08048DB4 @ =gUnknown_0823FB7C
	lsls r0, r0, #5
	adds r0, r0, r1
	movs r1, #0xb0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	mov r3, sl
	ldr r0, [r3]
	ldr r0, [r0]
	ldr r5, _08048DB8 @ =0x00000835
	adds r0, r0, r5
	movs r1, #1
	strb r1, [r0]
	bl sub_08013AEC
	bl sub_08013AFC
	bl sub_0801F114
	ldr r0, _08048DBC @ =gUnknown_03002B6C
	ldr r1, [r0]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	movs r2, #0xc0
	lsls r2, r2, #1
	movs r0, #0
	movs r3, #9
	bl sub_0801F150
	movs r0, #0x18
	bl sub_0801F234
	movs r0, #0x19
	bl sub_0801F234
	movs r0, #0x1a
	bl sub_0801F234
	movs r0, #0x13
	bl sub_0801F234
	movs r0, #0x14
	bl sub_0801F234
	ldr r5, _08048DA4 @ =0x06010000
	movs r0, #2
	adds r1, r5, #0
	movs r2, #0x7f
	movs r3, #0x14
	bl sub_0801F150
	movs r0, #0x43
	bl sub_0801F234
	movs r0, #0x44
	bl sub_0801F234
	movs r0, #0x51
	bl sub_0801F234
	ldr r0, _08048DC0 @ =gUnknown_0823E8E8
	ldr r4, _08048D98 @ =gUnknown_0200FC50
	adds r1, r4, #0
	bl Decompress
	ldr r1, _08048DC4 @ =0x06011360
	adds r0, r4, #0
	movs r2, #0x20
	bl CpuFastSet
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r4, r1
	ldr r1, _08048DC8 @ =0x060113E0
	movs r2, #0x20
	bl CpuFastSet
	adds r0, r4, #0
	adds r0, #0x80
	ldr r1, _08048DCC @ =0x06011460
	movs r2, #0x20
	bl CpuFastSet
	movs r2, #0x90
	lsls r2, r2, #3
	adds r0, r4, r2
	ldr r1, _08048DD0 @ =0x060114E0
	movs r2, #0x20
	bl CpuFastSet
	movs r0, #0
	movs r1, #0x18
	bl sub_0802D5CC
	ldr r0, _08048DD4 @ =gUnknown_0823E140
	adds r1, r4, #0
	bl Decompress
	movs r7, #0
	mov r8, r4
	adds r6, r5, #0
_08048C68:
	lsls r5, r7, #2
	adds r0, r5, #0
	adds r0, #8
	lsls r0, r0, #5
	add r0, r8
	lsls r4, r7, #3
	adds r1, r4, #0
	adds r1, #0x5d
	lsls r1, r1, #5
	adds r1, r1, r6
	movs r2, #0x20
	bl CpuFastSet
	adds r5, #0x28
	lsls r5, r5, #5
	add r5, r8
	adds r4, #0x61
	lsls r4, r4, #5
	adds r4, r4, r6
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x20
	bl CpuFastSet
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #1
	bls _08048C68
	ldr r4, _08048DD8 @ =gUnknown_0200FE50
	ldr r1, _08048DDC @ =0x06010DA0
	adds r0, r4, #0
	movs r2, #0x10
	bl CpuFastSet
	movs r3, #0x80
	lsls r3, r3, #3
	adds r4, r4, r3
	ldr r1, _08048DE0 @ =0x06010DE0
	adds r0, r4, #0
	movs r2, #0x10
	bl CpuFastSet
	ldr r0, _08048DE4 @ =gUnknown_0823E550
	movs r1, #0xb8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r3, _08048DBC @ =gUnknown_03002B6C
	ldrb r1, [r3]
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r3]
	ldr r3, _08048DE8 @ =gUnknown_03001FE8
	ldrb r1, [r3]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r3]
	ldr r1, _08048DEC @ =gUnknown_030030B4
	ldrb r0, [r1]
	ands r2, r0
	movs r0, #2
	orrs r2, r0
	strb r2, [r1]
	ldr r2, _08048D70 @ =gUnknown_0300251C
	ldrb r0, [r2]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2]
	ldr r2, _08048DF0 @ =gDispIo
	ldrb r1, [r2, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	ldr r2, _08048DF4 @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	strb r0, [r2]
	ldr r0, _08048DF8 @ =gUnknown_03001418
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08048DFC @ =gUnknown_03001FF8
	strh r1, [r0]
	ldr r2, _08048E00 @ =gUnknown_03002F18
	ldr r5, _08048E04 @ =0x0000FFFE
	adds r0, r5, #0
	strh r0, [r2]
	ldr r0, _08048E08 @ =gUnknown_03002B34
	strh r1, [r0]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08048D44: .4byte gUnknown_02028E1C
_08048D48: .4byte gUnknown_0812A14C
_08048D4C: .4byte 0x00000834
_08048D50: .4byte 0x0000083C
_08048D54: .4byte 0x00000832
_08048D58: .4byte 0x0000FFC8
_08048D5C: .4byte 0x00000838
_08048D60: .4byte gUnknown_0200C420
_08048D64: .4byte 0x00000837
_08048D68: .4byte 0x00000836
_08048D6C: .4byte gUnknown_0823A3D4
_08048D70: .4byte gUnknown_0300251C
_08048D74: .4byte gUnknown_08239FA4
_08048D78: .4byte gUnknown_08499584
_08048D7C: .4byte gUnknown_0823BE00
_08048D80: .4byte gUnknown_0823E7D4
_08048D84: .4byte gUnknown_08499580
_08048D88: .4byte 0x000003FF
_08048D8C: .4byte gUnknown_03001400
_08048D90: .4byte 0x0000FFD0
_08048D94: .4byte gUnknown_085802B4
_08048D98: .4byte gUnknown_0200FC50
_08048D9C: .4byte 0x06011560
_08048DA0: .4byte gUnknown_0823EA40
_08048DA4: .4byte 0x06010000
_08048DA8: .4byte 0x0000012B
_08048DAC: .4byte 0x0000016B
_08048DB0: .4byte 0x000001AB
_08048DB4: .4byte gUnknown_0823FB7C
_08048DB8: .4byte 0x00000835
_08048DBC: .4byte gUnknown_03002B6C
_08048DC0: .4byte gUnknown_0823E8E8
_08048DC4: .4byte 0x06011360
_08048DC8: .4byte 0x060113E0
_08048DCC: .4byte 0x06011460
_08048DD0: .4byte 0x060114E0
_08048DD4: .4byte gUnknown_0823E140
_08048DD8: .4byte gUnknown_0200FE50
_08048DDC: .4byte 0x06010DA0
_08048DE0: .4byte 0x06010DE0
_08048DE4: .4byte gUnknown_0823E550
_08048DE8: .4byte gUnknown_03001FE8
_08048DEC: .4byte gUnknown_030030B4
_08048DF0: .4byte gDispIo
_08048DF4: .4byte gUnknown_030030E0
_08048DF8: .4byte gUnknown_03001418
_08048DFC: .4byte gUnknown_03001FF8
_08048E00: .4byte gUnknown_03002F18
_08048E04: .4byte 0x0000FFFE
_08048E08: .4byte gUnknown_03002B34

