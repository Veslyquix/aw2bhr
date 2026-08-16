	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080703F4
sub_080703F4: @ 0x080703F4
	push {r4, r5, r6, lr}
	ldr r0, _08070448 @ =sub_0806F7C8
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	ldr r1, _0807044C @ =gUnknown_03000FB0
	ldr r2, _08070450 @ =0x04000100
	bl CpuSet
	ldr r0, _08070454 @ =gUnknown_03004790
	bl sub_080707F4
	ldr r0, _08070458 @ =gUnknown_030057D0
	bl sub_080706B0
	ldr r0, _0807045C @ =0x0094DB00
	bl sub_08070990
	ldr r0, _08070460 @ =0x0000000B
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _08070442
	ldr r5, _08070464 @ =gUnknown_08242308
	adds r6, r0, #0
_08070426:
	ldr r4, [r5]
	ldr r1, [r5, #4]
	ldrb r2, [r5, #8]
	adds r0, r4, #0
	bl sub_08070B34
	ldrh r0, [r5, #0xa]
	strb r0, [r4, #0xb]
	ldr r0, _08070468 @ =gUnknown_03005BE0
	str r0, [r4, #0x18]
	adds r5, #0xc
	subs r6, #1
	cmp r6, #0
	bne _08070426
_08070442:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08070448: .4byte sub_0806F7C8
_0807044C: .4byte gUnknown_03000FB0
_08070450: .4byte 0x04000100
_08070454: .4byte gUnknown_03004790
_08070458: .4byte gUnknown_030057D0
_0807045C: .4byte 0x0094DB00
_08070460: .4byte 0x0000000B
_08070464: .4byte gUnknown_08242308
_08070468: .4byte gUnknown_03005BE0

