	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08060110
sub_08060110: @ 0x08060110
	push {r4, r5, lr}
	ldr r4, _0806015C @ =gUnknown_030046C0
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	ldrb r2, [r4, #1]
	bl sub_08025E08
	ldr r3, _08060160 @ =gUnknown_08499594
	ldr r0, _08060164 @ =gUnknown_08499590
	ldr r2, [r0]
	ldrb r1, [r4, #3]
	lsls r1, r1, #1
	ldr r5, _08060168 @ =0x0000417A
	adds r0, r2, r5
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrb r1, [r4, #2]
	adds r0, r0, r1
	adds r2, #0x12
	adds r2, r2, r0
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r3]
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1, #9]
	strb r0, [r1, #0xa]
	ldrb r0, [r4, #6]
	strb r0, [r1, #0xb]
	ldr r1, _0806016C @ =gUnknown_030045D4
	movs r0, #0xb
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806015C: .4byte gUnknown_030046C0
_08060160: .4byte gUnknown_08499594
_08060164: .4byte gUnknown_08499590
_08060168: .4byte 0x0000417A
_0806016C: .4byte gUnknown_030045D4

