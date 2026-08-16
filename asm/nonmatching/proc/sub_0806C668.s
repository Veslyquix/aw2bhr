	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806C668
sub_0806C668: @ 0x0806C668
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806C684 @ =gUnknown_08581A80
	adds r1, r4, #0
	bl Proc_Start
	adds r1, r0, #0
	ldr r0, [r4, #0x38]
	cmp r0, #0
	beq _0806C68C
	movs r0, #0
	str r0, [r1, #0x2c]
	ldr r0, _0806C688 @ =gUnknown_08581A5E
	b _0806C692
	.align 2, 0
_0806C684: .4byte gUnknown_08581A80
_0806C688: .4byte gUnknown_08581A5E
_0806C68C:
	movs r0, #8
	str r0, [r1, #0x2c]
	ldr r0, _0806C6E4 @ =gUnknown_08581A44
_0806C692:
	str r0, [r1, #0x54]
	movs r2, #0
	str r2, [r1, #0x58]
	ldr r3, _0806C6E8 @ =gUnknown_030030E0
	ldrb r1, [r3]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	ldr r0, _0806C6EC @ =gUnknown_03002020
	strh r2, [r0]
	ldr r1, _0806C6F0 @ =gUnknown_03002B28
	movs r0, #0x10
	strh r0, [r1]
	ldr r1, _0806C6F4 @ =gUnknown_03001FFC
	ldrh r0, [r1]
	strh r0, [r1]
	ldrh r1, [r3]
	ldr r0, _0806C6F8 @ =0x0000FFE0
	ands r0, r1
	strh r0, [r3]
	ldrb r1, [r3]
	subs r2, #0x21
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r3]
	ldrh r1, [r3]
	ldr r0, _0806C6FC @ =0x0000E0FF
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
_0806C6E4: .4byte gUnknown_08581A44
_0806C6E8: .4byte gUnknown_030030E0
_0806C6EC: .4byte gUnknown_03002020
_0806C6F0: .4byte gUnknown_03002B28
_0806C6F4: .4byte gUnknown_03001FFC
_0806C6F8: .4byte 0x0000FFE0
_0806C6FC: .4byte 0x0000E0FF

