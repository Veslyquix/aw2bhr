	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805F074
sub_0805F074: @ 0x0805F074
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r0, _0805F0D8 @ =gUnknown_03003F20
	ldr r6, [r0]
	add r0, sp, #4
	bl sub_08058F30
	ldr r5, _0805F0DC @ =gUnknown_030013EC
	ldr r0, _0805F0E0 @ =gUnknown_030040D8
	ldr r2, [r0]
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
	adds r0, r6, #0
	bl sub_08059E3C
	ldr r1, _0805F0E4 @ =0xFFFF0000
	ldr r0, [sp, #8]
	ands r0, r1
	ldr r4, _0805F0E8 @ =0x0000270F
	orrs r0, r4
	str r0, [sp, #8]
	add r5, sp, #8
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_08059C00
	ldrh r0, [r5]
	cmp r0, r4
	bne _0805F0C6
	bl sub_0805EF00
_0805F0C6:
	adds r0, r5, #0
	bl sub_080591E4
	bl sub_0805F7B8
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805F0D8: .4byte gUnknown_03003F20
_0805F0DC: .4byte gUnknown_030013EC
_0805F0E0: .4byte gUnknown_030040D8
_0805F0E4: .4byte 0xFFFF0000
_0805F0E8: .4byte 0x0000270F

