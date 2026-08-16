	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805EE40
sub_0805EE40: @ 0x0805EE40
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r0, _0805EE98 @ =gUnknown_03003F20
	ldr r7, [r0]
	add r0, sp, #4
	bl sub_08058F30
	ldr r5, _0805EE9C @ =gUnknown_030013EC
	ldr r6, _0805EEA0 @ =gUnknown_030040D8
	ldr r2, [r6]
	ldrb r0, [r2, #2]
	ldrb r1, [r2, #3]
	ldrb r2, [r2]
	add r3, sp, #4
	ldrb r3, [r3]
	movs r4, #0
	str r4, [sp]
	ldr r4, [r5]
	bl _call_via_r4
	bl sub_08059AEC
	adds r0, r7, #0
	bl sub_08059A0C
	ldr r2, _0805EEA4 @ =gUnknown_085D5ABC
	ldr r0, [r6]
	ldrb r1, [r0]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #0xe]
	cmp r0, #1
	bls _0805EEAC
	movs r0, #4
	bl sub_08057F00
	adds r6, r0, #0
	ldr r0, _0805EEA8 @ =gUnknown_085766E0
	ldr r0, [r0]
	ldrb r3, [r0, #0xc]
	movs r2, #1
	b _0805EEBC
	.align 2, 0
_0805EE98: .4byte gUnknown_03003F20
_0805EE9C: .4byte gUnknown_030013EC
_0805EEA0: .4byte gUnknown_030040D8
_0805EEA4: .4byte gUnknown_085D5ABC
_0805EEA8: .4byte gUnknown_085766E0
_0805EEAC:
	movs r0, #5
	bl sub_08057F00
	adds r6, r0, #0
	ldr r0, _0805EEF4 @ =gUnknown_085766E0
	ldr r0, [r0]
	ldrb r3, [r0, #0xc]
	movs r2, #2
_0805EEBC:
	ldr r1, _0805EEF8 @ =0xFFFF0000
	ldr r0, [sp, #8]
	ands r0, r1
	ldr r4, _0805EEFC @ =0x0000270F
	orrs r0, r4
	str r0, [sp, #8]
	add r5, sp, #8
	str r5, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	adds r3, r7, #0
	bl sub_08059B4C
	ldrh r0, [r5]
	cmp r0, r4
	bne _0805EEE0
	bl sub_0805F4F8
_0805EEE0:
	adds r0, r5, #0
	bl sub_080591E4
	bl sub_0805F7B8
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805EEF4: .4byte gUnknown_085766E0
_0805EEF8: .4byte 0xFFFF0000
_0805EEFC: .4byte 0x0000270F

