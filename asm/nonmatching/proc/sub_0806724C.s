	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806724C
sub_0806724C: @ 0x0806724C
	push {r4, lr}
	ldr r4, _08067294 @ =gUnknown_030030E0
	ldrb r2, [r4]
	movs r1, #0x3f
	ands r1, r2
	movs r2, #0x80
	orrs r1, r2
	strb r1, [r4]
	ldr r1, _08067298 @ =gUnknown_03002020
	movs r2, #0
	strh r2, [r1]
	ldr r1, _0806729C @ =gUnknown_03002B28
	strh r2, [r1]
	ldr r1, _080672A0 @ =gUnknown_03001FFC
	strh r2, [r1]
	ldrh r1, [r4]
	ldr r3, _080672A4 @ =0x0000FFE0
	ands r3, r1
	ldr r1, [r0, #0x3c]
	lsls r1, r1, #4
	movs r2, #0xf
	orrs r1, r2
	orrs r3, r1
	strh r3, [r4]
	ldrb r1, [r4]
	movs r2, #0x20
	orrs r1, r2
	strb r1, [r4]
	movs r1, #0
	str r1, [r0, #0x30]
	movs r1, #0x10
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08067294: .4byte gUnknown_030030E0
_08067298: .4byte gUnknown_03002020
_0806729C: .4byte gUnknown_03002B28
_080672A0: .4byte gUnknown_03001FFC
_080672A4: .4byte 0x0000FFE0

