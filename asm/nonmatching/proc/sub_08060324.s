	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08060324
sub_08060324: @ 0x08060324
	push {lr}
	ldr r2, _0806036C @ =gUnknown_08499594
	ldr r0, _08060370 @ =gUnknown_030046C0
	ldrb r1, [r0, #6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r1, r1, r0
	ldr r2, _08060374 @ =gUnknown_030033E4
	ldrb r0, [r1, #2]
	strh r0, [r2]
	ldrb r0, [r1, #3]
	strh r0, [r2, #2]
	movs r0, #2
	bl sub_08023274
	ldr r1, _08060378 @ =gUnknown_030046D4
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, [r1]
	cmp r0, #0x1e
	bgt _08060362
	ldr r0, _0806037C @ =gUnknown_03002EE0
	ldr r0, [r0]
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08060368
_08060362:
	ldr r1, _08060380 @ =gUnknown_030045D4
	movs r0, #3
	strh r0, [r1]
_08060368:
	pop {r0}
	bx r0
	.align 2, 0
_0806036C: .4byte gUnknown_08499594
_08060370: .4byte gUnknown_030046C0
_08060374: .4byte gUnknown_030033E4
_08060378: .4byte gUnknown_030046D4
_0806037C: .4byte gUnknown_03002EE0
_08060380: .4byte gUnknown_030045D4

