	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08059978
sub_08059978: @ 0x08059978
	push {r4, r5, lr}
	sub sp, #8
	ldr r0, _080599EC @ =gUnknown_03003F20
	ldr r5, [r0]
	bl sub_0805DCD4
	ldr r0, _080599F0 @ =gUnknown_08499590
	ldr r0, [r0]
	ldr r1, _080599F4 @ =0x00002852
	adds r0, r0, r1
	bl sub_0801F92C
	ldr r4, _080599F8 @ =gUnknown_030013EC
	ldr r0, _080599FC @ =gUnknown_030040D8
	ldr r2, [r0]
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
	ldr r2, _08059A00 @ =0xFFFF0000
	ldr r1, [sp, #4]
	ands r1, r2
	ldr r4, _08059A04 @ =0x0000270F
	orrs r1, r4
	str r1, [sp, #4]
	ldr r1, _08059A08 @ =gUnknown_085766E0
	ldr r1, [r1]
	ldrb r1, [r1, #0xa]
	add r2, sp, #4
	str r2, [sp]
	movs r2, #0
	adds r3, r5, #0
	bl sub_08059B4C
	add r0, sp, #4
	ldrh r0, [r0]
	cmp r0, r4
	bne _080599DE
	bl sub_0805F7B8
_080599DE:
	add r0, sp, #4
	bl sub_080591E4
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080599EC: .4byte gUnknown_03003F20
_080599F0: .4byte gUnknown_08499590
_080599F4: .4byte 0x00002852
_080599F8: .4byte gUnknown_030013EC
_080599FC: .4byte gUnknown_030040D8
_08059A00: .4byte 0xFFFF0000
_08059A04: .4byte 0x0000270F
_08059A08: .4byte gUnknown_085766E0

