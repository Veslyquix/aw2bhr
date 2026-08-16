	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08077F9C
sub_08077F9C: @ 0x08077F9C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #0
	bl sub_080638D0
	ldr r2, _08077FD4 @ =gUnknown_03003FC0
	ldr r6, _08077FD8 @ =gUnknown_08615194
	ldr r4, _08077FDC @ =gUnknown_0202FDFC
	ldr r1, [r4, #0xc]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, r0, r6
	ldrh r0, [r0]
	strb r0, [r2, #2]
	ldr r7, _08077FE0 @ =gUnknown_030046B4
	bl sub_0803866C
	cmp r0, #0
	beq _08077FE4
	ldr r0, [r4, #0xc]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #4
	adds r0, r6, #0
	adds r0, #0x28
	b _08077FF0
	.align 2, 0
_08077FD4: .4byte gUnknown_03003FC0
_08077FD8: .4byte gUnknown_08615194
_08077FDC: .4byte gUnknown_0202FDFC
_08077FE0: .4byte gUnknown_030046B4
_08077FE4:
	ldr r0, [r4, #0xc]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #4
	adds r0, r6, #0
	adds r0, #0x24
_08077FF0:
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [r7]
	ldr r0, [r5, #0x3c]
	cmp r0, #0
	bne _08078004
	ldr r0, [r5, #0x38]
	bl _call_via_r0
	b _08078010
_08078004:
	bl sub_0803BD54
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
_08078010:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

