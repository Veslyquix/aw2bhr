	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804009C
sub_0804009C: @ 0x0804009C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x54]
	movs r0, #2
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080400E0
	cmp r1, r0
	bgt _080400B6
	subs r0, #1
	cmp r1, r0
	beq _08040104
	b _08040122
_080400B6:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08040122
	ldr r0, _080400DC @ =0x000001D5
	bl sub_0803B4DC
	ldr r2, [r4, #0x14]
	movs r0, #2
	movs r1, #0x5a
	bl sub_08013338
	ldr r3, [r4, #0x14]
	movs r0, #0x5a
	movs r1, #0xf
	movs r2, #0x1e
	bl sub_080130DC
	b _08040146
	.align 2, 0
_080400DC: .4byte 0x000001D5
_080400E0:
	ldr r0, _08040100 @ =0x000001D5
	bl sub_0803B4DC
	ldr r2, [r4, #0x14]
	movs r0, #2
	movs r1, #0xa0
	bl sub_08013338
	ldr r3, [r4, #0x14]
	movs r0, #0xa0
	movs r1, #0x1e
	movs r2, #0x32
	bl sub_080130DC
	b _08040146
	.align 2, 0
_08040100: .4byte 0x000001D5
_08040104:
	movs r0, #0xf1
	lsls r0, r0, #1
	bl sub_0803B4DC
	ldr r2, [r4, #0x14]
	movs r0, #1
	movs r1, #0x14
	bl sub_08013338
	ldr r3, [r4, #0x14]
	movs r0, #4
	movs r1, #0
	movs r2, #2
	bl sub_080130DC
_08040122:
	movs r0, #0x10
	bl sub_0803B4DC
	ldr r2, [r4, #0x14]
	movs r0, #1
	movs r1, #0x14
	bl sub_08013338
	ldr r0, _0804014C @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	cmp r0, #5
	beq _08040146
	ldr r3, [r4, #0x14]
	movs r0, #4
	movs r1, #0
	movs r2, #2
	bl sub_080130DC
_08040146:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804014C: .4byte gUnknown_03003FC0

