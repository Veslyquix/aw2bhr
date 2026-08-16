	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08049E50
sub_08049E50: @ 0x08049E50
	push {lr}
	adds r3, r0, #0
	movs r2, #0
	ldr r0, _08049E90 @ =gUnknown_02028E3C
	ldrb r0, [r0]
	cmp r0, #0
	beq _08049E8C
	ldr r0, _08049E94 @ =gUnknown_084C3240
	ldr r1, [r0]
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xdc
	bls _08049E72
	movs r2, #1
_08049E72:
	ldr r0, _08049E98 @ =gUnknown_03002EE0
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08049E82
	movs r2, #1
_08049E82:
	cmp r2, #1
	bne _08049E8C
	adds r0, r3, #0
	bl Proc_Break
_08049E8C:
	pop {r0}
	bx r0
	.align 2, 0
_08049E90: .4byte gUnknown_02028E3C
_08049E94: .4byte gUnknown_084C3240
_08049E98: .4byte gUnknown_03002EE0

