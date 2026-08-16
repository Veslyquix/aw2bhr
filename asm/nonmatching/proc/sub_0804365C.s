	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804365C
sub_0804365C: @ 0x0804365C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	bl sub_08043630
	adds r4, r0, #0
	cmp r4, #0
	beq _080436D0
	ldr r0, _080436AC @ =gUnknown_03004080
	ldrh r0, [r0]
	subs r0, #1
	subs r4, r4, r0
	cmp r4, #0x63
	bgt _080436D0
	cmp r5, #0x77
	bgt _08043680
	adds r5, #0x55
_08043680:
	ldr r3, _080436B0 @ =gUnknown_084A0024
	ldr r0, _080436B4 @ =0x00001042
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSprite
	cmp r4, #9
	ble _080436BC
	adds r0, r5, #0
	subs r0, #0xa
	ldr r2, _080436B8 @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
	lsls r1, r6, #0x10
	lsrs r1, r1, #0x10
	adds r2, r4, #0
	bl sub_0802BD54
	b _080436D0
	.align 2, 0
_080436AC: .4byte gUnknown_03004080
_080436B0: .4byte gUnknown_084A0024
_080436B4: .4byte 0x00001042
_080436B8: .4byte 0x000001FF
_080436BC:
	adds r0, r5, #0
	subs r0, #0xf
	ldr r2, _080436D8 @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
	lsls r1, r6, #0x10
	lsrs r1, r1, #0x10
	adds r2, r4, #0
	bl sub_0802BD54
_080436D0:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080436D8: .4byte 0x000001FF

