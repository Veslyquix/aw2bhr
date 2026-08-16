	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067300
sub_08067300: @ 0x08067300
	push {r4, lr}
	ldr r4, _08067344 @ =gUnknown_030030E0
	ldrb r1, [r4]
	movs r2, #0xc0
	orrs r1, r2
	strb r1, [r4]
	ldr r1, _08067348 @ =gUnknown_03002020
	movs r2, #0
	strh r2, [r1]
	ldr r1, _0806734C @ =gUnknown_03002B28
	strh r2, [r1]
	ldr r1, _08067350 @ =gUnknown_03001FFC
	strh r2, [r1]
	ldrh r1, [r4]
	ldr r3, _08067354 @ =0x0000FFE0
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
_08067344: .4byte gUnknown_030030E0
_08067348: .4byte gUnknown_03002020
_0806734C: .4byte gUnknown_03002B28
_08067350: .4byte gUnknown_03001FFC
_08067354: .4byte 0x0000FFE0

