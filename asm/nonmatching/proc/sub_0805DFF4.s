	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805DFF4
sub_0805DFF4: @ 0x0805DFF4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	bl sub_0805E440
	bl sub_0805D888
	ldr r0, _0805E0A4 @ =gUnknown_03004784
	ldr r5, [r0]
	ldr r4, _0805E0A8 @ =gUnknown_0816DA58
	ldr r0, [r4]
	ldr r0, [r0]
	ldrb r0, [r0, #0xa]
	movs r1, #0x64
	bl __umodsi3
	ldrb r1, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	bhi _0805E02A
	ldr r0, _0805E0AC @ =gUnknown_030033EC
	ldrh r0, [r0]
	bl sub_0804415C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805E02E
_0805E02A:
	bl sub_0805E718
_0805E02E:
	add r0, sp, #4
	bl sub_08058F30
	ldr r7, _0805E0B0 @ =gUnknown_030013EC
	ldr r6, [r4]
	ldr r2, [r6]
	ldrb r0, [r2, #2]
	ldrb r1, [r2, #3]
	ldrb r2, [r2]
	add r3, sp, #4
	ldrb r3, [r3]
	movs r4, #0
	str r4, [sp]
	ldr r4, [r7]
	bl _call_via_r4
	bl sub_0804151C
	bl sub_08058058
	movs r0, #1
	bl sub_08057F00
	ldr r1, _0805E0B4 @ =gUnknown_085766E0
	ldr r4, [r1]
	ldrb r1, [r4, #9]
	bl __divsi3
	cmp r0, #0
	bne _0805E06C
	ldrb r0, [r4]
_0805E06C:
	movs r1, #0
	bl sub_08058144
	adds r5, r0, #0
	cmp r5, #0
	beq _0805E0D6
	ldr r2, [r6]
	ldrb r1, [r2, #9]
	movs r0, #0x39
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #9]
	ldrb r4, [r5, #1]
	ldrb r5, [r5, #2]
	ldr r0, _0805E0B8 @ =gUnknown_030046B8
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0805E0BC
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x14
	movs r3, #2
	bl sub_0805BFDC
	b _0805E0C8
	.align 2, 0
_0805E0A4: .4byte gUnknown_03004784
_0805E0A8: .4byte gUnknown_0816DA58
_0805E0AC: .4byte gUnknown_030033EC
_0805E0B0: .4byte gUnknown_030013EC
_0805E0B4: .4byte gUnknown_085766E0
_0805E0B8: .4byte gUnknown_030046B8
_0805E0BC:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #7
	movs r3, #1
	bl sub_0805BFDC
_0805E0C8:
	lsls r0, r5, #0x10
	orrs r4, r0
	str r4, [sp, #8]
	add r0, sp, #8
	bl sub_080591E4
	b _0805E158
_0805E0D6:
	ldr r0, _0805E144 @ =gUnknown_030046B8
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0805E154
	ldr r2, [r6]
	ldrb r1, [r2, #9]
	movs r0, #0x39
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #9]
	bl sub_0805FB70
	ldr r1, [r6]
	ldrb r0, [r1, #2]
	ldrb r1, [r1, #3]
	str r5, [sp]
	ldr r4, [r7]
	movs r2, #0x14
	movs r3, #0x78
	bl _call_via_r4
	ldr r0, _0805E148 @ =gUnknown_03003F20
	ldr r0, [r0]
	bl sub_08059A0C
	cmp r0, #0
	beq _0805E150
	ldr r2, [r6]
	ldrb r0, [r2, #2]
	ldrb r1, [r2, #3]
	ldrb r2, [r2]
	movs r3, #1
	rsbs r3, r3, #0
	str r3, [sp]
	ldr r4, [r7]
	movs r3, #0x78
	bl _call_via_r4
	ldr r4, _0805E14C @ =0x0000270F
	add r5, sp, #8
	strh r4, [r5]
	adds r0, r5, #0
	bl sub_0805C0AC
	ldrh r0, [r5]
	cmp r0, r4
	beq _0805E154
	adds r0, r5, #0
	bl sub_080591E4
	b _0805E154
	.align 2, 0
_0805E144: .4byte gUnknown_030046B8
_0805E148: .4byte gUnknown_03003F20
_0805E14C: .4byte 0x0000270F
_0805E150:
	bl sub_0805F4F8
_0805E154:
	bl sub_0805F4F8
_0805E158:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

