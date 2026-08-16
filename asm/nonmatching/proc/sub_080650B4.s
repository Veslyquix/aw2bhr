	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080650B4
sub_080650B4: @ 0x080650B4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x3c]
	ldrh r0, [r4, #0x3a]
	adds r1, r1, r0
	strh r1, [r4, #0x3a]
	ldrh r0, [r4, #0x2a]
	adds r0, r0, r1
	strh r0, [r4, #0x2a]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa0
	ble _080650E6
	ldr r0, _080650F4 @ =gUnknown_08580934
	ldr r1, [r0]
	adds r1, #0x2d
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	bl sub_08030178
	ldr r0, _080650F8 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
_080650E6:
	adds r0, r4, #0
	bl sub_08064E5C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080650F4: .4byte gUnknown_08580934
_080650F8: .4byte gUnknown_03001FBC

