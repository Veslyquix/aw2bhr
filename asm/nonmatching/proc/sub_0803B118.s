	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B118
sub_0803B118: @ 0x0803B118
	push {lr}
	adds r2, r0, #0
	ldr r0, _0803B148 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0803B150
	ldrh r0, [r2, #0x1e]
	adds r0, #1
	strh r0, [r2, #0x1e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x5a
	ble _0803B156
	bl sub_0803B0D8
	ldr r0, _0803B14C @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
	b _0803B156
	.align 2, 0
_0803B148: .4byte gpKeySt
_0803B14C: .4byte gUnknown_03001FBC
_0803B150:
	adds r0, r2, #0
	bl sub_080153B8
_0803B156:
	pop {r0}
	bx r0
	.align 2, 0

