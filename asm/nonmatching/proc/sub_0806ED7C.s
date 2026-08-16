	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806ED7C
sub_0806ED7C: @ 0x0806ED7C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	bl sub_0801237C
	bl sub_08012358
	ldr r0, _0806EF74 @ =gUnknown_0849D16C
	bl sub_08012C58
	ldr r1, _0806EF78 @ =gUnknown_030030CC
	ldrb r0, [r1]
	movs r2, #0x40
	mov sl, r2
	mov r2, sl
	orrs r0, r2
	strb r0, [r1]
	ldrb r0, [r1, #1]
	movs r4, #1
	orrs r0, r4
	movs r2, #2
	mov sb, r2
	mov r2, sb
	orrs r0, r2
	movs r2, #4
	mov r8, r2
	mov r2, r8
	orrs r0, r2
	movs r6, #8
	orrs r0, r6
	movs r5, #0x10
	orrs r0, r5
	strb r0, [r1, #1]
	ldr r3, _0806EF7C @ =gUnknown_03002B6C
	ldrb r2, [r3]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3]
	ldr r3, _0806EF80 @ =gUnknown_030030B4
	ldrb r2, [r3]
	adds r0, r1, #0
	ands r0, r2
	orrs r0, r4
	strb r0, [r3]
	ldr r2, _0806EF84 @ =gUnknown_03001FE8
	ldrb r0, [r2]
	ands r1, r0
	mov r0, sb
	orrs r1, r0
	strb r1, [r2]
	ldr r2, _0806EF88 @ =gUnknown_0300251C
	ldrb r0, [r2]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2]
	bl sub_08013C00
	bl sub_08013C54
	bl sub_08013CA8
	ldr r0, _0806EF8C @ =gUnknown_0823BDE0
	movs r1, #0
	movs r2, #0x20
	bl sub_08013618
	movs r0, #0
	movs r1, #3
	bl sub_0802D5CC
	ldr r0, _0806EF90 @ =gUnknown_0823A3D4
	ldr r1, _0806EF94 @ =0x06008000
	bl sub_08011CAC
	ldr r0, _0806EF98 @ =gUnknown_08239FA4
	ldr r1, _0806EF9C @ =gUnknown_08499584
	ldr r1, [r1]
	bl sub_08011CAC
	ldr r0, _0806EFA0 @ =gUnknown_081A3E28
	ldr r1, _0806EFA4 @ =0x06000400
	bl sub_08011CAC
	ldr r0, _0806EFA8 @ =gUnknown_0849957C
	ldr r0, [r0]
	ldr r1, _0806EFAC @ =gUnknown_081A3E3C
	movs r2, #0x81
	lsls r2, r2, #5
	bl sub_080718F8
	ldr r0, _0806EFB0 @ =gUnknown_081A4000
	ldr r1, _0806EFB4 @ =0x06010000
	bl sub_08011CAC
	ldr r0, _0806EFB8 @ =gUnknown_081A4450
	ldr r1, _0806EFBC @ =0x06016000
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
	ldr r3, _0806EFC0 @ =gUnknown_030030E0
	ldrb r1, [r3]
	movs r0, #0x3f
	ands r0, r1
	mov r1, sl
	orrs r0, r1
	strb r0, [r3]
	ldr r0, _0806EFC4 @ =gUnknown_03002020
	movs r2, #0
	strh r2, [r0]
	ldr r1, _0806EFC8 @ =gUnknown_03002B28
	movs r0, #0x10
	strh r0, [r1]
	ldr r0, _0806EFCC @ =gUnknown_03001FFC
	strh r2, [r0]
	ldrh r1, [r3]
	ldr r0, _0806EFD0 @ =0x0000FFE0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _0806EFD4 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3]
	ldr r4, _0806EFD8 @ =gUnknown_030030A4
	ldrb r2, [r4, #1]
	movs r0, #2
	rsbs r0, r0, #0
	adds r1, r0, #0
	ands r1, r2
	movs r2, #3
	rsbs r2, r2, #0
	ands r1, r2
	mov r2, r8
	orrs r1, r2
	orrs r1, r6
	orrs r1, r5
	ldr r3, _0806EFDC @ =gUnknown_030030DC
	ldrb r2, [r3]
	ands r0, r2
	mov r2, sb
	orrs r0, r2
	mov r2, r8
	orrs r0, r2
	orrs r0, r6
	orrs r0, r5
	strb r0, [r3]
	movs r2, #0x20
	orrs r1, r2
	strb r1, [r4, #1]
	ldrb r0, [r3, #1]
	orrs r0, r2
	strb r0, [r3, #1]
	ldr r0, _0806EFE0 @ =gUnknown_0202F2D0
	ldr r0, [r0]
	str r0, [r7, #0x30]
	ldr r1, _0806EFE4 @ =gUnknown_0202F2CC
	ldr r1, [r1]
	str r1, [r7, #0x2c]
	ldr r1, _0806EFE8 @ =gUnknown_0202F2D4
	ldrh r1, [r1]
	movs r4, #0
	strh r1, [r7, #0x34]
	ldr r1, _0806EFEC @ =gUnknown_0202F2D6
	ldrh r1, [r1]
	strh r1, [r7, #0x36]
	movs r1, #0x40
	bl sub_0806F000
	ldr r0, [r7, #0x30]
	movs r1, #1
	ands r0, r1
	lsls r0, r0, #7
	movs r1, #0x48
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	movs r2, #0
	bl sub_08072C40
	adds r0, r7, #0
	bl sub_0806EB28
	ldr r0, _0806EFF0 @ =gUnknown_085826E0
	ldr r1, _0806EFF4 @ =gUnknown_02010C50
	movs r2, #0xa
	str r2, [sp]
	str r4, [sp, #4]
	str r7, [sp, #8]
	movs r2, #0x50
	movs r3, #0xe
	bl sub_08073304
	ldrh r0, [r7, #0x34]
	adds r1, r7, #0
	bl sub_0806E5CC
	movs r0, #0
	adds r1, r7, #0
	bl sub_0806E8C8
	adds r0, r7, #0
	bl sub_0806E510
	adds r0, r7, #0
	bl sub_0806E728
	ldr r1, _0806EFF8 @ =gUnknown_08582C7C
	movs r0, #8
	adds r2, r7, #0
	bl sub_08073FF4
	ldr r0, [r7, #0x2c]
	cmp r0, #0
	beq _0806EF64
	ldr r0, _0806EFFC @ =gUnknown_08582C5C
	adds r1, r7, #0
	bl Proc_Start
_0806EF64:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806EF74: .4byte gUnknown_0849D16C
_0806EF78: .4byte gUnknown_030030CC
_0806EF7C: .4byte gUnknown_03002B6C
_0806EF80: .4byte gUnknown_030030B4
_0806EF84: .4byte gUnknown_03001FE8
_0806EF88: .4byte gUnknown_0300251C
_0806EF8C: .4byte gUnknown_0823BDE0
_0806EF90: .4byte gUnknown_0823A3D4
_0806EF94: .4byte 0x06008000
_0806EF98: .4byte gUnknown_08239FA4
_0806EF9C: .4byte gUnknown_08499584
_0806EFA0: .4byte gUnknown_081A3E28
_0806EFA4: .4byte 0x06000400
_0806EFA8: .4byte gUnknown_0849957C
_0806EFAC: .4byte gUnknown_081A3E3C
_0806EFB0: .4byte gUnknown_081A4000
_0806EFB4: .4byte 0x06010000
_0806EFB8: .4byte gUnknown_081A4450
_0806EFBC: .4byte 0x06016000
_0806EFC0: .4byte gUnknown_030030E0
_0806EFC4: .4byte gUnknown_03002020
_0806EFC8: .4byte gUnknown_03002B28
_0806EFCC: .4byte gUnknown_03001FFC
_0806EFD0: .4byte 0x0000FFE0
_0806EFD4: .4byte 0x0000E0FF
_0806EFD8: .4byte gUnknown_030030A4
_0806EFDC: .4byte gUnknown_030030DC
_0806EFE0: .4byte gUnknown_0202F2D0
_0806EFE4: .4byte gUnknown_0202F2CC
_0806EFE8: .4byte gUnknown_0202F2D4
_0806EFEC: .4byte gUnknown_0202F2D6
_0806EFF0: .4byte gUnknown_085826E0
_0806EFF4: .4byte gUnknown_02010C50
_0806EFF8: .4byte gUnknown_08582C7C
_0806EFFC: .4byte gUnknown_08582C5C

