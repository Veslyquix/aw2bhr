	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806F5EC
sub_0806F5EC: @ 0x0806F5EC
	ldr r3, _0806F620 @ =gUnknown_030030E0
	ldrb r1, [r3]
	movs r2, #0xc0
	orrs r1, r2
	strb r1, [r3]
	ldr r1, _0806F624 @ =gUnknown_03002020
	movs r2, #0
	strh r2, [r1]
	ldr r1, _0806F628 @ =gUnknown_03002B28
	strh r2, [r1]
	ldr r1, _0806F62C @ =gUnknown_03001FFC
	strh r2, [r1]
	ldrh r2, [r3]
	ldr r1, _0806F630 @ =0x0000FFE0
	ands r1, r2
	movs r2, #0xf
	orrs r1, r2
	strh r1, [r3]
	ldrb r1, [r3]
	movs r2, #0x20
	orrs r1, r2
	strb r1, [r3]
	movs r1, #0
	str r1, [r0, #0x58]
	bx lr
	.align 2, 0
_0806F620: .4byte gUnknown_030030E0
_0806F624: .4byte gUnknown_03002020
_0806F628: .4byte gUnknown_03002B28
_0806F62C: .4byte gUnknown_03001FFC
_0806F630: .4byte 0x0000FFE0

