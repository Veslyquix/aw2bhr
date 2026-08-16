	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08022048
sub_08022048: @ 0x08022048
	push {r4, r5, r6, lr}
	bl sub_08011BD4
	lsls r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #0x15
	cmp r0, r1
	ble _0802205A
	b _0802215A
_0802205A:
	ldr r0, _08022078 @ =gUnknown_03003330
	ldr r1, [r0]
	adds r1, #1
	str r1, [r0]
	ldr r0, [r0]
	movs r1, #0x32
	bl __umodsi3
	cmp r0, #0x11
	beq _080220B8
	cmp r0, #0x11
	bhi _0802207C
	cmp r0, #0
	beq _08022086
	b _0802215A
	.align 2, 0
_08022078: .4byte gUnknown_03003330
_0802207C:
	cmp r0, #0x19
	beq _080220E8
	cmp r0, #0x2a
	beq _08022128
	b _0802215A
_08022086:
	bl sub_080261A0
	bl sub_08026190
	adds r5, r0, #0
	ldr r0, _080220AC @ =gUnknown_03001FE8
	ldr r4, [r0]
	lsls r4, r4, #0x1c
	lsrs r4, r4, #0x1e
	lsls r4, r4, #0xe
	ldr r0, _080220B0 @ =0x060046A0
	adds r4, r4, r0
	bl sub_080261A0
	adds r2, r0, #0
	ldr r1, _080220B4 @ =0x000003FF
	adds r0, r1, #0
	ands r2, r0
	b _08022110
	.align 2, 0
_080220AC: .4byte gUnknown_03001FE8
_080220B0: .4byte 0x060046A0
_080220B4: .4byte 0x000003FF
_080220B8:
	bl sub_08026190
	adds r5, r0, #0
	bl sub_080261A0
	ldr r6, _080220DC @ =0x000003FF
	ands r0, r6
	lsls r0, r0, #5
	adds r5, r5, r0
	ldr r0, _080220E0 @ =gUnknown_03001FE8
	ldr r4, [r0]
	lsls r4, r4, #0x1c
	lsrs r4, r4, #0x1e
	lsls r4, r4, #0xe
	ldr r0, _080220E4 @ =0x060046A0
	adds r4, r4, r0
	b _08022108
	.align 2, 0
_080220DC: .4byte 0x000003FF
_080220E0: .4byte gUnknown_03001FE8
_080220E4: .4byte 0x060046A0
_080220E8:
	bl sub_08026190
	adds r5, r0, #0
	bl sub_080261A0
	ldr r6, _0802211C @ =0x000003FF
	ands r0, r6
	lsls r0, r0, #6
	adds r5, r5, r0
	ldr r0, _08022120 @ =gUnknown_03001FE8
	ldr r4, [r0]
	lsls r4, r4, #0x1c
	lsrs r4, r4, #0x1e
	lsls r4, r4, #0xe
	ldr r1, _08022124 @ =0x060046A0
	adds r4, r4, r1
_08022108:
	bl sub_080261A0
	adds r2, r0, #0
	ands r2, r6
_08022110:
	lsls r2, r2, #5
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08011C68
	b _0802215A
	.align 2, 0
_0802211C: .4byte 0x000003FF
_08022120: .4byte gUnknown_03001FE8
_08022124: .4byte 0x060046A0
_08022128:
	bl sub_08026190
	adds r5, r0, #0
	bl sub_080261A0
	ldr r6, _08022160 @ =0x000003FF
	ands r0, r6
	lsls r0, r0, #5
	adds r5, r5, r0
	ldr r0, _08022164 @ =gUnknown_03001FE8
	ldr r4, [r0]
	lsls r4, r4, #0x1c
	lsrs r4, r4, #0x1e
	lsls r4, r4, #0xe
	ldr r0, _08022168 @ =0x060046A0
	adds r4, r4, r0
	bl sub_080261A0
	adds r2, r0, #0
	ands r2, r6
	lsls r2, r2, #5
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08011C68
_0802215A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08022160: .4byte 0x000003FF
_08022164: .4byte gUnknown_03001FE8
_08022168: .4byte 0x060046A0

