	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806B87C
sub_0806B87C: @ 0x0806B87C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806B8F4 @ =gUnknown_085819C4
	adds r1, r4, #0
	bl Proc_Start
	adds r2, r0, #0
	ldrh r1, [r4, #0x2c]
	movs r3, #1
	adds r0, r3, #0
	ands r0, r1
	movs r1, #0
	cmp r0, #0
	bne _0806B89A
	movs r1, #0x70
_0806B89A:
	str r1, [r2, #0x58]
	ldrh r1, [r4, #0x2c]
	adds r0, r3, #0
	ands r0, r1
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, #0
	beq _0806B8AC
	movs r1, #1
_0806B8AC:
	str r1, [r2, #0x5c]
	movs r4, #0
	str r4, [r2, #0x60]
	ldr r3, _0806B8F8 @ =gUnknown_030030E0
	ldrb r1, [r3]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	ldr r0, _0806B8FC @ =gUnknown_03002020
	ldr r1, [r2, #0x58]
	asrs r1, r1, #3
	strh r1, [r0]
	ldr r2, _0806B900 @ =gUnknown_03002B28
	movs r0, #0xe
	subs r0, r0, r1
	strh r0, [r2]
	ldr r0, _0806B904 @ =gUnknown_03001FFC
	strh r4, [r0]
	ldrh r1, [r3]
	ldr r0, _0806B908 @ =0x0000FFE0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _0806B90C @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806B8F4: .4byte gUnknown_085819C4
_0806B8F8: .4byte gUnknown_030030E0
_0806B8FC: .4byte gUnknown_03002020
_0806B900: .4byte gUnknown_03002B28
_0806B904: .4byte gUnknown_03001FFC
_0806B908: .4byte 0x0000FFE0
_0806B90C: .4byte 0x0000E0FF

