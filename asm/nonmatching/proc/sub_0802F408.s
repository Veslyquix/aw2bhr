	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802F408
sub_0802F408: @ 0x0802F408
	push {r4, lr}
	ldr r2, _0802F438 @ =gUnknown_08090C74
	ldr r0, [r2]
	ldr r3, [r0]
	ldrh r1, [r3, #2]
	ldrh r0, [r3, #2]
	movs r0, #0
	strh r0, [r3, #2]
	movs r4, #8
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _0802F440
	ldr r0, _0802F43C @ =0x04000128
	ldrh r1, [r0]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _0802F440
	ldrb r0, [r3, #0x1f]
	adds r0, #1
	ldrb r1, [r3, #0x1f]
	strb r0, [r3, #0x1f]
	b _0802F44A
	.align 2, 0
_0802F438: .4byte gUnknown_08090C74
_0802F43C: .4byte 0x04000128
_0802F440:
	ldr r0, [r2]
	ldr r1, [r0]
	ldrb r0, [r1, #0x1f]
	movs r0, #0
	strb r0, [r1, #0x1f]
_0802F44A:
	ldr r0, [r2]
	ldr r0, [r0]
	ldrb r0, [r0, #0x1f]
	cmp r0, #0xa
	bhi _0802F458
	movs r0, #1
	b _0802F45A
_0802F458:
	movs r0, #0
_0802F45A:
	pop {r4}
	pop {r1}
	bx r1

