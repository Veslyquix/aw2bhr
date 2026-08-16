	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804931C
sub_0804931C: @ 0x0804931C
	push {lr}
	sub sp, #4
	ldr r0, _08049354 @ =gUnknown_084C30F8
	ldr r0, [r0]
	ldrh r3, [r0, #0x1e]
	ldrh r1, [r0, #0x20]
	subs r1, r3, r1
	lsls r1, r1, #0x19
	movs r0, #0xe0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	lsrs r1, r1, #0x18
	ldr r0, _08049358 @ =gUnknown_08499578
	ldr r2, [r0]
	ldr r0, _0804935C @ =gUnknown_02028E1C
	adds r3, r3, r0
	ldrb r3, [r3]
	movs r0, #3
	str r0, [sp]
	movs r0, #0
	bl sub_080487B4
	bl sub_08013AEC
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08049354: .4byte gUnknown_084C30F8
_08049358: .4byte gUnknown_08499578
_0804935C: .4byte gUnknown_02028E1C

