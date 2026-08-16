	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806DFF0
sub_0806DFF0: @ 0x0806DFF0
	push {r4, r5, r6, lr}
	sub sp, #0xc
	bl sub_0806DF20
	ldr r1, _0806E044 @ =gUnknown_0816E1C0
	ldr r0, [r1]
	ldr r0, [r0]
	adds r0, #0x2d
	ldrb r0, [r0]
	adds r5, r1, #0
	cmp r0, #0
	beq _0806E00A
	b _0806E114
_0806E00A:
	ldr r0, _0806E048 @ =gUnknown_0816E1C4
	ldr r1, [r0]
	ldrb r1, [r1]
	adds r4, r0, #0
	ldr r3, _0806E04C @ =gUnknown_0816E1C8
	cmp r1, #0
	bne _0806E026
	ldr r0, [r3]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0806E03A
_0806E026:
	ldr r0, [r3]
	ldr r2, [r0]
	ldrh r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0806E054
	ldr r1, [r4]
	movs r0, #1
	strb r0, [r1]
_0806E03A:
	ldr r0, _0806E050 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
	b _0806E114
	.align 2, 0
_0806E044: .4byte gUnknown_0816E1C0
_0806E048: .4byte gUnknown_0816E1C4
_0806E04C: .4byte gUnknown_0816E1C8
_0806E050: .4byte gUnknown_03001FBC
_0806E054:
	ldr r6, [r5]
	ldr r0, [r6]
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806E0A8
	ldrh r1, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0806E0A8
	movs r0, #0x73
	bl sub_0803B4DC
	bl sub_080733B8
	ldr r0, _0806E0A0 @ =gUnknown_085802A4
	ldr r1, _0806E0A4 @ =gUnknown_0200FC50
	movs r2, #0x8c
	lsls r2, r2, #2
	movs r4, #1
	str r4, [sp]
	str r4, [sp, #4]
	movs r3, #3
	str r3, [sp, #8]
	movs r3, #0xf
	bl sub_08073304
	bl sub_0806D34C
	bl sub_0806D53C
	ldr r0, [r6]
	adds r0, #0x30
	strb r4, [r0]
	b _0806E114
	.align 2, 0
_0806E0A0: .4byte gUnknown_085802A4
_0806E0A4: .4byte gUnknown_0200FC50
_0806E0A8:
	ldr r6, [r5]
	ldr r0, [r6]
	adds r0, #0x30
	ldrb r4, [r0]
	cmp r4, #1
	bne _0806E100
	ldr r0, [r3]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0806E100
	movs r0, #0x73
	bl sub_0803B4DC
	bl sub_080733B8
	ldr r0, _0806E0F8 @ =gUnknown_085802AC
	ldr r1, _0806E0FC @ =gUnknown_0200FC50
	movs r2, #0x8c
	lsls r2, r2, #2
	str r4, [sp]
	str r4, [sp, #4]
	movs r3, #3
	str r3, [sp, #8]
	movs r3, #0xf
	bl sub_08073304
	bl sub_0806D620
	bl sub_0806D268
	ldr r0, [r6]
	adds r0, #0x30
	movs r1, #0
	strb r1, [r0]
	b _0806E114
	.align 2, 0
_0806E0F8: .4byte gUnknown_085802AC
_0806E0FC: .4byte gUnknown_0200FC50
_0806E100:
	ldr r0, [r5]
	ldr r0, [r0]
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806E110
	bl sub_0806DE38
_0806E110:
	bl sub_0806DF58
_0806E114:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0

