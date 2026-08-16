	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806C700
sub_0806C700: @ 0x0806C700
	push {r4, lr}
	ldr r3, _0806C754 @ =gUnknown_030030E0
	ldrb r1, [r3]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	ldr r1, _0806C758 @ =gUnknown_03002020
	movs r0, #0x10
	strh r0, [r1]
	ldr r1, _0806C75C @ =gUnknown_03002B28
	movs r0, #8
	strh r0, [r1]
	ldr r1, _0806C760 @ =gUnknown_03001FFC
	ldrh r0, [r1]
	strh r0, [r1]
	ldrh r1, [r3]
	ldr r0, _0806C764 @ =0x0000FFE0
	ands r0, r1
	strh r0, [r3]
	ldrb r1, [r3]
	movs r2, #0x21
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r3]
	ldrh r1, [r3]
	ldr r0, _0806C768 @ =0x0000E0FF
	ands r0, r1
	movs r4, #0xf0
	lsls r4, r4, #4
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r3]
	ldrb r0, [r3, #1]
	ands r2, r0
	strb r2, [r3, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806C754: .4byte gUnknown_030030E0
_0806C758: .4byte gUnknown_03002020
_0806C75C: .4byte gUnknown_03002B28
_0806C760: .4byte gUnknown_03001FFC
_0806C764: .4byte 0x0000FFE0
_0806C768: .4byte 0x0000E0FF

