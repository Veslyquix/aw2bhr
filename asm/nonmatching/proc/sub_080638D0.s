	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080638D0
sub_080638D0: @ 0x080638D0
	push {lr}
	adds r3, r0, #0
	cmp r3, #0
	beq _08063900
	ldr r2, _080638F8 @ =0x04000200
	ldrh r0, [r2]
	movs r1, #4
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _080638FC @ =gUnknown_030020B4
	ldrb r0, [r2]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	movs r0, #2
	adds r1, r3, #0
	bl sub_0801BB00
	b _08063916
	.align 2, 0
_080638F8: .4byte 0x04000200
_080638FC: .4byte gUnknown_030020B4
_08063900:
	ldr r2, _0806391C @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _08063920 @ =0x0000FFFB
	ands r0, r1
	strh r0, [r2]
	ldr r2, _08063924 @ =gUnknown_030020B4
	ldrb r1, [r2]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
_08063916:
	pop {r0}
	bx r0
	.align 2, 0
_0806391C: .4byte 0x04000200
_08063920: .4byte 0x0000FFFB
_08063924: .4byte gUnknown_030020B4

