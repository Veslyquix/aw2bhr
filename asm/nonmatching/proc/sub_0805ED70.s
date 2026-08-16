	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805ED70
sub_0805ED70: @ 0x0805ED70
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r0, _0805EDB8 @ =gUnknown_03003F20
	ldr r7, [r0]
	add r0, sp, #4
	bl sub_08058F30
	ldr r5, _0805EDBC @ =gUnknown_030013EC
	ldr r6, _0805EDC0 @ =gUnknown_030040D8
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
	ldr r2, _0805EDC4 @ =gUnknown_085D5ABC
	ldr r0, [r6]
	ldrb r1, [r0]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #0x1a]
	cmp r0, #0x20
	bne _0805EDC8
	adds r0, r7, #0
	bl sub_0805A008
	b _0805EDCE
	.align 2, 0
_0805EDB8: .4byte gUnknown_03003F20
_0805EDBC: .4byte gUnknown_030013EC
_0805EDC0: .4byte gUnknown_030040D8
_0805EDC4: .4byte gUnknown_085D5ABC
_0805EDC8:
	adds r0, r7, #0
	bl sub_08059F24
_0805EDCE:
	ldr r1, _0805EE2C @ =0xFFFF0000
	ldr r0, [sp, #8]
	ands r0, r1
	ldr r4, _0805EE30 @ =0x0000270F
	orrs r0, r4
	str r0, [sp, #8]
	add r5, sp, #8
	adds r0, r7, #0
	adds r1, r5, #0
	bl sub_08059C00
	ldrh r0, [r5]
	cmp r0, r4
	bne _0805EDEE
	bl sub_0805F4F8
_0805EDEE:
	ldr r3, _0805EE34 @ =gUnknown_03004730
	ldr r0, _0805EE38 @ =gUnknown_08499590
	ldr r2, [r0]
	ldrh r1, [r5, #2]
	lsls r1, r1, #1
	ldr r4, _0805EE3C @ =0x0000417A
	adds r0, r2, r4
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r1, [r5]
	adds r0, r0, r1
	adds r2, #0x12
	adds r2, r2, r0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	adds r0, r0, r3
	ldrb r1, [r0]
	adds r1, #1
	ldrb r2, [r0]
	strb r1, [r0]
	adds r0, r5, #0
	bl sub_080591E4
	bl sub_0805F7B8
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805EE2C: .4byte 0xFFFF0000
_0805EE30: .4byte 0x0000270F
_0805EE34: .4byte gUnknown_03004730
_0805EE38: .4byte gUnknown_08499590
_0805EE3C: .4byte 0x0000417A

