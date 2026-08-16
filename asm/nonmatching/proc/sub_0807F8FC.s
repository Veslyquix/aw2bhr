	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807F8FC
sub_0807F8FC: @ 0x0807F8FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	adds r3, r0, #0
	adds r7, r1, #0
	movs r0, #0
	mov sb, r0
	movs r2, #0
	movs r6, #0
	ldrb r0, [r3]
	cmp r0, #0
	beq _0807F990
	adds r4, r3, #0
	mov r5, sp
_0807F91E:
	ldr r0, _0807F93C @ =gUnknown_030059A0
	add r0, sb
	strb r6, [r0]
	adds r1, r7, r2
	ldrb r0, [r4]
	ldrb r1, [r1]
	cmp r0, r1
	bne _0807F972
	cmp r0, #0x69
	beq _0807F948
	cmp r0, #0x69
	bgt _0807F940
	cmp r0, #0x49
	beq _0807F94C
	b _0807F950
	.align 2, 0
_0807F93C: .4byte gUnknown_030059A0
_0807F940:
	cmp r0, #0x6a
	beq _0807F94C
	cmp r0, #0x6c
	bne _0807F950
_0807F948:
	adds r6, #8
	b _0807F952
_0807F94C:
	adds r6, #0xc
	b _0807F952
_0807F950:
	adds r6, #0xf
_0807F952:
	adds r0, r2, #0
	movs r1, #0x10
	str r2, [sp, #0x2c]
	bl DivRem
	lsls r0, r0, #1
	ldr r2, [sp, #0x2c]
	asrs r1, r2, #4
	lsls r1, r1, #7
	adds r0, r0, r1
	strh r0, [r5]
	adds r4, #1
	adds r5, #2
	movs r1, #1
	add sb, r1
	b _0807F988
_0807F972:
	adds r2, #1
	adds r0, r7, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807F98A
	ldr r0, _0807FA18 @ =0x0000FFFF
	strh r0, [r5]
	adds r4, #1
	adds r5, #2
	movs r2, #1
	add sb, r2
_0807F988:
	movs r2, #0
_0807F98A:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0807F91E
_0807F990:
	ldr r2, _0807FA1C @ =gUnknown_030058D0
	movs r0, #0xf0
	subs r0, r0, r6
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	str r0, [r2]
	ldr r0, _0807FA20 @ =gUnknown_08239228
	ldr r1, _0807FA24 @ =gUnknown_0200FC50
	bl Decompress
	movs r2, #0
	mov r3, sb
	lsls r3, r3, #0x10
	mov sl, r3
	cmp r2, sb
	bge _0807FA04
_0807F9B2:
	lsls r0, r2, #1
	mov r3, sp
	adds r1, r3, r0
	ldrh r1, [r1]
	adds r3, r2, #1
	mov r8, r3
	adds r7, r0, #0
	ldr r0, _0807FA18 @ =0x0000FFFF
	cmp r1, r0
	beq _0807F9FE
	movs r5, #0
	lsls r0, r2, #3
	ldr r3, _0807FA24 @ =gUnknown_0200FC50
	ldr r6, _0807FA28 @ =0x000003FF
	ldr r1, _0807FA2C @ =0x0000030A
	adds r4, r0, r1
_0807F9D2:
	mov r2, sp
	adds r1, r2, r7
	lsls r0, r5, #5
	ldrh r1, [r1]
	adds r0, r0, r1
	ands r0, r6
	lsls r0, r0, #5
	adds r0, r0, r3
	adds r1, r4, #0
	ands r1, r6
	lsls r1, r1, #5
	ldr r2, _0807FA30 @ =0x06010000
	adds r1, r1, r2
	movs r2, #0x10
	str r3, [sp, #0x30]
	bl CpuFastSet
	adds r4, #2
	adds r5, #1
	ldr r3, [sp, #0x30]
	cmp r5, #3
	ble _0807F9D2
_0807F9FE:
	mov r2, r8
	cmp r2, sb
	blt _0807F9B2
_0807FA04:
	mov r3, sl
	lsrs r0, r3, #0x10
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807FA18: .4byte 0x0000FFFF
_0807FA1C: .4byte gUnknown_030058D0
_0807FA20: .4byte gUnknown_08239228
_0807FA24: .4byte gUnknown_0200FC50
_0807FA28: .4byte 0x000003FF
_0807FA2C: .4byte 0x0000030A
_0807FA30: .4byte 0x06010000

