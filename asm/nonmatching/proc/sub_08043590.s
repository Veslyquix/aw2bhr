	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08043590
sub_08043590: @ 0x08043590
	push {lr}
	sub sp, #4
	ldr r0, _080435D4 @ =gUnknown_03004008
	ldr r0, [r0]
	str r0, [sp]
	ldr r1, _080435D8 @ =gUnknown_030005D0
	ldrh r0, [r1]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #3
	bhi _080435FE
	ldr r0, _080435DC @ =gUnknown_03003FC0
	ldrb r0, [r0, #7]
	cmp r0, #0
	beq _080435FE
	ldrh r0, [r1]
	bl sub_0804423C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080435E8
	ldr r0, [sp]
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	ldr r1, _080435E0 @ =gUnknown_08104324
	adds r0, r0, r1
	ldr r1, _080435E4 @ =0x000002F6
	movs r2, #2
	bl sub_0801368C
	b _080435FE
	.align 2, 0
_080435D4: .4byte gUnknown_03004008
_080435D8: .4byte gUnknown_030005D0
_080435DC: .4byte gUnknown_03003FC0
_080435E0: .4byte gUnknown_08104324
_080435E4: .4byte 0x000002F6
_080435E8:
	ldr r0, [sp]
	lsrs r0, r0, #1
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	ldr r1, _08043604 @ =gUnknown_08104304
	adds r0, r0, r1
	ldr r1, _08043608 @ =0x000002F6
	movs r2, #2
	bl sub_0801368C
_080435FE:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08043604: .4byte gUnknown_08104304
_08043608: .4byte 0x000002F6

