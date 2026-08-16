	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806EB5C
sub_0806EB5C: @ 0x0806EB5C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0xc
	adds r4, r0, #0
	bl sub_0801237C
	bl sub_08012358
	ldr r0, _0806ECFC @ =gUnknown_0849D16C
	bl sub_08012C58
	ldr r2, _0806ED00 @ =gUnknown_030030CC
	ldrb r0, [r2]
	movs r1, #0x40
	mov r8, r1
	mov r5, r8
	orrs r0, r5
	strb r0, [r2]
	ldrb r0, [r2, #1]
	movs r5, #1
	orrs r0, r5
	movs r6, #2
	orrs r0, r6
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r3, _0806ED04 @ =gUnknown_03002B6C
	ldrb r2, [r3]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3]
	ldr r3, _0806ED08 @ =gUnknown_030030B4
	ldrb r2, [r3]
	adds r0, r1, #0
	ands r0, r2
	orrs r0, r5
	strb r0, [r3]
	ldr r2, _0806ED0C @ =gUnknown_03001FE8
	ldrb r0, [r2]
	ands r1, r0
	orrs r1, r6
	strb r1, [r2]
	ldr r2, _0806ED10 @ =gUnknown_0300251C
	ldrb r0, [r2]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2]
	bl sub_08013C00
	bl sub_08013C54
	bl sub_08013CA8
	ldr r0, _0806ED14 @ =gUnknown_0823BDE0
	movs r1, #0
	movs r2, #0x20
	bl sub_08013618
	movs r0, #0
	movs r1, #3
	bl sub_0802D5CC
	ldr r0, _0806ED18 @ =gUnknown_0823A3D4
	ldr r1, _0806ED1C @ =0x06008000
	bl sub_08011CAC
	ldr r0, _0806ED20 @ =gUnknown_08239FA4
	ldr r1, _0806ED24 @ =gUnknown_08499584
	ldr r1, [r1]
	bl sub_08011CAC
	ldr r0, _0806ED28 @ =gUnknown_081A3E28
	ldr r1, _0806ED2C @ =0x06000400
	bl sub_08011CAC
	ldr r0, _0806ED30 @ =gUnknown_0849957C
	ldr r0, [r0]
	ldr r1, _0806ED34 @ =gUnknown_081A3E3C
	movs r2, #0x81
	lsls r2, r2, #5
	bl sub_080718F8
	ldr r0, _0806ED38 @ =gUnknown_081A4000
	ldr r1, _0806ED3C @ =0x06010000
	bl sub_08011CAC
	ldr r0, _0806ED40 @ =gUnknown_081A4450
	ldr r1, _0806ED44 @ =0x06016000
	bl sub_08011CAC
	movs r0, #0
	bl sub_0801A5B0
	movs r0, #6
	movs r1, #0xf
	movs r2, #0x12
	movs r3, #4
	bl sub_0801A444
	bl sub_08013AEC
	bl sub_08013AFC
	bl sub_08013B0C
	bl sub_08013B1C
	ldr r2, _0806ED48 @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	mov r1, r8
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0806ED4C @ =gUnknown_03002020
	movs r3, #0
	strh r3, [r0]
	ldr r1, _0806ED50 @ =gUnknown_03002B28
	movs r0, #0x10
	strh r0, [r1]
	ldr r0, _0806ED54 @ =gUnknown_03001FFC
	strh r3, [r0]
	ldrh r1, [r2]
	ldr r0, _0806ED58 @ =0x0000FFE0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _0806ED5C @ =0x0000E0FF
	ands r0, r1
	movs r5, #0x80
	lsls r5, r5, #4
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #1
	str r0, [r4, #0x30]
	ldr r0, _0806ED60 @ =gUnknown_0202F2D8
	strh r3, [r0]
	adds r0, r4, #0
	adds r0, #0x38
	movs r5, #0
	strb r3, [r0]
	ldr r0, [r4, #0x30]
	movs r1, #0x40
	bl sub_0806F000
	ldr r1, _0806ED64 @ =0x0000FFC8
	movs r0, #0
	movs r2, #0
	bl sub_08072C40
	str r5, [r4, #0x2c]
	ldr r1, _0806ED68 @ =gUnknown_08582764
	ldr r0, [r4, #0x30]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #4]
	strh r0, [r4, #0x34]
	adds r0, r4, #0
	bl sub_0806EB28
	ldr r0, _0806ED6C @ =gUnknown_085826E0
	ldr r1, _0806ED70 @ =gUnknown_02010C50
	movs r2, #0xa
	str r2, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	movs r2, #0x50
	movs r3, #0xe
	bl sub_08073304
	ldrh r0, [r4, #0x34]
	adds r1, r4, #0
	bl sub_0806E5CC
	movs r0, #0
	adds r1, r4, #0
	bl sub_0806E8C8
	adds r0, r4, #0
	bl sub_0806E510
	adds r0, r4, #0
	bl sub_0806E728
	ldr r1, _0806ED74 @ =gUnknown_08582C7C
	movs r0, #8
	adds r2, r4, #0
	bl sub_08073FF4
	ldr r0, _0806ED78 @ =gUnknown_08614200
	movs r1, #0
	bl Proc_Start
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806ECFC: .4byte gUnknown_0849D16C
_0806ED00: .4byte gUnknown_030030CC
_0806ED04: .4byte gUnknown_03002B6C
_0806ED08: .4byte gUnknown_030030B4
_0806ED0C: .4byte gUnknown_03001FE8
_0806ED10: .4byte gUnknown_0300251C
_0806ED14: .4byte gUnknown_0823BDE0
_0806ED18: .4byte gUnknown_0823A3D4
_0806ED1C: .4byte 0x06008000
_0806ED20: .4byte gUnknown_08239FA4
_0806ED24: .4byte gUnknown_08499584
_0806ED28: .4byte gUnknown_081A3E28
_0806ED2C: .4byte 0x06000400
_0806ED30: .4byte gUnknown_0849957C
_0806ED34: .4byte gUnknown_081A3E3C
_0806ED38: .4byte gUnknown_081A4000
_0806ED3C: .4byte 0x06010000
_0806ED40: .4byte gUnknown_081A4450
_0806ED44: .4byte 0x06016000
_0806ED48: .4byte gUnknown_030030E0
_0806ED4C: .4byte gUnknown_03002020
_0806ED50: .4byte gUnknown_03002B28
_0806ED54: .4byte gUnknown_03001FFC
_0806ED58: .4byte 0x0000FFE0
_0806ED5C: .4byte 0x0000E0FF
_0806ED60: .4byte gUnknown_0202F2D8
_0806ED64: .4byte 0x0000FFC8
_0806ED68: .4byte gUnknown_08582764
_0806ED6C: .4byte gUnknown_085826E0
_0806ED70: .4byte gUnknown_02010C50
_0806ED74: .4byte gUnknown_08582C7C
_0806ED78: .4byte gUnknown_08614200

