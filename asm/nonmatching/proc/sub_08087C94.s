	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08087C94
sub_08087C94: @ 0x08087C94
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	bl sub_0807898C
	bl sub_08013B0C
	ldr r5, _08087F80 @ =gUnknown_0300251C
	ldrb r1, [r5, #1]
	movs r0, #0x20
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x1b
	orrs r0, r1
	strb r0, [r5, #1]
	ldr r6, _08087F84 @ =gUnknown_081D9450
	ldr r2, [r6]
	ldrb r1, [r2, #1]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #1]
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r4, #4
	orrs r0, r4
	strb r0, [r2]
	ldr r2, _08087F88 @ =gUnknown_030030A4
	ldrb r0, [r2, #1]
	movs r3, #1
	orrs r0, r3
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	ldr r2, _08087F8C @ =gUnknown_030030DC
	ldrb r0, [r2]
	orrs r0, r3
	movs r1, #2
	orrs r0, r1
	orrs r0, r4
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08087F90 @ =gUnknown_03002B68
	movs r0, #0
	strb r0, [r1]
	ldr r1, _08087F94 @ =gUnknown_03002B30
	movs r0, #0x90
	strb r0, [r1]
	ldr r1, _08087F98 @ =gUnknown_030024E4
	movs r0, #0xf0
	strb r0, [r1]
	ldr r1, _08087F9C @ =gUnknown_030020B8
	movs r0, #0xa0
	strb r0, [r1]
	ldr r2, _08087FA0 @ =gDispIo
	ldrb r1, [r2, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	bl sub_08013AEC
	ldr r0, _08087FA4 @ =gUnknown_0823A3D4
	ldr r1, [r5]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl Decompress
	ldr r0, _08087FA8 @ =gUnknown_08239FA4
	ldr r4, _08087FAC @ =gUnknown_08499584
	ldr r1, [r4]
	bl Decompress
	movs r5, #0
	ldr r3, _08087FB0 @ =0x000003FF
	mov r8, r6
	movs r0, #0x80
	lsls r0, r0, #6
	adds r2, r0, #0
_08087D60:
	ldr r0, [r4]
	lsls r1, r5, #1
	adds r1, r1, r0
	ldrh r6, [r1]
	adds r0, r2, r6
	strh r0, [r1]
	adds r5, #1
	cmp r5, r3
	ble _08087D60
	ldr r0, _08087FB4 @ =gUnknown_0823BE20
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	bl sub_08013B1C
	ldr r1, _08087FB8 @ =gUnknown_03002F18
	ldr r2, _08087FBC @ =0x0000FF28
	adds r0, r2, #0
	strh r0, [r1]
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	mov r6, r8
	ldr r5, [r6]
	ldr r1, [r5]
	lsls r1, r1, #0x13
	lsrs r1, r1, #0x1b
	lsls r1, r1, #0xb
	movs r4, #0xc0
	lsls r4, r4, #0x13
	adds r1, r1, r4
	ldr r2, _08087FC0 @ =0x01000800
	mov r0, sp
	bl CpuSet
	ldr r0, _08087FC4 @ =gUnknown_0823468C
	ldr r1, [r5]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	adds r1, r1, r4
	bl Decompress
	ldr r0, _08087FC8 @ =gUnknown_0823456C
	ldr r1, _08087FCC @ =gUnknown_0849957C
	ldr r1, [r1]
	bl Decompress
	bl sub_08013AFC
	movs r0, #0
	movs r1, #0
	bl sub_0802D5CC
	ldr r0, _08087FD0 @ =gUnknown_082346D0
	ldr r4, _08087FD4 @ =gUnknown_0200FC50
	adds r1, r4, #0
	bl Decompress
	ldr r6, _08087FD8 @ =0x06010000
	movs r5, #7
_08087DDC:
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0x40
	bl CpuFastSet
	movs r0, #0x80
	lsls r0, r0, #1
	adds r6, r6, r0
	movs r2, #0x80
	lsls r2, r2, #3
	adds r4, r4, r2
	subs r5, #1
	cmp r5, #0
	bge _08087DDC
	ldr r0, _08087FDC @ =gUnknown_08234AD0
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0
	str r0, [r7, #0x58]
	str r0, [r7, #0x5c]
	ldr r4, _08087FE0 @ =gUnknown_030058E0
	ldr r5, _08087FE4 @ =gUnknown_03005948
	ldrb r1, [r5]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	movs r1, #0x40
	movs r2, #1
	bl sub_08043BA4
	ldrb r0, [r4]
	movs r1, #0xb3
	lsls r1, r1, #2
	bl sub_08043B14
	ldr r0, [r7, #0x58]
	adds r0, r0, r5
	ldrb r1, [r0]
	movs r0, #0
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r1, _08087FE8 @ =0x06013000
	movs r2, #0x12
	bl sub_08043E3C
	ldr r0, [r7, #0x58]
	adds r0, r0, r5
	ldrb r1, [r0]
	movs r0, #1
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r1, _08087FEC @ =0x06013480
	movs r2, #0x13
	bl sub_08043E3C
	ldr r0, [r7, #0x58]
	adds r0, r0, r5
	ldrb r1, [r0]
	movs r0, #2
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r1, _08087FF0 @ =0x06013900
	movs r2, #0x14
	bl sub_08043E3C
	ldr r0, [r7, #0x58]
	adds r0, r0, r5
	ldrb r1, [r0]
	movs r0, #0
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r1, _08087FF4 @ =0x06014200
	movs r2, #0x16
	bl sub_08043E3C
	ldr r0, [r7, #0x58]
	adds r0, r0, r5
	ldrb r1, [r0]
	movs r0, #1
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r1, _08087FF8 @ =0x06014680
	movs r2, #0x17
	bl sub_08043E3C
	ldr r0, [r7, #0x58]
	adds r0, r0, r5
	ldrb r1, [r0]
	movs r0, #2
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r1, _08087FFC @ =0x06014B00
	movs r2, #0x18
	bl sub_08043E3C
	bl sub_0801F114
	ldr r4, _08087FD8 @ =0x06010000
	movs r2, #0xb6
	lsls r2, r2, #2
	movs r0, #1
	adds r1, r4, #0
	movs r3, #0x1b
	bl sub_0801F150
	movs r2, #0xbb
	lsls r2, r2, #2
	movs r0, #2
	adds r1, r4, #0
	movs r3, #0x1c
	bl sub_0801F150
	movs r0, #0x3e
	bl sub_0801F234
	movs r0, #0x3f
	bl sub_0801F234
	movs r0, #0x40
	bl sub_0801F234
	movs r0, #0x41
	bl sub_0801F234
	movs r0, #0x42
	bl sub_0801F234
	movs r0, #0x43
	bl sub_0801F234
	movs r0, #0x44
	bl sub_0801F234
	movs r0, #0x48
	bl sub_0801F234
	movs r0, #0x49
	bl sub_0801F234
	movs r0, #0x4f
	bl sub_0801F234
	movs r0, #0x83
	bl sub_0801F234
	movs r0, #0x84
	bl sub_0801F234
	movs r0, #0x85
	bl sub_0801F234
	movs r0, #0x86
	bl sub_0801F234
	movs r0, #0x87
	bl sub_0801F234
	movs r0, #0x88
	bl sub_0801F234
	movs r0, #0x89
	bl sub_0801F234
	movs r0, #0x8a
	bl sub_0801F234
	movs r0, #0x8b
	bl sub_0801F234
	ldr r0, _08088000 @ =gUnknown_08616EFC
	adds r1, r7, #0
	bl Proc_Start
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087F80: .4byte gUnknown_0300251C
_08087F84: .4byte gUnknown_081D9450
_08087F88: .4byte gUnknown_030030A4
_08087F8C: .4byte gUnknown_030030DC
_08087F90: .4byte gUnknown_03002B68
_08087F94: .4byte gUnknown_03002B30
_08087F98: .4byte gUnknown_030024E4
_08087F9C: .4byte gUnknown_030020B8
_08087FA0: .4byte gDispIo
_08087FA4: .4byte gUnknown_0823A3D4
_08087FA8: .4byte gUnknown_08239FA4
_08087FAC: .4byte gUnknown_08499584
_08087FB0: .4byte 0x000003FF
_08087FB4: .4byte gUnknown_0823BE20
_08087FB8: .4byte gUnknown_03002F18
_08087FBC: .4byte 0x0000FF28
_08087FC0: .4byte 0x01000800
_08087FC4: .4byte gUnknown_0823468C
_08087FC8: .4byte gUnknown_0823456C
_08087FCC: .4byte gUnknown_0849957C
_08087FD0: .4byte gUnknown_082346D0
_08087FD4: .4byte gUnknown_0200FC50
_08087FD8: .4byte 0x06010000
_08087FDC: .4byte gUnknown_08234AD0
_08087FE0: .4byte gUnknown_030058E0
_08087FE4: .4byte gUnknown_03005948
_08087FE8: .4byte 0x06013000
_08087FEC: .4byte 0x06013480
_08087FF0: .4byte 0x06013900
_08087FF4: .4byte 0x06014200
_08087FF8: .4byte 0x06014680
_08087FFC: .4byte 0x06014B00
_08088000: .4byte gUnknown_08616EFC

