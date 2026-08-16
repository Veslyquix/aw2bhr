	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803ACF0
sub_0803ACF0: @ 0x0803ACF0
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x65
	bl sub_0803CBD8
	movs r5, #0
	strh r0, [r4, #0x20]
	movs r0, #0x66
	bl sub_0803CBD8
	strh r0, [r4, #0x22]
	movs r0, #0x68
	bl sub_0803CBD8
	strh r0, [r4, #0x24]
	movs r0, #0x67
	bl sub_0803CBD8
	strh r0, [r4, #0x26]
	ldr r2, _0803AD40 @ =gUnknown_0200C420
	ldr r0, [r2]
	strh r0, [r4, #0x28]
	ldr r0, [r2, #4]
	strh r0, [r4, #0x2a]
	strh r5, [r4, #0x2c]
	ldrb r0, [r2, #9]
	ldrb r1, [r2, #0xa]
	adds r0, r0, r1
	ldrb r2, [r2, #0xb]
	adds r0, r0, r2
	rsbs r0, r0, #0
	lsrs r0, r0, #0x1f
	strh r0, [r4, #0x2e]
	ldr r0, _0803AD44 @ =gUnknown_0200CD0C
	ldrb r0, [r0]
	strh r0, [r4, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803AD40: .4byte gUnknown_0200C420
_0803AD44: .4byte gUnknown_0200CD0C

