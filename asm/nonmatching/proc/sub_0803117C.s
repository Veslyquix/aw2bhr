	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803117C
sub_0803117C: @ 0x0803117C
	push {lr}
	bl sub_08034848
	ldr r3, _080311C4 @ =gUnknown_03003FC0
	adds r0, r3, #0
	adds r0, #0x32
	movs r1, #0
	movs r2, #1
	strb r2, [r0]
	adds r0, #7
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	strb r2, [r3, #0xd]
	strb r2, [r3, #7]
	subs r0, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	ldr r0, _080311C8 @ =gUnknown_0849B018
	ldr r1, [r0]
	ldrb r0, [r1]
	movs r0, #2
	strb r0, [r1]
	ldr r0, _080311CC @ =gUnknown_0849B060
	ldr r0, [r0]
	strh r2, [r0, #2]
	bl sub_08031018
	pop {r0}
	bx r0
	.align 2, 0
_080311C4: .4byte gUnknown_03003FC0
_080311C8: .4byte gUnknown_0849B018
_080311CC: .4byte gUnknown_0849B060

