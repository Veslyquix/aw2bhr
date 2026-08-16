	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08046644
sub_08046644: @ 0x08046644
	push {lr}
	ldr r2, _08046684 @ =gUnknown_084C1430
	ldr r0, [r2]
	adds r0, #0x50
	movs r3, #0
	strb r3, [r0]
	ldr r0, [r2]
	adds r0, #0x53
	strb r3, [r0]
	ldr r0, [r2]
	adds r0, #0x54
	strb r3, [r0]
	ldr r0, [r2]
	ldr r1, _08046688 @ =gUnknown_030033EC
	ldrh r1, [r1]
	adds r0, #0x5e
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x59
	strb r3, [r0]
	bl sub_08013C00
	bl sub_08013CA8
	bl sub_08046030
	bl sub_08013AEC
	bl sub_08013B0C
	pop {r0}
	bx r0
	.align 2, 0
_08046684: .4byte gUnknown_084C1430
_08046688: .4byte gUnknown_030033EC

