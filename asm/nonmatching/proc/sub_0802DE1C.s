	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802DE1C
sub_0802DE1C: @ 0x0802DE1C
	push {r4, r5, lr}
	bl sub_08023824
	bl sub_080236E8
	movs r0, #4
	bl sub_08023908
	ldr r0, _0802DE5C @ =gUnknown_08499590
	ldr r2, [r0]
	ldr r4, _0802DE60 @ =gUnknown_08090C24
	ldr r3, [r4]
	ldrh r1, [r3, #2]
	lsls r1, r1, #1
	ldr r5, _0802DE64 @ =0x0000417A
	adds r0, r2, r5
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r1, [r3]
	adds r0, r0, r1
	ldr r1, _0802DE68 @ =0x00002852
	adds r2, r2, r1
	adds r2, r2, r0
	movs r0, #0
	ldrsb r0, [r2, r0]
	adds r5, r4, #0
	cmp r0, #0
	bge _0802DE6C
	movs r0, #1
	bl sub_08023274
	b _0802DE72
	.align 2, 0
_0802DE5C: .4byte gUnknown_08499590
_0802DE60: .4byte gUnknown_08090C24
_0802DE64: .4byte 0x0000417A
_0802DE68: .4byte 0x00002852
_0802DE6C:
	movs r0, #1
	bl sub_08023274
_0802DE72:
	bl sub_08039264
	bl sub_0802DBF8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802DEE6
	ldr r0, _0802DEA0 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r4, #1
	ands r4, r1
	cmp r4, #0
	beq _0802DEA4
	ldr r1, [r5]
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r5, #2
	ldrsh r1, [r1, r5]
	bl sub_0802E60C
	b _0802DEE6
	.align 2, 0
_0802DEA0: .4byte gpKeySt
_0802DEA4:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0802DEE6
	ldr r0, _0802DEEC @ =gUnknown_03003FC0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802DEC4
	ldr r0, _0802DEF0 @ =gUnknown_03003F38
	ldrb r1, [r0]
	movs r0, #0x11
	movs r2, #0
	movs r3, #0
	bl sub_08034534
_0802DEC4:
	ldr r0, _0802DEF4 @ =gUnknown_030040D8
	ldr r1, [r0]
	ldrb r0, [r1, #2]
	ldrb r1, [r1, #3]
	bl sub_08029088
	bl sub_08035810
	bl sub_080258CC
	bl sub_08022A08
	ldr r0, _0802DEF8 @ =gUnknown_03003334
	strh r4, [r0]
	movs r0, #0x66
	bl sub_0803B4DC
_0802DEE6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802DEEC: .4byte gUnknown_03003FC0
_0802DEF0: .4byte gUnknown_03003F38
_0802DEF4: .4byte gUnknown_030040D8
_0802DEF8: .4byte gUnknown_03003334

