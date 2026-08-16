	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08077F30
sub_08077F30: @ 0x08077F30
	push {r4, r5, r6, lr}
	movs r0, #0
	bl sub_080638D0
	ldr r2, _08077F64 @ =gUnknown_03003FC0
	ldr r5, _08077F68 @ =gUnknown_08615194
	ldr r4, _08077F6C @ =gUnknown_0202FDFC
	ldr r1, [r4, #0xc]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, r0, r5
	ldrh r0, [r0]
	strb r0, [r2, #2]
	ldr r6, _08077F70 @ =gUnknown_030046B4
	bl sub_0803866C
	cmp r0, #0
	beq _08077F74
	ldr r0, [r4, #0xc]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #4
	adds r0, r5, #0
	adds r0, #0x28
	b _08077F80
	.align 2, 0
_08077F64: .4byte gUnknown_03003FC0
_08077F68: .4byte gUnknown_08615194
_08077F6C: .4byte gUnknown_0202FDFC
_08077F70: .4byte gUnknown_030046B4
_08077F74:
	ldr r0, [r4, #0xc]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #4
	adds r0, r5, #0
	adds r0, #0x24
_08077F80:
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [r6]
	bl sub_08074744
	bl sub_08074F1C
	bl sub_08075304
	bl sub_080755E0
	pop {r4, r5, r6}
	pop {r0}
	bx r0

