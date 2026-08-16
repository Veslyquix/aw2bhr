	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802F23C
sub_0802F23C: @ 0x0802F23C
	push {r4, lr}
	ldr r2, _0802F27C @ =gUnknown_0849B01C
	ldr r1, [r2]
	ldrh r0, [r1]
	movs r4, #0
	movs r3, #0
	strh r3, [r1]
	ldrh r0, [r1, #2]
	strh r3, [r1, #2]
	ldrb r0, [r1, #4]
	movs r0, #1
	strb r0, [r1, #4]
	ldr r0, [r2]
	ldrb r1, [r0, #5]
	strb r4, [r0, #5]
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	ldr r1, _0802F280 @ =0x00005FFF
	strh r1, [r0, #6]
	movs r1, #0x84
	lsls r1, r1, #2
	adds r2, r0, r1
	ldrh r1, [r2]
	ldr r1, _0802F284 @ =0x0000FFFF
	strh r1, [r2]
	ldr r1, _0802F288 @ =0x00000212
	adds r0, r0, r1
	ldrh r1, [r0]
	strh r3, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802F27C: .4byte gUnknown_0849B01C
_0802F280: .4byte 0x00005FFF
_0802F284: .4byte 0x0000FFFF
_0802F288: .4byte 0x00000212

