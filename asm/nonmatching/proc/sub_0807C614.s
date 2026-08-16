	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807C614
sub_0807C614: @ 0x0807C614
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	bl sub_0807898C
	bl sub_08078AF0
	ldr r2, _0807C814 @ =gUnknown_0300251C
	ldrb r1, [r2, #1]
	movs r0, #0x20
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x1b
	orrs r0, r1
	strb r0, [r2, #1]
	adds r0, r7, #0
	bl sub_08078D80
	ldr r4, _0807C818 @ =gUnknown_03001FE8
	ldrb r1, [r4, #1]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r4, #1]
	ldrb r1, [r4]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r4]
	ldr r1, _0807C81C @ =gUnknown_03002F18
	ldr r2, _0807C820 @ =0x0000FF38
	adds r0, r2, #0
	strh r0, [r1]
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, [r4]
	lsls r1, r1, #0x13
	lsrs r1, r1, #0x1b
	lsls r1, r1, #0xb
	movs r5, #0xc0
	lsls r5, r5, #0x13
	adds r1, r1, r5
	ldr r2, _0807C824 @ =0x01000800
	mov r0, sp
	bl CpuSet
	ldr r0, _0807C828 @ =gUnknown_0823468C
	ldr r1, [r4]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	adds r1, r1, r5
	bl Decompress
	ldr r0, _0807C82C @ =gUnknown_0823456C
	ldr r1, _0807C830 @ =gUnknown_0849957C
	ldr r1, [r1]
	bl Decompress
	movs r0, #8
	movs r1, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	bl sub_08013AFC
	ldr r0, _0807C834 @ =gUnknown_082346D0
	ldr r4, _0807C838 @ =gUnknown_0200FC50
	adds r1, r4, #0
	bl Decompress
	ldr r0, _0807C83C @ =gUnknown_081D933C
	mov sl, r0
	ldr r6, _0807C840 @ =0x06010000
	adds r5, r4, #0
	movs r4, #7
_0807C6BC:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x40
	bl CpuFastSet
	movs r1, #0x80
	lsls r1, r1, #1
	adds r6, r6, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r5, r5, r2
	subs r4, #1
	cmp r4, #0
	bge _0807C6BC
	ldr r0, _0807C844 @ =gUnknown_08234AD0
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	bl sub_0801F114
	ldr r4, _0807C840 @ =0x06010000
	movs r2, #0xf9
	lsls r2, r2, #2
	movs r0, #1
	adds r1, r4, #0
	movs r3, #0x1c
	bl sub_0801F150
	movs r2, #0xd1
	lsls r2, r2, #2
	movs r0, #2
	adds r1, r4, #0
	movs r3, #0x1d
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
	movs r0, #0x4a
	bl sub_0801F234
	movs r0, #0x4b
	bl sub_0801F234
	movs r0, #0x4c
	bl sub_0801F234
	movs r0, #0x4d
	bl sub_0801F234
	movs r0, #0x54
	bl sub_0801F234
	movs r0, #0x56
	bl sub_0801F234
	movs r0, #0x57
	bl sub_0801F234
	movs r0, #0x58
	bl sub_0801F234
	movs r0, #0x5f
	bl sub_0801F234
	movs r0, #0x4f
	bl sub_0801F234
	movs r0, #0x67
	bl sub_0801F234
	movs r0, #0x62
	bl sub_0801F234
	movs r0, #0x65
	bl sub_0801F234
	movs r0, #1
	bl sub_0801A5B0
	ldr r1, _0807C848 @ =gUnknown_03005958
	ldr r0, [r7, #0x58]
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #8
	bl sub_0802D5CC
	bl sub_0807F8E4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _0807C854
	movs r4, #0
	adds r0, r7, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r5, r0, #0
	movs r0, #0x52
	adds r0, r0, r7
	mov r8, r0
	cmp r4, r1
	bge _0807C7E0
	movs r6, #0xf0
	lsls r6, r6, #2
	ldr r1, _0807C84C @ =gUnknown_030058D4
	mov sb, r1
_0807C7C8:
	mov r2, sb
	adds r0, r4, r2
	ldrb r0, [r0]
	adds r1, r6, #0
	bl sub_08043B14
	adds r6, #0xc
	adds r4, #1
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r4, r0
	blt _0807C7C8
_0807C7E0:
	mov r2, sl
	ldr r4, [r2]
	mov r1, r8
	ldrh r0, [r1]
	ldr r2, _0807C850 @ =gUnknown_03005948
	ldr r1, [r7, #0x58]
	adds r1, r1, r2
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	movs r1, #0
	ldrsh r2, [r5, r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	movs r2, #0xf0
	lsls r2, r2, #2
	adds r1, r1, r2
	bl sub_08043B14
	b _0807C86A
	.align 2, 0
_0807C814: .4byte gUnknown_0300251C
_0807C818: .4byte gUnknown_03001FE8
_0807C81C: .4byte gUnknown_03002F18
_0807C820: .4byte 0x0000FF38
_0807C824: .4byte 0x01000800
_0807C828: .4byte gUnknown_0823468C
_0807C82C: .4byte gUnknown_0823456C
_0807C830: .4byte gUnknown_0849957C
_0807C834: .4byte gUnknown_082346D0
_0807C838: .4byte gUnknown_0200FC50
_0807C83C: .4byte gUnknown_081D933C
_0807C840: .4byte 0x06010000
_0807C844: .4byte gUnknown_08234AD0
_0807C848: .4byte gUnknown_03005958
_0807C84C: .4byte gUnknown_030058D4
_0807C850: .4byte gUnknown_03005948
_0807C854:
	adds r4, r7, #0
	adds r4, #0x52
	strh r0, [r4]
	mov r1, sl
	ldr r0, [r1]
	ldrb r0, [r0]
	movs r1, #0xf0
	lsls r1, r1, #2
	bl sub_08043B14
	mov r8, r4
_0807C86A:
	mov r2, sl
	ldr r5, [r2]
	mov r1, r8
	ldrh r0, [r1]
	ldr r4, _0807C95C @ =gUnknown_03005948
	ldr r1, [r7, #0x58]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r5
	ldrb r0, [r0]
	movs r1, #0x40
	movs r2, #1
	bl sub_08043BA4
	mov r2, r8
	ldrh r0, [r2]
	ldr r1, [r7, #0x58]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r5
	ldrb r0, [r0]
	ldr r1, _0807C960 @ =0x06013000
	movs r2, #0x12
	bl sub_08043E3C
	mov r1, r8
	ldrh r0, [r1]
	adds r0, #1
	ldr r1, [r7, #0x58]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r5
	ldrb r0, [r0]
	ldr r1, _0807C964 @ =0x06013480
	movs r2, #0x13
	bl sub_08043E3C
	mov r2, r8
	ldrh r0, [r2]
	adds r0, #2
	ldr r1, [r7, #0x58]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r5
	ldrb r0, [r0]
	ldr r1, _0807C968 @ =0x06013900
	movs r2, #0x14
	bl sub_08043E3C
	mov r1, r8
	ldrh r0, [r1]
	ldr r1, [r7, #0x58]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r5
	ldrb r0, [r0]
	ldr r1, _0807C96C @ =0x06014200
	movs r2, #0x16
	bl sub_08043E3C
	mov r2, r8
	ldrh r0, [r2]
	adds r0, #1
	ldr r1, [r7, #0x58]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r5
	ldrb r0, [r0]
	ldr r1, _0807C970 @ =0x06014680
	movs r2, #0x17
	bl sub_08043E3C
	mov r1, r8
	ldrh r0, [r1]
	adds r0, #2
	ldr r1, [r7, #0x58]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r5
	ldrb r0, [r0]
	ldr r1, _0807C974 @ =0x06014B00
	movs r2, #0x18
	bl sub_08043E3C
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807C95C: .4byte gUnknown_03005948
_0807C960: .4byte 0x06013000
_0807C964: .4byte 0x06013480
_0807C968: .4byte 0x06013900
_0807C96C: .4byte 0x06014200
_0807C970: .4byte 0x06014680
_0807C974: .4byte 0x06014B00

