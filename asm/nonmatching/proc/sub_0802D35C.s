	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802D35C
sub_0802D35C: @ 0x0802D35C
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	bl sub_0802D33C
	adds r4, r0, #0
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xe
	movs r2, #0xd
	movs r3, #6
	bl sub_0801A444
	ldr r0, _0802D3A8 @ =gUnknown_08489568
	bl sub_0801537C
	adds r4, #1
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r0, _0802D3AC @ =gUnknown_08499578
	ldr r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #0xf
	adds r3, r5, #0
	bl sub_080146D4
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802D3A8: .4byte gUnknown_08489568
_0802D3AC: .4byte gUnknown_08499578

