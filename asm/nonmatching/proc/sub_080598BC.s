	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080598BC
sub_080598BC: @ 0x080598BC
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r0, _08059928 @ =gUnknown_03003F20
	ldr r5, [r0]
	bl sub_0805DCD4
	ldr r0, _0805992C @ =gUnknown_08499590
	ldr r0, [r0]
	ldr r1, _08059930 @ =0x00002852
	adds r0, r0, r1
	bl sub_0801F92C
	ldr r4, _08059934 @ =gUnknown_030013EC
	ldr r6, _08059938 @ =gUnknown_030040D8
	ldr r2, [r6]
	ldrb r0, [r2, #2]
	ldrb r1, [r2, #3]
	ldrb r2, [r2]
	movs r3, #0
	str r3, [sp]
	ldr r4, [r4]
	movs r3, #0x78
	bl _call_via_r4
	adds r0, r5, #0
	bl sub_08059A0C
	movs r0, #1
	bl sub_08057F00
	ldr r2, _0805993C @ =0xFFFF0000
	ldr r1, [sp, #4]
	ands r1, r2
	ldr r4, _08059940 @ =0x0000270F
	orrs r1, r4
	str r1, [sp, #4]
	ldr r1, _08059944 @ =gUnknown_085766E0
	ldr r1, [r1]
	ldrb r1, [r1, #0xb]
	add r2, sp, #4
	str r2, [sp]
	movs r2, #0
	adds r3, r5, #0
	bl sub_08059B4C
	add r0, sp, #4
	ldrh r0, [r0]
	cmp r0, r4
	beq _08059948
	add r0, sp, #4
	bl sub_080591E4
	b _08059968
	.align 2, 0
_08059928: .4byte gUnknown_03003F20
_0805992C: .4byte gUnknown_08499590
_08059930: .4byte 0x00002852
_08059934: .4byte gUnknown_030013EC
_08059938: .4byte gUnknown_030040D8
_0805993C: .4byte 0xFFFF0000
_08059940: .4byte 0x0000270F
_08059944: .4byte gUnknown_085766E0
_08059948:
	ldr r0, _08059974 @ =gUnknown_030046B8
	ldrb r0, [r0]
	cmp r0, #2
	bne _08059968
	ldr r2, [r6]
	ldrb r1, [r2, #9]
	movs r0, #0x39
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x18
	orrs r0, r1
	strb r0, [r2, #9]
	bl sub_0805FB70
	bl sub_0805F4F8
_08059968:
	bl sub_0805F7B8
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08059974: .4byte gUnknown_030046B8

