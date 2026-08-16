	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806D19C
sub_0806D19C: @ 0x0806D19C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x24]
	movs r2, #0x24
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _0806D1BA
	ldr r0, [r4, #0x30]
	ldr r1, [r4, #0x34]
	adds r0, r0, r1
	str r0, [r4, #0x30]
	ldrh r1, [r4, #0x28]
	adds r1, r1, r0
	strh r1, [r4, #0x28]
	b _0806D1BE
_0806D1BA:
	subs r0, r1, #1
	strh r0, [r4, #0x24]
_0806D1BE:
	adds r0, r4, #0
	bl sub_0806D0D8
	movs r1, #0x28
	ldrsh r0, [r4, r1]
	cmp r0, #0xf0
	ble _0806D1E0
	ldr r0, _0806D1E8 @ =gUnknown_08580934
	ldr r1, [r0]
	adds r1, #0x2d
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ldr r0, _0806D1EC @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
_0806D1E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D1E8: .4byte gUnknown_08580934
_0806D1EC: .4byte gUnknown_03001FBC

