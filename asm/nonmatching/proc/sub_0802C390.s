	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C390
sub_0802C390: @ 0x0802C390
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0802C3B8 @ =gUnknown_03001FFC
	ldrh r3, [r4, #0x1e]
	lsls r1, r3, #0x10
	asrs r2, r1, #0x10
	asrs r1, r1, #0x11
	strh r1, [r0]
	cmp r2, #0xb
	ble _0802C3C4
	ldr r2, _0802C3BC @ =gDispIo
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r0, _0802C3C0 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
	b _0802C3C8
	.align 2, 0
_0802C3B8: .4byte gUnknown_03001FFC
_0802C3BC: .4byte gDispIo
_0802C3C0: .4byte gUnknown_03001FBC
_0802C3C4:
	adds r0, r3, #1
	strh r0, [r4, #0x1e]
_0802C3C8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

