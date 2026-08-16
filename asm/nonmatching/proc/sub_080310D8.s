	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080310D8
sub_080310D8: @ 0x080310D8
	push {lr}
	bl sub_08034848
	ldr r3, _0803111C @ =gUnknown_03003FC0
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
	ldr r0, _08031120 @ =gUnknown_0849B018
	ldr r0, [r0]
	ldrb r1, [r0]
	strb r2, [r0]
	ldr r0, _08031124 @ =gUnknown_0849B060
	ldr r0, [r0]
	strh r2, [r0, #2]
	bl sub_08031018
	pop {r0}
	bx r0
	.align 2, 0
_0803111C: .4byte gUnknown_03003FC0
_08031120: .4byte gUnknown_0849B018
_08031124: .4byte gUnknown_0849B060

