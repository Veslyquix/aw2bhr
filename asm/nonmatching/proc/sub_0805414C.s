	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805414C
sub_0805414C: @ 0x0805414C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r2, _080541D0 @ =gUnknown_020296B0
	ldr r1, _080541D4 @ =gUnknown_02029C08
	lsls r0, r4, #1
	adds r6, r0, r1
	ldrh r0, [r6]
	lsls r3, r0, #1
	lsls r0, r4, #2
	adds r7, r0, r4
	lsls r0, r7, #3
	adds r0, r3, r0
	adds r2, #0xc
	adds r0, r0, r2
	ldrh r5, [r0]
	ldr r2, _080541D8 @ =gUnknown_085D6A48
	ldr r0, _080541DC @ =gUnknown_03004580
	lsls r1, r4, #4
	adds r0, #2
	adds r1, r1, r0
	ldrh r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r2, r0, r2
	cmp r5, #0xff
	beq _080541C8
	ldr r0, _080541E0 @ =gUnknown_03004508
	ldrh r1, [r0]
	ldr r0, _080541E4 @ =gUnknown_08551E12
	adds r0, r3, r0
	ldrh r0, [r0]
	adds r0, #0x32
	cmp r1, r0
	bne _080541C8
	ldrh r0, [r2, #4]
	cmp r0, #1
	beq _080541C8
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080541F0
	ldrh r0, [r6]
	adds r0, #1
	movs r3, #0
	strh r0, [r6]
	ldr r1, _080541E8 @ =gUnknown_02029BEC
	lsls r2, r5, #1
	lsls r0, r7, #1
	adds r0, r2, r0
	adds r0, r0, r1
	strh r3, [r0]
	ldr r1, _080541EC @ =gUnknown_020297C0
	lsls r0, r4, #3
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r2, r2, r0
	adds r1, #0xc
	adds r2, r2, r1
	movs r0, #1
	strh r0, [r2]
_080541C8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080541D0: .4byte gUnknown_020296B0
_080541D4: .4byte gUnknown_02029C08
_080541D8: .4byte gUnknown_085D6A48
_080541DC: .4byte gUnknown_03004580
_080541E0: .4byte gUnknown_03004508
_080541E4: .4byte gUnknown_08551E12
_080541E8: .4byte gUnknown_02029BEC
_080541EC: .4byte gUnknown_020297C0

