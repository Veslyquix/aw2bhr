	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807703C
sub_0807703C: @ 0x0807703C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r5, _08077064 @ =gUnknown_081CC598
	ldr r0, [r5]
	ldr r0, [r0]
	ldrh r4, [r0]
	adds r0, r4, #0
	bl sub_08076E20
	movs r0, #0xf0
	ands r4, r0
	adds r7, r5, #0
	cmp r4, #0
	bne _0807706C
	ldr r2, _08077068 @ =gUnknown_081CC59C
	ldr r1, [r2]
	ldrh r0, [r1, #8]
	adds r0, #1
	b _08077072
	.align 2, 0
_08077064: .4byte gUnknown_081CC598
_08077068: .4byte gUnknown_081CC59C
_0807706C:
	ldr r2, _0807708C @ =gUnknown_081CC59C
	ldr r1, [r2]
	movs r0, #0
_08077072:
	strh r0, [r1, #8]
	adds r5, r2, #0
	ldr r4, [r5]
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #3
	ble _08077090
	adds r0, r6, #0
	bl sub_08076F34
	movs r0, #4
	strh r0, [r4, #8]
	b _080770AC
	.align 2, 0
_0807708C: .4byte gUnknown_081CC59C
_08077090:
	ldrb r0, [r4, #0x10]
	cmp r0, #1
	bne _080770AC
	movs r0, #0
	strb r0, [r4, #0x10]
	subs r0, #1
	str r0, [r4, #0xc]
	movs r0, #0x20
	movs r1, #0x20
	movs r2, #3
	bl sub_0807553C
	bl sub_08075304
_080770AC:
	ldr r0, [r7]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080770E6
	ldr r0, [r5]
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	beq _080770E6
	movs r0, #5
	bl sub_080733A0
	movs r0, #2
	bl sub_080752D8
	movs r0, #2
	bl sub_08074EEC
	bl sub_080763B0
	movs r0, #0x71
	bl sub_0803B4DC
	adds r0, r6, #0
	bl Proc_Break
	b _08077110
_080770E6:
	ldr r0, [r7]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08077104
	movs r0, #0x66
	bl sub_0803B4DC
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
	b _08077110
_08077104:
	ldr r0, [r5]
	ldrh r1, [r0]
	ldrh r2, [r0, #2]
	movs r0, #3
	bl sub_08072C40
_08077110:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

