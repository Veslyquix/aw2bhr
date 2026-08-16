	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802D3B0
sub_0802D3B0: @ 0x0802D3B0
	push {r4, r5, lr}
	sub sp, #8
	bl sub_0802D33C
	adds r4, r0, #0
	ldr r0, _0802D400 @ =gUnknown_08489568
	bl sub_0801537C
	ldr r0, _0802D404 @ =gUnknown_08499578
	ldr r0, [r0]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r5, #6
	str r5, [sp]
	movs r1, #0
	str r1, [sp, #4]
	adds r1, r4, #0
	movs r2, #0xe
	movs r3, #0xd
	bl sub_08012BC8
	ldr r0, _0802D408 @ =gUnknown_08499580
	ldr r0, [r0]
	str r5, [sp]
	movs r1, #0xd8
	lsls r1, r1, #2
	str r1, [sp, #4]
	adds r1, r4, #0
	movs r2, #0xe
	movs r3, #0xd
	bl sub_08012BC8
	bl sub_08013AEC
	bl sub_08013B0C
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802D400: .4byte gUnknown_08489568
_0802D404: .4byte gUnknown_08499578
_0802D408: .4byte gUnknown_08499580

