	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802F348
sub_0802F348: @ 0x0802F348
	push {r4, r5, r6, lr}
	ldr r0, _0802F3E0 @ =gUnknown_03003FC0
	adds r0, #0x32
	movs r6, #0
	strb r6, [r0]
	ldr r4, _0802F3E4 @ =gUnknown_0849B018
	ldr r0, [r4]
	ldrb r1, [r0]
	strb r6, [r0]
	ldr r0, [r4]
	ldrb r1, [r0, #1]
	strb r6, [r0, #1]
	ldr r1, [r4]
	ldrh r0, [r1, #4]
	movs r5, #0
	strh r6, [r1, #4]
	ldrh r0, [r1, #2]
	strh r6, [r1, #2]
	ldr r0, _0802F3E8 @ =gUnknown_030044D8
	strb r5, [r0]
	movs r0, #0xff
	strb r0, [r1, #6]
	ldr r0, [r4]
	ldrb r1, [r0, #7]
	strb r5, [r0, #7]
	ldr r0, [r4]
	ldrb r1, [r0, #8]
	strb r5, [r0, #8]
	ldr r0, [r4]
	ldrb r1, [r0, #9]
	strb r5, [r0, #9]
	ldr r0, [r4]
	ldrb r1, [r0, #0x1c]
	strb r5, [r0, #0x1c]
	ldr r0, [r4]
	ldrb r1, [r0, #0x1d]
	strb r5, [r0, #0x1d]
	ldr r0, [r4]
	ldrb r1, [r0, #0x1e]
	strb r5, [r0, #0x1e]
	bl sub_0802F23C
	bl sub_0802F03C
	bl sub_0802F28C
	ldr r0, [r4]
	ldr r2, _0802F3EC @ =0x00001AB0
	adds r1, r0, r2
	ldrh r2, [r1]
	strh r6, [r1]
	ldr r3, _0802F3F0 @ =0x00001AB2
	adds r0, r0, r3
	ldrb r1, [r0]
	strb r5, [r0]
	ldr r0, [r4]
	ldr r1, _0802F3F4 @ =0x00001AB3
	adds r0, r0, r1
	ldrb r1, [r0]
	strb r5, [r0]
	ldr r0, [r4]
	ldr r2, _0802F3F8 @ =0x00001AB4
	adds r0, r0, r2
	ldrb r1, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r0]
	ldr r1, _0802F3FC @ =gUnknown_030040C0
	ldr r0, _0802F400 @ =gUnknown_08090C38
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, _0802F404 @ =gUnknown_0300477C
	str r6, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802F3E0: .4byte gUnknown_03003FC0
_0802F3E4: .4byte gUnknown_0849B018
_0802F3E8: .4byte gUnknown_030044D8
_0802F3EC: .4byte 0x00001AB0
_0802F3F0: .4byte 0x00001AB2
_0802F3F4: .4byte 0x00001AB3
_0802F3F8: .4byte 0x00001AB4
_0802F3FC: .4byte gUnknown_030040C0
_0802F400: .4byte gUnknown_08090C38
_0802F404: .4byte gUnknown_0300477C

